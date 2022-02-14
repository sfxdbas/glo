-- TRUNCATE SIM_SWAP_MSISDNS;

SELECT * FROM SIM_SWAP_MSISDNS 
-- WHERE LEFT(MSISDN, 4) = '#234'
;

UPDATE SIM_SWAP_MSISDNS
SET MSISDN = replace(msisdn, '#234', 0)
WHERE LEFT(MSISDN, 4) = '#234'
;


select count(1) from SIM_SWAP_MSISDNS mps
where not exists 
(select 1 from msisdn_provision_status fehm where fehm.msisdn = mps.msisdn)
;

select count(1) from SIM_SWAP_MSISDNS  mps
where not  exists 
(select 1 from BFP_SYNC_LOG fehm where fehm.msisdn = mps.msisdn)
;

-- >> SIM swap
INSERT INTO msisdn_provision_status
WITH T1 AS (
SELECT HIBERNATE_SEQUENCE.NEXTVAL, true, NOW, false, NOW, NULL,MSISDN, SIM_SERIAL, 'ACTIVE', NULL,
	INSTANCE_IP, INSTANCE_PORT, NULL, NULL, UNIQUE_ID, NULL, NULL, NULL, NULL, NULL
	, RANK() OVER (PARTITION BY MSISDN ORDER BY CREATE_DATE DESC )
FROM BFP_SYNC_LOG
WHERE MSISDN IN 
(
select msisdn from SIM_SWAP_MSISDNS
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
	hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn, 'MCENTRIC' as operation_channeL, 'MANUAL_SWAP' as OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status, 
	rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in ( select msisdn from sim_swap_msisdns )
) 
select hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn,  operation_channeL, OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status 
from t1
where rank = 1
;



with t1 as (
select
 pk,	 rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in ( select msisdn from sim_swap_msisdns )
) 
update msisdn_provision_status  a
set a.imsi = (select imsi from sim_swap_msisdns ssm where ssm.msisdn = a.msisdn),
	a.sim_serial = (select sim_serial from sim_swap_msisdns ssm where ssm.msisdn = a.msisdn),
	a.last_modified = now()
from t1 
where t1.pk = a.pk  
and rank = 1
;

