
select * from activation_sync_log asl ;
select * from activation_retry_log arl ;

--insert into activation_sync_log
select pk, active, create_date, deleted, last_modified, activation_attempt_count::int, activation_status, nps_push_retry_count::int, 
	nps_push_status, registration_push_retry_count::int, registration_push_status, activation_type, platform, record_id, registration_type,
	imsi,activation_requery_status, activation_request_reason, order_id, activation_requery_count::int
from (
select 
	hibernate_sequence.nextval as pk,true as active,now as create_date,false as deleted,now as last_modified,null activation_attempt_count,
	null as activation_status,null as nps_push_retry_count,null as nps_push_status,null as registration_push_retry_count,
	null as registration_push_status,'UNBAR' as activation_type,mps.platform,bsl.pk as record_id,bsl.reg_type as registration_type,
	mps.imsi,null as activation_requery_status,null as activation_request_reason,null as order_id,null as activation_requery_count
	,row_number () over (partition by bsl.pk order by bsl.create_date desc )
from bfp_sync_log bsl -- focus on multi comment part
join msisdn_provision_status mps on bsl.msisdn = mps.msisdn 
where bsl.bfpsyncstatusenum ='SUCCESS'
and exists (select 1 from asl_arl_repush_29102021 aar where aar.msisdn = bsl.msisdn )
and not exists (select 1 from activation_sync_log asl where asl.record_id = bsl.pk and asl.activation_type='UNBAR')
) a where row_number =1
;

--insert into activation_retry_log 
select pk, active, create_date, deleted, last_modified, activation_status, nps_push_status, registration_push_status, retry_type,
	activation_sync_log_fk,	record_id, partial_activation::bool
from (
select 
	hibernate_sequence.nextval as pk, true as active,now as create_date,false as deleted,now as last_modified, null as activation_status,
	null as nps_push_status,null as registration_push_status,'HPROV' retry_type,asl.pk activation_sync_log_fk,bsl.pk record_id, 
	null as	partial_activation
	,row_number () over (partition by bsl.pk order by bsl.create_date desc )
from activation_sync_log asl
join bfp_sync_log bsl on asl.record_id =bsl.pk
where bsl.bfpsyncstatusenum ='SUCCESS'
and exists (select 1 from asl_arl_repush_29102021 aar where aar.msisdn = bsl.msisdn )
and not exists (select 1 from activation_retry_log arl where arl.activation_sync_log_fk = asl.pk and arl.retry_type ='HPROV')
) a where row_number =1
;


---------------------------------------------------------------------------------------


--insert into activation_sync_log
select pk, active, create_date, deleted, last_modified, activation_attempt_count::int, activation_status, nps_push_retry_count::int, 
	nps_push_status, registration_push_retry_count::int, registration_push_status, activation_type, platform, record_id, registration_type,
	imsi,activation_requery_status, activation_request_reason, order_id, activation_requery_count::int
from (
select 
	hibernate_sequence.nextval as pk,true as active,now as create_date,false as deleted,now as last_modified,null activation_attempt_count,
	null as activation_status,null as nps_push_retry_count,null as nps_push_status,null as registration_push_retry_count,
	null as registration_push_status,'UNBAR' as activation_type,mps.platform,bsl.pk as record_id,bsl.reg_type as registration_type,
	mps.imsi,null as activation_requery_status,null as activation_request_reason,null as order_id,null as activation_requery_count
	,row_number () over (partition by bsl.pk order by bsl.create_date desc )
from bfp_sync_log bsl -- focus on multi comment part
join msisdn_provision_status mps on bsl.msisdn = mps.msisdn 
where bsl.bfpsyncstatusenum ='SUCCESS'
and exists (select 1 from asl_arl_repush_29102021 aar where aar.msisdn = bsl.msisdn )
and not exists (select 1 from activation_sync_log asl where asl.record_id = bsl.pk and asl.activation_type='UNBAR')
) a where row_number =1
;

--insert into activation_retry_log 
select pk, active, create_date, deleted, last_modified, activation_status, nps_push_status, registration_push_status, retry_type,
	activation_sync_log_fk,	record_id, partial_activation::bool
from (
select 
	hibernate_sequence.nextval as pk, true as active,now as create_date,false as deleted,now as last_modified, null as activation_status,
	null as nps_push_status,null as registration_push_status,'ESB' retry_type,asl.pk activation_sync_log_fk,bsl.pk record_id, 
	null as	partial_activation
	,row_number () over (partition by bsl.pk order by bsl.create_date desc )
from activation_sync_log asl
join bfp_sync_log bsl on asl.record_id =bsl.pk
where bsl.bfpsyncstatusenum ='SUCCESS'
and exists (select 1 from asl_arl_repush_29102021 aar where aar.msisdn = bsl.msisdn )
and not exists (select 1 from activation_retry_log arl where /*arl.activation_sync_log_fk = asl.pk
and*/ arl.record_id = asl.record_id and arl.retry_type ='ESB')
) a  where row_number =1
;


