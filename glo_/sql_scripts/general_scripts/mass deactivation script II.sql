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
set status = 'Deactivated',
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
and t1.pk  between  38897550 and 68718136 ;
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
and t1.pk  between  68738658 and 133022243 ;
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
and t1.pk  between  133026103 and 153833554 ;
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
and t1.pk  between  153834279 and 181366004 ;
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
and t1.pk  between  181366489 and 202672597 ;
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
and t1.pk  between  202701127 and 226902880 ;
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
and t1.pk  between  227038085 and 243971205 ;
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
and t1.pk  between  243989854 and 260656858 ;
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
and t1.pk  between  260656999 and 282511176 ;
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
and t1.pk  between  282534704 and 299638078 ;
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
and t1.pk  between  299638079 and 312625201 ;
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
and t1.pk  between  312629161 and 325861591 ;
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
and t1.pk  between  325861662 and 337374038 ;
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
and t1.pk  between  337379337 and 352293970 ;
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
and t1.pk  between  352319710 and 366708383 ;
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
and t1.pk  between  366740633 and 382429246 ;
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
and t1.pk  between  382439003 and 395294704 ;
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
and t1.pk  between  395294705 and 405243096 ;
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
and t1.pk  between  405257857 and 416690583 ;
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
and t1.pk  between  416690683 and 426916955 ;
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
and t1.pk  between  426982591 and 439432504 ;
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
and t1.pk  between  439472951 and 450968297 ;
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
and t1.pk  between  450983084 and 480227923 ;
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
and t1.pk  between  480235819 and 484115421 ;
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
and t1.pk  between  484121700 and 488731857 ;
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
and t1.pk  between  488733444 and 489119080 ;
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
and t1.pk  between  489119408 and 489570107 ;
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
and t1.pk  between  489570923 and 489891027 ;
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
and t1.pk  between  489891362 and 489959387 ;
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
and t1.pk  between  489959445 and 490033226 ;
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
and t1.pk  between  490033263 and 490082598 ;
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
and t1.pk  between  490082624 and 490128065 ;
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
and t1.pk  between  490128066 and 490202879 ;
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
and t1.pk  between  490202881 and 490249808 ;
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
and t1.pk  between  490249809 and 490293260 ;
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
and t1.pk  between  490293284 and 490339038 ;
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
and t1.pk  between  490339039 and 490390013 ;
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
and t1.pk  between  490390014 and 490429947 ;
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
and t1.pk  between  490429948 and 490452862 ;
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
and t1.pk  between  490452971 and 490470459 ;
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
and t1.pk  between  490470461 and 490480211 ;
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
and t1.pk  between  490480212 and 498640258 ;
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
and t1.pk  between  498646788 and 502880531 ;
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
and t1.pk  between  502880581 and 502899258 ;
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
and t1.pk  between  502899259 and 502907903 ;
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
and t1.pk  between  502907905 and 502923404 ;
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
and t1.pk  between  502923405 and 502933863 ;
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
and t1.pk  between  502933864 and 502967571 ;
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
and t1.pk  between  502967584 and 502986208 ;
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
and t1.pk  between  502986233 and 503004253 ;
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
and t1.pk  between  503004275 and 503021345 ;
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
and t1.pk  between  503021347 and 503037359 ;
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
and t1.pk  between  503037413 and 503050385 ;
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
and t1.pk  between  503050406 and 503060953 ;
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
and t1.pk  between  503060968 and 503068620 ;
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
and t1.pk  between  503068627 and 503073458 ;
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
and t1.pk  between  503073460 and 503077235 ;
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
and t1.pk  between  503077236 and 503080923 ;
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
and t1.pk  between  503080932 and 503085937 ;
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
and t1.pk  between  503085938 and 503091028 ;
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
and t1.pk  between  503091034 and 503094937 ;
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
and t1.pk  between  503094938 and 503099165 ;
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
and t1.pk  between  503099167 and 503102608 ;
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
and t1.pk  between  503102610 and 503105619 ;
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
and t1.pk  between  503105621 and 503108059 ;
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
and t1.pk  between  503108062 and 503110781 ;
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
and t1.pk  between  503110785 and 503113324 ;
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
and t1.pk  between  503113327 and 503115676 ;
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
and t1.pk  between  503115681 and 503117724 ;
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
and t1.pk  between  503117725 and 503121448 ;
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
and t1.pk  between  503121459 and 503128065 ;
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
and t1.pk  between  503128069 and 503132776 ;
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
and t1.pk  between  503132777 and 503137368 ;
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
and t1.pk  between  503137371 and 503141986 ;
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
and t1.pk  between  503141990 and 503146304 ;
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
and t1.pk  between  503146312 and 503149812 ;
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
and t1.pk  between  503149817 and 503152882 ;
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
and t1.pk  between  503152886 and 503155289 ;
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
and t1.pk  between  503155290 and 503157869 ;
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
and t1.pk  between  503157870 and 503161833 ;
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
and t1.pk  between  503161837 and 503169047 ;
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
and t1.pk  between  503169048 and 503174581 ;
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
and t1.pk  between  503174584 and 503180591 ;
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
and t1.pk  between  503180603 and 503186522 ;
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
and t1.pk  between  503186529 and 503192837 ;
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
and t1.pk  between  503192841 and 503198692 ;
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
and t1.pk  between  503198701 and 503204728 ;
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
and t1.pk  between  503204739 and 503211312 ;
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
and t1.pk  between  503211314 and 503221126 ;
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
and t1.pk  between  503221157 and 503230876 ;
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
and t1.pk  between  503230879 and 503237678 ;
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
and t1.pk  between  503237685 and 503245781 ;
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
and t1.pk  between  503245782 and 503254825 ;
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
and t1.pk  between  503254827 and 503264036 ;
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
and t1.pk  between  503264043 and 503268342 ;
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
and t1.pk  between  503268343 and 503274872 ;
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
and t1.pk  between  503274878 and 503277767 ;
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
and t1.pk  between  503277771 and 503284060 ;
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
and t1.pk  between  503284061 and 503292583 ;
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
and t1.pk  between  503292587 and 503295938 ;
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
and t1.pk  between  503295939 and 503300928 ;
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
and t1.pk  between  503300931 and 503308265 ;
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
and t1.pk  between  503308267 and 503316752 ;
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
and t1.pk  between  503316754 and 503323358 ;
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
and t1.pk  between  503323365 and 503332722 ;
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
and t1.pk  between  503332734 and 503338304 ;
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
and t1.pk  between  503338306 and 503345572 ;
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
and t1.pk  between  503345576 and 503350434 ;
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
and t1.pk  between  503350436 and 503354089 ;
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
and t1.pk  between  503354090 and 503359904 ;
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
and t1.pk  between  503359905 and 503361937 ;
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
and t1.pk  between  503361939 and 503364311 ;
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
and t1.pk  between  503364315 and 503367943 ;
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
and t1.pk  between  503367944 and 503370079 ;
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
and t1.pk  between  503370084 and 503372214 ;
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
and t1.pk  between  503372216 and 503374924 ;
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
and t1.pk  between  503374927 and 503377462 ;
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
and t1.pk  between  503377463 and 503379868 ;
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
and t1.pk  between  503379869 and 503382407 ;
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
and t1.pk  between  503382411 and 503385622 ;
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
and t1.pk  between  503385627 and 503387499 ;
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
and t1.pk  between  503387500 and 503391242 ;
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
and t1.pk  between  503391243 and 503394915 ;
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
and t1.pk  between  503394918 and 503398013 ;
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
and t1.pk  between  503398014 and 503404747 ;
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
and t1.pk  between  503404749 and 503409145 ;
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
and t1.pk  between  503409146 and 503411215 ;
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
and t1.pk  between  503411219 and 503417249 ;
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
and t1.pk  between  503417250 and 503419317 ;
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
and t1.pk  between  503419319 and 503425148 ;
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
and t1.pk  between  503425161 and 503442944 ;
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
and t1.pk  between  503442948 and 503452838 ;
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
and t1.pk  between  503452846 and 503461843 ;
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
and t1.pk  between  503461845 and 503471913 ;
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
and t1.pk  between  503471943 and 503480394 ;
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
and t1.pk  between  503480399 and 503487981 ;
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
and t1.pk  between  503487995 and 503495843 ;
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
and t1.pk  between  503495855 and 503503155 ;
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
and t1.pk  between  503503159 and 503510277 ;
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
and t1.pk  between  503510286 and 503517026 ;
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
and t1.pk  between  503517029 and 503526660 ;
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
and t1.pk  between  503526661 and 503535221 ;
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
and t1.pk  between  503535235 and 503548449 ;
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
and t1.pk  between  503548525 and 503562744 ;
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
and t1.pk  between  503562753 and 503571599 ;
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
and t1.pk  between  503571608 and 503582476 ;
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
and t1.pk  between  503582477 and 503585279 ;
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
and t1.pk  between  503585280 and 503588976 ;
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
and t1.pk  between  503588978 and 503614276 ;
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
and t1.pk  between  503614277 and 503627797 ;
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
and t1.pk  between  503627806 and 503643598 ;
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
and t1.pk  between  503643599 and 503657144 ;
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
and t1.pk  between  503657146 and 503678145 ;
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
and t1.pk  between  503678447 and 503689651 ;
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
and t1.pk  between  503689652 and 503690809 ;
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
and t1.pk  between  503690810 and 503691804 ;
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
and t1.pk  between  503691805 and 503708481 ;
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
and t1.pk  between  503708482 and 503727222 ;
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
and t1.pk  between  503727223 and 503749818 ;
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
and t1.pk  between  503749820 and 503770466 ;
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
and t1.pk  between  503770467 and 503789009 ;
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
and t1.pk  between  503789010 and 503810826 ;
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
and t1.pk  between  503810869 and 503839362 ;
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
and t1.pk  between  503839363 and 503848132 ;
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
and t1.pk  between  503848141 and 503856420 ;
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
and t1.pk  between  503856436 and 503865391 ;
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
and t1.pk  between  503865424 and 503891303 ;
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
and t1.pk  between  503891311 and 503899844 ;
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
and t1.pk  between  503899858 and 503909867 ;
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
and t1.pk  between  503909868 and 503918114 ;
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
and t1.pk  between  503918116 and 503935499 ;
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
and t1.pk  between  503935549 and 503944910 ;
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
and t1.pk  between  503944913 and 503954577 ;
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
and t1.pk  between  503954578 and 503965342 ;
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
and t1.pk  between  503965343 and 503971175 ;
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
and t1.pk  between  503971176 and 503977520 ;
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
and t1.pk  between  503977585 and 503993903 ;
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
and t1.pk  between  503993913 and 507584228 ;
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
and t1.pk  between  507584441 and 507678799 ;
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
and t1.pk  between  507678835 and 507765428 ;
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
and t1.pk  between  507765437 and 507843702 ;
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
and t1.pk  between  507844017 and 507913329 ;
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
and t1.pk  between  507913475 and 507965680 ;
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
and t1.pk  between  507965702 and 507997708 ;
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
and t1.pk  between  507997709 and 508002147 ;
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
and t1.pk  between  508002148 and 508006546 ;
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
and t1.pk  between  508006550 and 508012131 ;
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
and t1.pk  between  508012132 and 508016222 ;
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
and t1.pk  between  508016224 and 508021004 ;
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
and t1.pk  between  508021007 and 508024510 ;
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
and t1.pk  between  508024511 and 508027272 ;
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
and t1.pk  between  508027275 and 508029505 ;
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
and t1.pk  between  508029507 and 508032929 ;
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
and t1.pk  between  508032934 and 508035147 ;
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
and t1.pk  between  508035148 and 508037038 ;
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
and t1.pk  between  508037039 and 508046069 ;
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
and t1.pk  between  508046121 and 508062739 ;
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
and t1.pk  between  508062741 and 508067977 ;
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
and t1.pk  between  508067981 and 508072857 ;
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
and t1.pk  between  508072858 and 508076397 ;
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
and t1.pk  between  508076398 and 508079412 ;
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
and t1.pk  between  508079415 and 508081777 ;
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
and t1.pk  between  508081778 and 508085150 ;
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
and t1.pk  between  508085153 and 508103694 ;
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
and t1.pk  between  508103697 and 508124559 ;
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
and t1.pk  between  508124563 and 508145150 ;
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
and t1.pk  between  508145177 and 508162022 ;
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
and t1.pk  between  508162031 and 508172194 ;
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
and t1.pk  between  508172197 and 508190630 ;
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
and t1.pk  between  508190633 and 508200474 ;
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
and t1.pk  between  508200477 and 508213081 ;
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
and t1.pk  between  508213082 and 508219146 ;
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
and t1.pk  between  508219162 and 508232230 ;
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
and t1.pk  between  508232240 and 508249166 ;
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
and t1.pk  between  508249172 and 508259878 ;
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
and t1.pk  between  508259890 and 508265432 ;
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
and t1.pk  between  508265433 and 508273634 ;
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
and t1.pk  between  508273636 and 508284746 ;
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
and t1.pk  between  508284747 and 508302131 ;
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
and t1.pk  between  508302135 and 508325953 ;
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
and t1.pk  between  508325985 and 508350243 ;
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
and t1.pk  between  508350245 and 508370664 ;
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
and t1.pk  between  508370680 and 508395421 ;
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
and t1.pk  between  508395426 and 508419449 ;
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
and t1.pk  between  508419483 and 508443191 ;
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
and t1.pk  between  508443314 and 508469740 ;
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
and t1.pk  between  508469742 and 508512386 ;
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
and t1.pk  between  508512432 and 508547727 ;
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
and t1.pk  between  508547794 and 508554063 ;
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
and t1.pk  between  508554064 and 508567616 ;
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
and t1.pk  between  508567850 and 508579918 ;
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
and t1.pk  between  508579924 and 508591467 ;
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
and t1.pk  between  508591534 and 508606654 ;
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
and t1.pk  between  508606994 and 508629376 ;
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
and t1.pk  between  508629377 and 508652717 ;
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
and t1.pk  between  508652828 and 508679090 ;
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
and t1.pk  between  508679092 and 508726366 ;
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
and t1.pk  between  508726367 and 508762915 ;
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
and t1.pk  between  508762916 and 508796798 ;
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
and t1.pk  between  508796800 and 508828686 ;
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
and t1.pk  between  508828692 and 508890955 ;
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
and t1.pk  between  508890956 and 509038286 ;
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
and t1.pk  between  509039219 and 509149756 ;
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
and t1.pk  between  509150553 and 510736827 ;
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
and t1.pk  between  510736830 and 510752987 ;
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
and t1.pk  between  510753018 and 510770377 ;
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
and t1.pk  between  510770407 and 510787312 ;
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
and t1.pk  between  510787319 and 510806006 ;
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
and t1.pk  between  510806016 and 510827290 ;
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
and t1.pk  between  510827292 and 510846102 ;
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
and t1.pk  between  510846114 and 510855762 ;
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
and t1.pk  between  510855766 and 510860835 ;
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
and t1.pk  between  510860836 and 510866335 ;
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
and t1.pk  between  510866338 and 510871117 ;
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
and t1.pk  between  510871121 and 510874717 ;
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
and t1.pk  between  510874718 and 510877796 ;
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
and t1.pk  between  510877797 and 510880359 ;
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
and t1.pk  between  510880360 and 510883500 ;
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
and t1.pk  between  510883503 and 510894298 ;
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
and t1.pk  between  510894315 and 510899978 ;
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
and t1.pk  between  510899985 and 510904691 ;
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
and t1.pk  between  510904692 and 510907799 ;
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
and t1.pk  between  510907809 and 510914015 ;
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
and t1.pk  between  510914017 and 510928799 ;
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
and t1.pk  between  510928802 and 510943713 ;
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
and t1.pk  between  510943723 and 510959266 ;
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
and t1.pk  between  510959288 and 510975241 ;
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
and t1.pk  between  510975249 and 510988421 ;
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
and t1.pk  between  510988439 and 511000384 ;
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
and t1.pk  between  511000390 and 511012246 ;
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
and t1.pk  between  511012256 and 511028541 ;
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
and t1.pk  between  511028579 and 511040131 ;
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
and t1.pk  between  511040139 and 511047330 ;
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
and t1.pk  between  511047334 and 511056498 ;
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
and t1.pk  between  511056500 and 511069244 ;
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
and t1.pk  between  511069305 and 511081516 ;
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
and t1.pk  between  511081525 and 511095842 ;
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
and t1.pk  between  511095871 and 511113920 ;
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
and t1.pk  between  511113922 and 511130124 ;
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
and t1.pk  between  511130132 and 511144283 ;
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
and t1.pk  between  511144288 and 511164343 ;
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
and t1.pk  between  511164345 and 511180611 ;
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
and t1.pk  between  511180638 and 511202852 ;
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
and t1.pk  between  511202891 and 511219476 ;
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
and t1.pk  between  511219477 and 511240457 ;
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
and t1.pk  between  511240460 and 511260441 ;
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
and t1.pk  between  511260444 and 511273830 ;
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
and t1.pk  between  511273831 and 511290266 ;
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
and t1.pk  between  511290331 and 511297220 ;
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
and t1.pk  between  511297222 and 511304901 ;
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
and t1.pk  between  511304928 and 511308392 ;
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
and t1.pk  between  511308394 and 511312114 ;
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
and t1.pk  between  511312115 and 511318219 ;
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
and t1.pk  between  511318230 and 511324023 ;
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
and t1.pk  between  511324042 and 511333608 ;
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
and t1.pk  between  511333609 and 511343101 ;
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
and t1.pk  between  511343102 and 511350769 ;
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
and t1.pk  between  511350803 and 511371028 ;
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
and t1.pk  between  511371620 and 511441912 ;
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
and t1.pk  between  511441913 and 511479513 ;
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
and t1.pk  between  511479739 and 511516182 ;
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
and t1.pk  between  511516190 and 511538876 ;
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
and t1.pk  between  511538887 and 511555601 ;
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
and t1.pk  between  511555603 and 511585522 ;
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
and t1.pk  between  511585526 and 511626513 ;
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
and t1.pk  between  511626762 and 511645242 ;
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
and t1.pk  between  511645243 and 511663450 ;
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
and t1.pk  between  511663454 and 511676817 ;
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
and t1.pk  between  511676823 and 511683718 ;
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
and t1.pk  between  511683719 and 511692420 ;
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
and t1.pk  between  511692421 and 511699832 ;
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
and t1.pk  between  511699833 and 511705418 ;
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
and t1.pk  between  511705439 and 511716152 ;
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
and t1.pk  between  511716160 and 511742135 ;
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
and t1.pk  between  511742137 and 511793308 ;
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
and t1.pk  between  511793371 and 511839550 ;
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
and t1.pk  between  511839555 and 514737196 ;
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
and t1.pk  between  514754678 and 521874025 ;
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
and t1.pk  between  521874056 and 521928161 ;
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
and t1.pk  between  521928182 and 521986460 ;
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
and t1.pk  between  521986636 and 522039334 ;
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
and t1.pk  between  522039370 and 522057289 ;
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
and t1.pk  between  522057372 and 522066262 ;
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
and t1.pk  between  522066268 and 522073980 ;
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
and t1.pk  between  522073981 and 522079162 ;
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
and t1.pk  between  522079163 and 522083368 ;
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
and t1.pk  between  522083369 and 522086807 ;
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
and t1.pk  between  522086811 and 522106320 ;
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
and t1.pk  between  522106321 and 522115093 ;
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
and t1.pk  between  522115108 and 522120740 ;
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
and t1.pk  between  522120744 and 522134917 ;
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
and t1.pk  between  522134919 and 522165810 ;
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
and t1.pk  between  522165855 and 522195195 ;
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
and t1.pk  between  522195201 and 522223721 ;
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
and t1.pk  between  522223737 and 522240369 ;
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
and t1.pk  between  522240382 and 522271638 ;
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
and t1.pk  between  522271899 and 522297216 ;
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
and t1.pk  between  522297229 and 522329167 ;
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
and t1.pk  between  522329236 and 522362145 ;
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
and t1.pk  between  522362157 and 522396760 ;
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
and t1.pk  between  522396827 and 522427745 ;
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
and t1.pk  between  522427781 and 522456700 ;
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
and t1.pk  between  522456702 and 522494492 ;
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
and t1.pk  between  522494500 and 522535636 ;
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
and t1.pk  between  522535641 and 522561290 ;
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
and t1.pk  between  522561363 and 522613902 ;
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
and t1.pk  between  522613903 and 522640707 ;
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
and t1.pk  between  522640709 and 522667401 ;
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
and t1.pk  between  522667410 and 522692470 ;
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
and t1.pk  between  522692592 and 522725750 ;
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
and t1.pk  between  522725751 and 522774644 ;
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
and t1.pk  between  522774680 and 522789399 ;
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
and t1.pk  between  522789631 and 522804778 ;
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
and t1.pk  between  522804789 and 522831071 ;
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
and t1.pk  between  522831072 and 522853557 ;
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
and t1.pk  between  522853641 and 522872866 ;
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
and t1.pk  between  522872887 and 522885103 ;
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
and t1.pk  between  522885104 and 522893684 ;
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
and t1.pk  between  522893724 and 522906483 ;
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
and t1.pk  between  522906490 and 522911637 ;
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
and t1.pk  between  522911639 and 522918265 ;
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
and t1.pk  between  522918266 and 522929140 ;
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
and t1.pk  between  522929147 and 522940112 ;
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
and t1.pk  between  522940125 and 522948760 ;
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
and t1.pk  between  522948761 and 522959862 ;
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
and t1.pk  between  522959863 and 522963162 ;
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
and t1.pk  between  522963177 and 522967513 ;
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
and t1.pk  between  522967516 and 522978266 ;
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
and t1.pk  between  522978274 and 522992572 ;
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
and t1.pk  between  522992673 and 523001825 ;
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
and t1.pk  between  523001835 and 523016989 ;
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
and t1.pk  between  523016992 and 523023098 ;
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
and t1.pk  between  523023099 and 523043733 ;
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
and t1.pk  between  523043841 and 523061451 ;
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
and t1.pk  between  523061498 and 523083436 ;
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
and t1.pk  between  523083441 and 523112616 ;
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
and t1.pk  between  523112617 and 523140070 ;
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
and t1.pk  between  523140080 and 523169341 ;
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
and t1.pk  between  523169345 and 523189228 ;
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
and t1.pk  between  523189231 and 523213206 ;
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
and t1.pk  between  523213247 and 523228479 ;
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
and t1.pk  between  523228520 and 523248794 ;
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
and t1.pk  between  523248816 and 523267705 ;
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
and t1.pk  between  523267707 and 523284570 ;
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
and t1.pk  between  523284571 and 523306849 ;
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
and t1.pk  between  523306851 and 523326104 ;
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
and t1.pk  between  523326105 and 523349477 ;
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
and t1.pk  between  523349533 and 523361557 ;
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
and t1.pk  between  523361558 and 523367333 ;
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
and t1.pk  between  523367334 and 523394679 ;
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
and t1.pk  between  523394712 and 523423590 ;
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
and t1.pk  between  523423622 and 523675917 ;
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
and t1.pk  between  523675918 and 523780138 ;
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
and t1.pk  between  523780152 and 523846717 ;
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
and t1.pk  between  523846718 and 523854527 ;
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
and t1.pk  between  523854528 and 523861994 ;
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
and t1.pk  between  523861996 and 523866561 ;
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
and t1.pk  between  523866589 and 523871093 ;
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
and t1.pk  between  523871094 and 523887934 ;
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
and t1.pk  between  523887941 and 523895520 ;
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
and t1.pk  between  523895522 and 523900340 ;
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
and t1.pk  between  523900341 and 523934319 ;
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
and t1.pk  between  523934377 and 523980311 ;
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
and t1.pk  between  523980455 and 524011064 ;
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
and t1.pk  between  524011070 and 524059296 ;
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
and t1.pk  between  524059310 and 524088285 ;
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
and t1.pk  between  524088307 and 524118390 ;
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
and t1.pk  between  524118392 and 524145201 ;
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
and t1.pk  between  524145260 and 524184120 ;
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
and t1.pk  between  524184250 and 524321712 ;
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
and t1.pk  between  524321861 and 524398305 ;
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
and t1.pk  between  524398307 and 524427994 ;
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
and t1.pk  between  524427998 and 524472394 ;
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
and t1.pk  between  524472396 and 524722615 ;
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
and t1.pk  between  524722626 and 524746092 ;
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
and t1.pk  between  524746130 and 524765185 ;
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
and t1.pk  between  524765189 and 524777212 ;
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
and t1.pk  between  524777219 and 524779591 ;
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
and t1.pk  between  524779592 and 524813631 ;
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
and t1.pk  between  524813637 and 524851633 ;
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
and t1.pk  between  524851693 and 524891053 ;
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
and t1.pk  between  524891056 and 524932058 ;
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
and t1.pk  between  524932063 and 524973987 ;
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
and t1.pk  between  524973989 and 525017523 ;
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
and t1.pk  between  525017524 and 525060045 ;
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
and t1.pk  between  525060046 and 525125216 ;
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
and t1.pk  between  525125224 and 525158092 ;
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
and t1.pk  between  525158301 and 525206836 ;
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
and t1.pk  between  525206871 and 525260955 ;
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
and t1.pk  between  525260989 and 525499379 ;
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
and t1.pk  between  525499384 and 526899396 ;
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
and t1.pk  between  526914215 and 533791008 ;
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
and t1.pk  between  533791013 and 533853245 ;
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
and t1.pk  between  533853252 and 533870751 ;
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
and t1.pk  between  533870753 and 533880045 ;
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
and t1.pk  between  533880048 and 533907011 ;
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
and t1.pk  between  533907057 and 533923239 ;
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
and t1.pk  between  533923240 and 533960454 ;
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
and t1.pk  between  533960457 and 534064359 ;
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
and t1.pk  between  534064370 and 534126627 ;
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
and t1.pk  between  534126704 and 534254671 ;
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
and t1.pk  between  534254687 and 534371218 ;
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
and t1.pk  between  534371691 and 534527871 ;
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
and t1.pk  between  534527928 and 534973809 ;
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
and t1.pk  between  534974628 and 535428610 ;
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
and t1.pk  between  535429477 and 535671202 ;
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
and t1.pk  between  535671203 and 565979194 ;
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
and t1.pk  between  565983081 and 566319564 ;
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
and t1.pk  between  566319603 and 566418555 ;
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
and t1.pk  between  566418836 and 566731207 ;
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
and t1.pk  between  566731812 and 567194518 ;
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
and t1.pk  between  567196665 and 568322337 ;
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
and t1.pk  between  568323097 and 571098902 ;
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
and t1.pk  between  571098987 and 573614968 ;
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
and t1.pk  between  573614969 and 610737905 ;
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
and t1.pk  between  610740229 and 612446515 ;
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
and t1.pk  between  612446847 and 612884531 ;
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
and t1.pk  between  612884766 and 614551795 ;
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
and t1.pk  between  614558457 and 630129023 ;
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
and t1.pk  between  630133985 and 653396551 ;
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
and t1.pk  between  653403070 and 658914383 ;
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
and t1.pk  between  658936634 and 664377293 ;
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
and t1.pk  between  664380107 and 669995050 ;
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
and t1.pk  between  669997164 and 677009743 ;
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
and t1.pk  between  677010399 and 683472012 ;
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
and t1.pk  between  683490204 and 688193736 ;
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
and t1.pk  between  688208314 and 693859788 ;
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
and t1.pk  between  693865719 and 700560281 ;
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
and t1.pk  between  700573828 and 705674985 ;
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
and t1.pk  between  705674986 and 711969548 ;
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
and t1.pk  between  711974486 and 718578465 ;
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
and t1.pk  between  718616043 and 743136201 ;
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
and t1.pk  between  743141697 and 758810381 ;
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
and t1.pk  between  758812631 and 772622688 ;
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
and t1.pk  between  772625290 and 776306511 ;
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
and t1.pk  between  776310099 and 786494140 ;
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
and t1.pk  between  786498036 and 812181305 ;
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
and t1.pk  between  812181322 and 829087850 ;
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
and t1.pk  between  829096144 and 835487587 ;
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
and t1.pk  between  835490121 and 841195746 ;
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
and t1.pk  between  841202338 and 846825518 ;
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
and t1.pk  between  846856690 and 852249130 ;
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
and t1.pk  between  852253952 and 858830389 ;
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
and t1.pk  between  858839476 and 864980428 ;
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
and t1.pk  between  864982350 and 870373087 ;
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
and t1.pk  between  870373177 and 875417104 ;
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
and t1.pk  between  875417393 and 880528841 ;
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
and t1.pk  between  880533129 and 884543277 ;
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
and t1.pk  between  884553443 and 888647988 ;
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
and t1.pk  between  888647989 and 892801678 ;
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
and t1.pk  between  892814405 and 897508652 ;
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
and t1.pk  between  897547735 and 902465849 ;
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
and t1.pk  between  902468505 and 907298295 ;
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
and t1.pk  between  907303451 and 911132632 ;
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
and t1.pk  between  911153193 and 915719004 ;
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
and t1.pk  between  915741374 and 920405712 ;
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
and t1.pk  between  920420377 and 926036097 ;
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
and t1.pk  between  926036098 and 931439549 ;
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
and t1.pk  between  931439552 and 936924985 ;
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
and t1.pk  between  936929821 and 977656254 ;