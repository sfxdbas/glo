-- truncate deactivation_msisdns;

select * from deactivation_msisdns;



select count(1) from deactivation_msisdns mps
where not exists 
(select 1 from msisdn_provision_status fehm where fehm.msisdn = mps.msisdn)
;

select count(1) from deactivation_msisdns  mps
where not  exists 
(select 1 from BFP_SYNC_LOG fehm where fehm.msisdn = mps.msisdn)
;



-- >> Deactivation
INSERT INTO msisdn_provision_status
WITH T1 AS (
SELECT HIBERNATE_SEQUENCE.NEXTVAL, true, NOW, false, NOW, NULL,MSISDN, SIM_SERIAL, 'ACTIVE', NULL,
	INSTANCE_IP, INSTANCE_PORT, NULL, NULL, UNIQUE_ID, NULL, NULL, NULL, NULL, NULL
	, RANK() OVER (PARTITION BY MSISDN ORDER BY CREATE_DATE DESC )
FROM BFP_SYNC_LOG
WHERE MSISDN IN 
(
select msisdn from deactivation_msisdns
)
)
SELECT HIBERNATE_SEQUENCE.NEXTVAL, true, NOW(), false, NOW(), NULL, MSISDN,SIM_SERIAL, 'ACTIVE', NULL,
	INSTANCE_IP, INSTANCE_PORT, NULL, NULL, UNIQUE_ID, NULL, NULL, NULL, NULL, NULL 
	FROM T1 
WHERE RANK = 1 
and not exists (
select 1 from msisdn_provision_status m where t1.msisdn = m.msisdn
)
;




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