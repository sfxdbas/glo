select
    arl.PK as PK1_0_,
    arl.ACTIVE as ACTIVE2_0_,
    arl.CREATE_DATE as CREATE_D3_0_,
    arl.DELETED as DELETED4_0_,
    arl.LAST_MODIFIED as LAST_MOD5_0_,
--    arl.ACTION_TYPE as ACTION_T6_0_,
    arl.ACTIVATION_STATUS as ACTIVATI7_0_,
    arl.ACTIVATION_SYNC_LOG_FK as ACTIVAT13_0_,
    arl.NPS_PUSH_STATUS as NPS_PUSH8_0_,
    arl.PARTIAL_ACTIVATION as PARTIAL_9_0_,
    arl.RECORD_ID as RECORD_10_0_,
    arl.REGISTRATION_PUSH_STATUS as REGISTR11_0_,
    arl.RETRY_TYPE as RETRY_T12_0_
from
    ACTIVATION_RETRY_LOG arl
left outer join ACTIVATION_SYNC_LOG asl on
    arl.ACTIVATION_SYNC_LOG_FK = asl.PK
left outer join ACTIVATION_SYNC_LOG activation2_ on
    arl.ACTIVATION_SYNC_LOG_FK = activation2_.PK
where
    arl.DELETED = false
    and asl.REGISTRATION_PUSH_RETRY_COUNT <= 15
    and (activation2_.ACTIVATION_TYPE in ('UNBAR' , 'PARTIAL_UNBAR', 'UNBAR_SIMROP'))
    and arl.RETRY_TYPE = 'ESB'
    and arl.REGISTRATION_PUSH_STATUS <> 'ERROR'
    and arl.PK>0
    and 1 = 1
order by
    arl.PK asc
--limit 10
;

-- check record state 
select distinct on (msisdn) msisdn ,pk, create_date,last_modified ,activationstatusenum ,bfpsyncstatusenum,reg_type ,unique_id 
from bfp_sync_log 
where reg_type in ( 'NMSI', 'CAR')
and activationstatusenum is null 
and date(create_date) between '2022-01-01' and '2022-04-30' 
and bfpsyncstatusenum = 'SUCCESS'
order by msisdn ,create_date desc
;


-- prep for ASL
--insert into activation_sync_log 
with bsl as (
select distinct on (msisdn) msisdn ,pk, create_date,last_modified ,activationstatusenum ,bfpsyncstatusenum,reg_type ,unique_id 
from bfp_sync_log 
where reg_type in ( 'NMSI', 'CAR')
and activationstatusenum is null 
and date(create_date) between '2022-01-01' and '2022-04-30' 
and bfpsyncstatusenum = 'SUCCESS'
order by msisdn ,create_date desc 
) 
select hibernate_sequence.nextval, true, now, false,now,null,null,0,0,0,0,'UNBAR',mps.platform,bsl.pk,
bsl.reg_type,mps.imsi,null,null,null,0
from  bsl 
join msisdn_provision_status mps using (msisdn) 
where not exists 
(select 1 from activation_sync_log asl where asl.record_id = bsl.pk)
;


-- prep for ARL
-- insert into activation_retry_log
with bsl as (
select distinct on (msisdn) msisdn ,pk, create_date,last_modified ,activationstatusenum ,bfpsyncstatusenum,reg_type ,unique_id 
from bfp_sync_log 
where reg_type in ( 'NMSI', 'CAR')
and activationstatusenum is null 
and date(create_date) between '2022-01-01' and '2022-04-30' 
and bfpsyncstatusenum = 'SUCCESS'
order by msisdn ,create_date desc 
) 
select hibernate_sequence.nextval,true,now,false,now,null,null,'ERROR','ESB',asl.pk,bsl.pk,NULL  
from bsl 
/*left*/ join activation_sync_log asl on bsl.pk =asl.record_id 
--order by 1 desc
where not exists 
(select 1 from activation_retry_log arl where arl.record_id = bsl.pk and retry_type = 'ESB')