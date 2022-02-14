-- truncate deactivation_msisdns;

select * from deactivation_msisdns;




-- >> Deactivation
insert into msisdn_provision_status_log 
with t1 as (
select
	hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn, 'MCENTRIC' as operation_channeL, 'MANUAL_DEACTIVATE' as OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status, 
	rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in ( select msisdn from deactivation_msisdns )
) 
select hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn,  operation_channeL, OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status 
from t1
where rank = 1
;



with t1 as (
select
	pk, 
	rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in ( select msisdn from deactivation_msisdns )
) 
update msisdn_provision_status mps
set status = 'SUSPENDED',
	last_modified = now()
from t1 
where t1.pk = mps.pk 
and rank = 1 
;


with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
;