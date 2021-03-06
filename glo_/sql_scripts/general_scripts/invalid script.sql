-- truncate invalid_msisdns;

select * from invalid_msisdns;



select count(1) from invalid_msisdns mps
where not exists 
(select 1 from msisdn_provision_status fehm where fehm.msisdn = mps.msisdn)
;

select count(1) from invalid_msisdns  mps
where not  exists 
(select 1 from BFP_SYNC_LOG fehm where fehm.msisdn = mps.msisdn)
;



-- >> invalid_msisdns

insert into msisdn_provision_status_log 
with t1 as (
select
	hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn, 'MCENTRIC' as operation_channeL, 'INVALID_MSISDN' as OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status, 
	rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in ( select msisdn from invalid_msisdns )
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
where msisdn in ( select msisdn from invalid_msisdns )
) 
update msisdn_provision_status mps
set status = 'Invalid Msisdn',
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
where msisdn in (select msisdn from invalid_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'INVALID MSISDN',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
;





----->>>>>>>>>>>>>>>>>>>>>>>
-- for mass deactivation. 
-- first generate script
select 'with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in (select msisdn from invalid_msisdns)
)
update msisdn_provision_status mps 
set status = ''Invalid Msisdn'',
	last_modified = now()
from t1 
where t1.pk = mps.pk 
and rank = 1 
and t1.pk  between  '|| min(pk)||' and '  ||MAX(pk)  ||' ;'
FROM
  (SELECT
    /*+ parallel*/
    pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM msisdn_provision_status
  where msisdn in (select msisdn from invalid_msisdns)
  )
GROUP BY Nn
ORDER BY nn ASc
;




select 'with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from invalid_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = ''INVALID MSISDN'',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  '|| min(pk)||' and '  ||MAX(pk)  ||' ;'
FROM
  (SELECT
    /*+ parallel*/
    pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM bfp_sync_log
  where msisdn in (select msisdn from invalid_msisdns)
  )
GROUP BY Nn
ORDER BY nn ASc
;