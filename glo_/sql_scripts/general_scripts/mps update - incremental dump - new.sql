--truncate incremental_dump_18042022 ;

select msisdn ,count(1) from incremental_dump_18042022 id group by 1 /*having count(1)>1*/ order by 2 desc ;
--34,400

-- create logs on mps_log
insert into msisdn_provision_status_log
with logs_on_mps_log as (
select row_number() over (partition by mps.msisdn order by mps.create_date desc),
hibernate_sequence.nextval pk, true active, now  create_date,false deleted,now  last_modified,mps.imsi,mps.msisdn,
'MANUAL-MSISDN-OPERATION' operaion_channel, 'MANUAL-MSISDN-OPERATION' operation_name,mps.sim_serial,mps.status,mps.status_reason,
mps.pk msisdn_provision_status_fk,mps.platform,mps.unique_id,mps.delta_imsi,mps.delta_sim_serial,mps.msisdn_hierarchy,mps.sim_swap_status
from incremental_dump_18042022 id, msisdn_provision_status mps 
where id.msisdn = mps.msisdn 
and id.msisdn != ''
)
select pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason, 
msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status
from logs_on_mps_log
where row_number =1
;


with tab as (
select
pk,
'update msisdn_provision_status set delta_sim_serial = null, delta_imsi = null, sim_serial = '||''''||id.sim_serial||''''||', imsi = '||''''||id.imsi||''''||' , status = '||''''||id.status||''''||' , platform = '||''''||id.platform||''''||' ,status_reason = '||''''||id.status_reason||''''||', LAST_MODIFIED = NOW() where pk = '||mps.pk||';',
id.*, mps.msisdn,mps.imsi,mps.sim_serial ,mps.status ,mps.platform ,mps.status_reason 
,row_number()over(partition by mps.msisdn order by mps.create_date desc , id."date" desc ) as rank_
from incremental_dump_18042022 id, msisdn_provision_status mps 
where id.msisdn = mps.msisdn 
and id.msisdn != ''
)
select "?column?" --* --pk,count(1) 
from tab 
where rank_ = 1
--group by 1 having count(1)>1 order by 2 desc 
;

select  msisdn  from incremental_dump_18042022 id; -- where msisdn = '019049225';
select * from msisdn_provision_status id where msisdn = '019049225';

insert into msisdn_provision_status 
(pk, active, create_date, deleted, last_modified, msisdn, imsi, sim_serial, status, platform, status_reason)
select hibernate_sequence.nextval, true, now , false, now , id.msisdn , id.imsi , id.sim_serial , id.status , id.platform , id.status_reason 
from incremental_dump_18042022 id
where not exists 
(select 1 from msisdn_provision_status mps where id.msisdn = mps.msisdn )
;

create table bfp_sync_log_incrementaldump_05052022 as
select * from (
select row_number() over (partition by bsl.msisdn order by bsl.create_date desc ) r,
*
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and exists 
(select 1 from incremental_dump_18042022 id 
where id.msisdn =bsl.msisdn
--and initcap(status) = 'Available'
)
) a where r =1
;

-- mps active, bsl archived - ACTIVATED
select /**,*/"?column?" from (
select id."date" ,row_number() over (partition by bsl.msisdn order by bsl.create_date desc , id."date" desc ),
BSL.PK,BSL.create_date ,BSL.last_modified ,BSL.msisdn ,BSL.activationstatusenum,BSL.bfpsyncstatusenum,ID.status ,
'update bfp_sync_log set activationstatusenum = ''ACTIVATED'',last_modified =NOW where /*activationstatusenum = ''ARCHIVED'' and*/ pk ='||bsl.pk||';'
from bfp_sync_log bsl, incremental_dump_18042022 id 
where id.msisdn =bsl.msisdn 
and bsl.bfpsyncstatusenum ='SUCCESS'
--and initcap(status) = 'Active'
--and activationstatusenum ='ARCHIVED'
) a 
where row_number =1
and activationstatusenum ='ARCHIVED'
and initcap(status) = 'Active'
;


-- mps available, bsl activated - DEACTIVATED
select /**,*/"?column?" from (
select row_number() over (partition by bsl.msisdn order by bsl.create_date desc, id."date" desc ),
BSL.PK,BSL.create_date ,BSL.last_modified ,BSL.msisdn ,BSL.activationstatusenum,BSL.bfpsyncstatusenum,ID.status ,
'update bfp_sync_log set activationstatusenum = ''DEACTIVATED'',last_modified =NOW ,deactivation_date = now  where activationstatusenum = ''ACTIVATED'' and msisdn ='||''''||bsl.msisdn||''''||';'
from bfp_sync_log bsl, incremental_dump_18042022 id 
where id.msisdn =bsl.msisdn 
--and initcap(status) = 'Available'
and bsl.bfpsyncstatusenum ='SUCCESS'
/*and activationstatusenum ='ACTIVATED'*/
) a 
where row_number =1
and initcap(status) = 'Available'
and activationstatusenum ='ACTIVATED'
;


select * from incremental_dump_log where date_processed = '2021-10-29';

insert into incremental_dump_log 
SELECT msisdn, imsi, sim_serial, status, platform, status_reason, "date"
,file_name,
date(now)
/* case when file_name = '102721' then '2021-10-28' 
	 when file_name = '102821' then '2021-10-29' 
end as */ date_dumped,date(now) as date_processed /*date_processed*/
FROM public.incremental_dump_18042022 id
;
