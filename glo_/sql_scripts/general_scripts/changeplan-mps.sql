-- Remove duplicate entries and leave the latest entries.
--Msisdn, sim serial constraint is added to msisdn-provision-status.

with cte as (
select row_number() over(partition by mps.msisdn, mps.sim_serial order by mps.create_date desc ) ,* 
from msisdn_provision_status mps  
) 
select * 
from cte
where row_number = 1
;

--create table msisdn_provision_status_08082021 as 
select 'delete from msisdn_provision_status where pk = '||pk||';'
--* 
from mps_duplicate_ms_entry 
--where pk in (select msisdn_provision_status_fk  from  msisdn_provision_status_log)
--where msisdn = '07052779988'
;

--create table msisdn_provision_status_log_08082021 as 
select 'delete from msisdn_provision_status_log where pk = '||pk||';'
--*
from msisdn_provision_status_log
where msisdn_provision_status_fk in 
(select pk from mps_duplicate_ms_entry)
;

select row_number() over(partition by mps.msisdn, mps.sim_serial order by mps.create_date desc ),*
from msisdn_provision_status mps where pk = 2136367956
;

select * from msisdn_provision_status_log where pk = 2836669634;

--select * from msisdn_provision_status_08082021 where pk = 2136367956;
--select * from msisdn_provision_status_log_08082021 where pk = 2836669634;