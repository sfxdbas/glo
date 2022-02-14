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
	, row_number() OVER (PARTITION BY MSISDN ORDER BY CREATE_DATE DESC )
FROM BFP_SYNC_LOG A 
WHERE EXISTS 
(
select msisdn from deactivation_msisdns B WHERE A.MSISDN = B.MSISDN
)
)
SELECT HIBERNATE_SEQUENCE.NEXTVAL, true, NOW(), false, NOW(), NULL, MSISDN,SIM_SERIAL, 'ACTIVE', NULL,
	INSTANCE_IP, INSTANCE_PORT, NULL, NULL, UNIQUE_ID, NULL, NULL, NULL, NULL, NULL 
	FROM T1 
WHERE row_number = 1 
and not exists (
select 1 from msisdn_provision_status m where t1.msisdn = m.msisdn
)
;




insert into msisdn_provision_status_log 
with t1 as (
select
	hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn, 'MCENTRIC' as operation_channeL, 'MANUAL_DEACTIVATE' as OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status, 
	row_number() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status A 
where EXISTS  ( select msisdn from deactivation_msisdns B WHERE A.MSISDN = B.MSISDN)
) 
select hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn,  operation_channeL, OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status 
from t1
where row_number = 1
;



with t1 as (
select
	pk, 
	row_number() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status A 
where EXISTS  ( select msisdn from deactivation_msisdns B WHERE A.MSISDN=B.MSISDN )
) 
update msisdn_provision_status mps
set status = 'Deactivated',
	last_modified = now()
from t1 
where t1.pk = mps.pk 
and row_number = 1 
;


with t1 as (
select
	pk,
	row_number() over ( partition by msisdn order by create_date desc )
from bfp_sync_log A
where EXISTS  ( select msisdn from deactivation_msisdns B WHERE A.MSISDN=B.MSISDN )
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and row_number = 1 
;





----->>>>>>>>>>>>>>>>>>>>>>>
-- for mass deactivation. 
-- first generate script


select 'with t1 as (
select
	pk,
	row_number() over ( partition by msisdn order by create_date desc )
from bfp_sync_log A
where EXISTS  ( select msisdn from deactivation_msisdns B WHERE A.MSISDN=B.MSISDN )
)
update bfp_sync_log bsl 
set activationstatusenum = ''DEACTIVATED'',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and row_number = 1 
and t1.pk  between  '|| min(pk)||' and '  ||MAX(pk)  ||' ;'
FROM
  (SELECT
    /*+ parallel*/
    pk,
    Ntile(1000) Over ( ORDER BY pk ) AS Nn
  FROM bfp_sync_log
  where msisdn in (select msisdn from deactivation_msisdns)
  )
GROUP BY Nn
ORDER BY nn ASc
;
;