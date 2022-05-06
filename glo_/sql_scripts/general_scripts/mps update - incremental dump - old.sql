---truncate incremental_dump_05_06_122021 ;

--select * from msisdn_provision_status_log mpsl order by 3 desc ;



-- create logs on mps_log
insert into msisdn_provision_status_log
select hibernate_sequence.nextval, true, now,false,now,mps.imsi,mps.msisdn,'MANUAL-MSISDN-OPERATION', 'MANUAL-MSISDN-OPERATION',mps.sim_serial,
mps.status,mps.status_reason,mps.pk,mps.platform,mps.unique_id,mps.delta_imsi,mps.delta_sim_serial,mps.msisdn_hierarchy,mps.sim_swap_status 
from incremental_dump_05_06_122021 id, msisdn_provision_status mps 
where id.msisdn = mps.msisdn 
and mps.sim_serial = id.sim_serial 
and id.msisdn != ''
;

with tab as (
select
pk,
'update msisdn_provision_status set imsi = '||''''||id.imsi||''''||' , status = '||''''||id.status||''''||' , platform = '||''''||id.platform||''''||' ,status_reason = '||''''||id.status_reason||''''||', LAST_MODIFIED = NOW() where pk = '||mps.pk||';',
id.*, mps.msisdn,mps.imsi,mps.sim_serial ,mps.status ,mps.platform ,mps.status_reason 
,row_number()over(partition by id.msisdn,id.sim_serial order by id.date desc ) as rank_
from incremental_dump_05_06_122021 id, msisdn_provision_status mps 
where id.msisdn = mps.msisdn 
and mps.sim_serial = id.sim_serial 
and id.msisdn != ''
--and mps.pk = 483839267
)
select "?column?" --* --pk,count(1) 
from tab 
where rank_ = 1
--group by 1 having count(1)>1 order by 2 desc 
;

select *  from incremental_dump_05_06_122021 id; -- where msisdn = '019049225';
select * from msisdn_provision_status id where msisdn = '019049225';

insert into msisdn_provision_status 
(pk, active, create_date, deleted, last_modified, msisdn, imsi, sim_serial, status, platform, status_reason)
select hibernate_sequence.nextval, true, now, false, now, id.msisdn , id.imsi , id.sim_serial , id.status , id.platform , id.status_reason 
from incremental_dump_05_06_122021 id
where not exists 
(select 1 from msisdn_provision_status mps where id.msisdn = mps.msisdn and mps.sim_serial = id.sim_serial )
;

create table bfp_sync_log_incrementaldump_07122021 as
select *
from bfp_sync_log bsl 
where exists 
(select 1 from incremental_dump_05_06_122021 id 
where id.msisdn =bsl.msisdn
and id.sim_serial = bsl.sim_serial 
and initcap(status) = 'Available')
;


select 'update bfp_sync_log set activationstatusenum = ''ARCHIVED'',last_modified =NOW,deactivation_date = now where activationstatusenum = ''ACTIVATED'' and pk ='||bsl.pk||';'
from bfp_sync_log bsl, incremental_dump_05_06_122021 id 
where id.msisdn =bsl.msisdn 
and id.sim_serial = bsl.sim_serial
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
FROM public.incremental_dump_05_06_122021
;
