-- > 48 hour   
INSERT INTO msisdn_provision_status
WITH T1 AS (
SELECT HIBERNATE_SEQUENCE.NEXTVAL, true, NOW, false, NOW, NULL,MSISDN, SIM_SERIAL, 'ACTIVE', NULL,
	INSTANCE_IP, INSTANCE_PORT, NULL, NULL, UNIQUE_ID, NULL, NULL, NULL, NULL, NULL
	, RANK() OVER (PARTITION BY MSISDN ORDER BY CREATE_DATE DESC )
FROM BFP_SYNC_LOG
WHERE MSISDN IN 
(
select msisdn from fourty_eight_hours_msisdns
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
	hibernate_sequence.nextval, true, now(), false, now(),imsi, msisdn, 'MCENTRIC' as operation_channeL, 'MANUAL_BAR_48' as OPERATION_NAME,
	sim_serial, status, status_reason , pk, platform , unique_id, delta_imsi , delta_sim_serial , msisdn_hierarchy , sim_swap_status, 
	rank() over ( partition by msisdn order by create_date desc )
from msisdn_provision_status
where msisdn in ( select msisdn from fourty_eight_hours_msisdns )
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
where msisdn in ( select msisdn from fourty_eight_hours_msisdns )
) 
update msisdn_provision_status mps
set status = 'BAR_48',
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
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  38862725 and 49146833 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  49146834 and 51557374 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  51559510 and 54007277 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  54007713 and 57806828 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  57808926 and 60027550 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  60027836 and 62149988 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  62150788 and 63605745 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  63605784 and 65504141 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  65504295 and 67739169 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  67739170 and 70215449 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  70216292 and 72805830 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  72805831 and 75421295 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  75422323 and 77883519 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  77883572 and 79836297 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  79836791 and 81941342 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  81941637 and 83837008 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  83837122 and 131245590 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  131246908 and 133712215 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  133717939 and 135516097 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  135517813 and 137287381 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  137287386 and 139152378 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  139155304 and 140743128 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  140743130 and 142782321 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  142784576 and 144653480 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  144653516 and 147367767 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  147370360 and 149037242 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  149037658 and 152004342 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  152006316 and 154199580 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  154199961 and 156960407 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  156960720 and 158381159 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  158381220 and 160354037 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  160354256 and 162527648 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  162527651 and 167664708 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  167664715 and 172753151 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  172754049 and 177213916 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  177213917 and 181369696 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  181369698 and 183927601 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  183927604 and 185906898 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  185909057 and 188525550 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  188525637 and 191532682 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  191532732 and 194117740 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  194117802 and 197099796 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  197099801 and 199533335 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  199533382 and 201833875 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  201834127 and 204116612 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  204117761 and 206188231 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  206189075 and 210236076 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  210237293 and 212212078 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  212212285 and 213821879 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  213822225 and 216084702 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  216084703 and 219603048 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  219606126 and 222037752 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  222038515 and 224155555 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  224155557 and 226042741 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  226045502 and 228152217 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  228152219 and 229566876 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  229566877 and 231541157 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  231541158 and 233515506 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  233515911 and 235316730 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  235317289 and 237627777 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  237628980 and 239787971 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  239788291 and 241873737 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  241873886 and 244221771 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  244223857 and 246232189 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  246232190 and 247696057 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  247698358 and 249375001 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  249376395 and 251261517 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  251262719 and 253540301 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  253540305 and 256552017 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  256552571 and 258859139 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  258859239 and 261057374 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  261058142 and 263008391 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  263008872 and 265308085 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  265309498 and 267545064 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  267546274 and 269948213 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  269949504 and 274010290 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  274010379 and 276156763 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  276157205 and 277942915 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  277943853 and 279061005 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  279061151 and 280156616 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  280158189 and 282235769 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  282235770 and 284043250 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  284043251 and 286124694 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  286125712 and 287952029 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  287953092 and 289866037 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  289866038 and 291609275 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  291609353 and 293674137 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  293676496 and 295517978 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  295519938 and 302726228 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  302726230 and 322816788 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  322829686 and 326347278 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  326347310 and 328636903 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  328636906 and 330895769 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  330896346 and 332413454 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  332414044 and 334665603 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  334669337 and 335922495 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  335922665 and 336927702 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  336927704 and 338212645 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  338213372 and 339574089 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  339583597 and 341836258 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  341837076 and 344416077 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  344416608 and 346832034 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  346832208 and 349461968 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  349462300 and 351536342 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  351537818 and 353397815 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  353398226 and 355384340 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  355384517 and 356685351 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  356685453 and 358327972 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  358327973 and 360283471 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  360283497 and 362316826 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  362320569 and 364243961 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  364243963 and 366209697 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  366211511 and 368196541 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  368196627 and 370866922 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  370867741 and 372834781 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  372835347 and 374647724 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  374648819 and 376846284 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  376846292 and 379018389 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  379020315 and 380372838 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  380372840 and 381679639 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  381680575 and 383293099 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  383293924 and 385079228 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  385079447 and 386943768 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  386944268 and 388366627 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  388366629 and 390202115 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  390202328 and 391855263 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  391857612 and 393165420 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  393165620 and 394639707 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  394640232 and 396467363 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  396467920 and 397901777 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  397903732 and 399502603 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  399503522 and 401050916 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  401051649 and 402453035 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  402453037 and 403907621 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  403907623 and 405512408 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  405513468 and 406903962 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  406903963 and 408424535 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  408424783 and 410094648 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  410094649 and 411377671 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  411377672 and 412618980 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  412620290 and 414147353 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  414147505 and 416549615 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  416550926 and 417833956 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  417834371 and 419362899 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  419362900 and 420761316 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  420761796 and 421972820 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  421974295 and 423342633 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  423345263 and 424767972 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  424768037 and 425747738 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  425748956 and 426786244 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  426786675 and 427877727 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  427878351 and 429080011 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  429082862 and 430131053 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  430131153 and 431870419 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  431871752 and 433634461 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  433635913 and 435063989 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  435066752 and 436216485 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  436216519 and 437417707 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  437418615 and 438636710 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  438636711 and 439987407 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  439987497 and 441382819 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  441383927 and 442808317 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  442808702 and 443887141 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  443887143 and 445495073 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  445495075 and 447275894 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  447277053 and 448460751 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  448461924 and 449827098 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  449827099 and 451442454 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  451442579 and 452479681 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  452480470 and 453680760 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  453680938 and 454756036 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  454756207 and 476533728 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  476533735 and 477395632 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  477396931 and 478514012 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  478514064 and 479134982 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  479135262 and 479994647 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  479995134 and 480491282 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  480491358 and 480943727 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  480943789 and 481668087 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  481668171 and 481896437 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  481896481 and 482396725 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  482396772 and 483243438 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  483244447 and 483733552 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  483733645 and 484237044 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  484237163 and 485361336 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  485364959 and 487940914 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  487942879 and 492508621 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  492508622 and 494248537 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  494248540 and 495707323 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  495707324 and 496512274 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  496512362 and 497115876 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  497116185 and 497775836 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  497775912 and 498159077 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  498159246 and 498498615 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  498498616 and 498913148 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  498913149 and 499382948 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  499383107 and 499816574 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  499816577 and 500229889 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  500230005 and 500652227 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  500652286 and 501069501 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  501069527 and 501509865 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  501510185 and 501863930 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  501863956 and 502295134 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  502295397 and 502676517 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  502676518 and 504274715 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  504274764 and 504969510 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  504969511 and 505426741 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  505426742 and 505797082 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  505797083 and 506716408 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  506716434 and 509466192 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  509466266 and 509933273 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  509933278 and 510385706 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  510385905 and 511948848 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  511949338 and 512382428 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  512382566 and 513478532 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  513478923 and 515854840 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  515856347 and 524820408 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524844411 and 526468224 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  526468226 and 526797833 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  526797914 and 528355964 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  528358325 and 541951553 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  541952398 and 544383142 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  544385377 and 546191095 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  546191100 and 548209552 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  548210019 and 562807789 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  562812408 and 565767489 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  565767490 and 571625909 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  571626041 and 571921400 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  571921401 and 572679913 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  572680011 and 595414440 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  595414940 and 600356664 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  600358207 and 609576141 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  609576211 and 610367619 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610367624 and 615870628 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615870629 and 616486220 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  616486719 and 624613552 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  624613945 and 627186998 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  627187260 and 630032610 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  630032636 and 640975390 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  640975515 and 641649362 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  641649469 and 642252457 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  642252603 and 642945507 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  642945766 and 643443103 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  643443451 and 643787149 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  643787445 and 645602053 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  645602179 and 646348775 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  646349645 and 652598609 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  652599051 and 653169119 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  653169244 and 653751036 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  653751149 and 654195581 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  654195841 and 654663503 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  654663726 and 655093237 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  655093530 and 655535991 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  655536328 and 656103448 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  656103629 and 656776218 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  656776289 and 657277307 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  657277586 and 657833672 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  657833898 and 658377665 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  658378181 and 659000430 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  659000431 and 659579216 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  659579217 and 660183561 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  660183589 and 660871981 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  660872590 and 661385661 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  661385962 and 661912258 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  661912260 and 662403057 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  662403135 and 663080948 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  663081358 and 663691140 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  663691143 and 664230701 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  664230702 and 664833120 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  664833145 and 665569181 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  665569761 and 666356856 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  666357057 and 667040493 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  667040521 and 667737930 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  667738006 and 668484352 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  668484534 and 669206139 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  669206791 and 669848293 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  669848546 and 670478094 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  670478095 and 671169674 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  671169740 and 671782508 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  671782509 and 672398371 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  672398373 and 672923673 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  672923842 and 673519736 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  673520989 and 675380863 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  675380864 and 675880525 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  675881042 and 676388660 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  676388901 and 676881155 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  676881156 and 677311215 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  677311219 and 678126107 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  678126108 and 678968252 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  678968357 and 680276417 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  680276669 and 680894259 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  680894573 and 681609575 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  681609576 and 682184392 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  682184393 and 682622102 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  682622565 and 683030686 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  683030688 and 683472220 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  683472277 and 684070148 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  684070361 and 684756771 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  684758496 and 685436881 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  685436980 and 685892312 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  685892637 and 686350384 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  686350385 and 686854639 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  686855647 and 687499608 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  687499661 and 688251550 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  688251763 and 689025132 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  689025133 and 689497054 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  689497225 and 689963853 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  689963854 and 690466212 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  690466282 and 691085718 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  691085720 and 691650158 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  691650604 and 692236252 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  692236482 and 692826918 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  692827118 and 693565900 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  693566722 and 694278417 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  694279436 and 694885060 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  694885088 and 695503958 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  695503959 and 696070500 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  696070501 and 696557246 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  696557568 and 697044097 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  697044818 and 697519975 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  697520582 and 698205353 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  698205639 and 699352403 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  699352404 and 699961090 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  699961091 and 700557316 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  700557460 and 701161313 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  701161314 and 701742098 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  701742162 and 702404485 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  702404736 and 704577162 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  704577361 and 705139452 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  705139507 and 705731585 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  705733154 and 706234792 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  706235056 and 706652725 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  706652726 and 707065582 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  707065800 and 707539171 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  707539250 and 708074074 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  708074075 and 708620381 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  708620978 and 709145583 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  709145634 and 709664996 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  709665257 and 710166481 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  710166567 and 710639689 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  710639952 and 711088199 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  711088200 and 711621061 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  711621109 and 712008994 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  712009046 and 712404122 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  712404123 and 712787666 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  712788356 and 713191964 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  713192257 and 713555784 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  713555786 and 714023556 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  714023557 and 714513066 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  714513076 and 714991225 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  714991228 and 715412968 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  715412995 and 715782505 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  715783166 and 716124315 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  716124736 and 716467407 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  716467467 and 716857771 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  716857853 and 717277227 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  717277449 and 717708329 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  717709303 and 718197950 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  718197951 and 738850382 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  738850508 and 739359778 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  739359895 and 739852528 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  739852798 and 740322497 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  740322778 and 740798531 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  740798737 and 741309396 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  741309534 and 741798423 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  741798601 and 755345771 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  755346082 and 758172087 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  758172476 and 758594767 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  758594961 and 759033387 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  759033827 and 766704087 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  766704270 and 767895147 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  767895273 and 768283306 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  768283338 and 768846431 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  768846534 and 784125109 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  784127449 and 785977616 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  785977675 and 786316649 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  786316651 and 786639277 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  786639285 and 787276248 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  787277178 and 798757628 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  798759745 and 800806862 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  800807834 and 801882834 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  801892876 and 809387578 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  809387612 and 820715451 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  820715591 and 821156016 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  821156069 and 821574094 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  821574279 and 822112571 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  822112933 and 826925881 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  826925882 and 827517873 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  827518392 and 828136309 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  828136400 and 828669819 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  828670155 and 829244181 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  829244564 and 829832194 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  829832396 and 830344123 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  830344525 and 830882469 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  830882497 and 831424300 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  831425228 and 831955356 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  831955357 and 832375421 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  832375779 and 832824362 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  832824416 and 833286942 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  833286974 and 833872737 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  833872822 and 834497653 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  834497679 and 835082576 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  835083047 and 835478732 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  835478983 and 835893150 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  835893367 and 836496278 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  836496322 and 837014631 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  837015355 and 837547778 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  837547779 and 838119465 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  838119467 and 838612457 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  838612459 and 839159667 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  839159668 and 839856712 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  839857722 and 840340582 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  840340693 and 840863538 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  840864578 and 841921096 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  842084934 and 843419725 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  843419729 and 843874765 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  843874899 and 844374672 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  844374910 and 844912746 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  844912790 and 845553445 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  845553558 and 846159803 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  846159911 and 846708296 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  846708917 and 847351985 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  847352360 and 848043122 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  848043154 and 848719976 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  848720400 and 849326776 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  849326777 and 849973437 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  849973780 and 850557932 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  850557936 and 851198855 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  851198963 and 851825106 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  851825120 and 852436477 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  852436661 and 853092977 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  853093003 and 853800890 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  853800999 and 854497144 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  854498117 and 855271490 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  855271719 and 855864020 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  855864139 and 856526439 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  856526440 and 857100377 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  857100900 and 857749273 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  857749350 and 858341082 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  858341083 and 858915551 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  858916083 and 859525024 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  859525113 and 860053405 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  860053486 and 860671526 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  860671683 and 861299356 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  861299357 and 861779386 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  861779387 and 862310977 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  862310981 and 862848110 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  862848193 and 863534553 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  863535946 and 864262542 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  864263053 and 864866723 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  864867827 and 865506776 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  865507120 and 866198288 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  866198289 and 866919187 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  866919354 and 867712623 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  867712748 and 868386235 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  868386625 and 869064212 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  869064215 and 869544907 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  869545013 and 870064825 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  870065021 and 870522309 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  870522336 and 871114547 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  871115459 and 871710053 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  871710055 and 872117549 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  872117958 and 872687201 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  872687202 and 873139965 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  873140391 and 873572695 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  873572702 and 873991488 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  873991640 and 874556329 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  874556381 and 875060284 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  875060285 and 875624598 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  875625169 and 876130845 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  876130895 and 876602868 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  876603074 and 877100193 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  877100194 and 877490105 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  877490106 and 877996732 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  877996867 and 878494159 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  878494780 and 880034631 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  880037356 and 881291459 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  881291472 and 882005462 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  882005470 and 885468318 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  885470816 and 886246736 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  886246914 and 886874490 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  886874618 and 887396813 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  887396971 and 887920164 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  887920645 and 888460464 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  888460541 and 892570823 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  892571304 and 897257480 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  897261754 and 902622930 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  902624539 and 907494438 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  907494460 and 909679892 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  909679893 and 910225614 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  910225682 and 910695503 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  910696718 and 911475773 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  911477829 and 913436385 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  913436769 and 913854939 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  913855004 and 914269323 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  914269434 and 917979701 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  917980408 and 923660306 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  923660654 and 930194020 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  930194022 and 934782103 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from fourty_eight_hours_msisdns)
)
update bfp_sync_log bsl 
set msisdn_compliance_status = 'BARRED',
	msisdn_compliance_timestamp = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  934784385 and 977656210 ;


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
and t1.pk  between  37907293 and 49997823 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  50000863 and 53412808 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  53412865 and 58281549 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  58285635 and 61210461 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  61210554 and 63647101 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  63648182 and 66467789 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  66467791 and 69415325 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  69415333 and 72352128 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  72357253 and 75455473 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  75455475 and 78427511 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  78429647 and 81514508 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  81514513 and 83952084 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  83952572 and 132015202 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  132015666 and 134502332 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  134502525 and 136842128 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  136842252 and 139642174 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  139642971 and 142812474 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  142814356 and 145522806 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  145528771 and 149238795 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  149239186 and 153724641 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  153725311 and 157920136 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  157920917 and 161272000 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  161272015 and 168543456 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  168543759 and 176719656 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  176727761 and 182804815 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  182805098 and 209689039 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  209691878 and 316752967 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  316758559 and 402153153 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  402153508 and 488581934 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  488582514 and 489472346 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  489472386 and 490099786 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  490099888 and 502863709 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  502863798 and 503346878 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  503347617 and 503922348 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  503922732 and 508064375 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  508064713 and 508523864 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  508523966 and 509124703 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  509124772 and 510979692 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  510979717 and 511292827 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  511292842 and 511688059 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  511688072 and 521987795 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  521987803 and 522227103 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  522227108 and 522416123 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  522416298 and 522665412 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  522665486 and 522976512 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  522976573 and 523176226 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  523176321 and 523355184 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  523355207 and 523837612 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  523837712 and 524040371 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524040383 and 524201716 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524201853 and 524330500 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524330516 and 524482703 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524482759 and 524620819 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524620846 and 524770902 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  524770934 and 525042707 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  525042730 and 525239631 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  525239638 and 525446177 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  525446240 and 525677421 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  525677523 and 533635979 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  533636119 and 533751123 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  533751135 and 533854063 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  533854158 and 533957201 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  533957223 and 534053507 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534053536 and 534147211 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534147224 and 534243509 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534243534 and 534347163 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534347174 and 534452621 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534452653 and 534566393 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534566484 and 534671083 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534671184 and 534786280 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534786360 and 534890784 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  534890845 and 535008213 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  535008458 and 535131322 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  535131354 and 535262086 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  535262121 and 535389999 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  535390009 and 535508906 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  535508913 and 535647943 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  535647964 and 565790807 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  565790880 and 565875644 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  565875790 and 565959366 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  565959429 and 566037532 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566037594 and 566117695 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566117713 and 566192235 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566192248 and 566269171 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566269172 and 566343808 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566343894 and 566420830 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566420858 and 566495804 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566495816 and 566571170 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566571174 and 566642482 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566642483 and 566716056 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566716074 and 566792375 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566792404 and 566865417 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566865420 and 566941210 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  566941238 and 567014877 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567014879 and 567088927 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567088933 and 567167806 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567167832 and 567250703 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567250721 and 567337378 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567337382 and 567422916 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567423006 and 567505790 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567505854 and 567589458 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567589478 and 567674469 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567674488 and 567762182 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567762185 and 567857234 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567857268 and 567943082 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  567943097 and 568025529 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568025538 and 568112359 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568112413 and 568203867 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568203900 and 568298986 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568299128 and 568391027 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568391084 and 568480888 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568481010 and 568563699 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568563720 and 568654049 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568654137 and 568760084 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568760085 and 568866414 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568866458 and 568968387 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  568968395 and 569072613 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569072623 and 569175290 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569175311 and 569277319 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569277338 and 569360896 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569360911 and 569458428 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569458459 and 569542093 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569542132 and 569622977 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569623001 and 569707618 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569707623 and 569807555 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569807565 and 569879520 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569879524 and 569959969 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  569959987 and 570038585 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570038624 and 570124465 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570124479 and 570272120 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570272186 and 570409694 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570409798 and 570556284 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570556310 and 570672137 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570672248 and 570814572 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570814584 and 570940458 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  570940548 and 571043288 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  571043291 and 571176609 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  571176614 and 571307195 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  571307274 and 610734515 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610734516 and 610787390 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610787397 and 610839763 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610839770 and 610891121 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610891148 and 610945259 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610945261 and 610997975 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  610998001 and 611050565 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611050634 and 611101820 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611101834 and 611154446 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611154468 and 611205691 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611205729 and 611258912 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611258913 and 611310924 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611310928 and 611363398 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611363424 and 611415473 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611415488 and 611467662 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611467665 and 611520051 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611520061 and 611572981 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611573009 and 611625374 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611625381 and 611677378 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611677402 and 611731519 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611731538 and 611785136 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611785143 and 611837512 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611837519 and 611891926 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611891944 and 611945224 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611945252 and 611997798 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  611997802 and 612049311 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612049356 and 612101383 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612101441 and 612152506 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612152518 and 612205203 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612205210 and 612255595 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612255670 and 612306030 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612306081 and 612355702 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612355716 and 612407445 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612407447 and 612460733 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612460795 and 612511504 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612511513 and 612563563 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612563639 and 612616727 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612616745 and 612668817 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612668840 and 612721216 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612721235 and 612773136 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612773144 and 612824205 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612824206 and 612876598 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612876600 and 612928922 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612928947 and 612979404 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  612979440 and 613031252 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613031257 and 613080738 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613080739 and 613131435 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613131439 and 613181597 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613181598 and 613232908 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613232936 and 613284410 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613284478 and 613335177 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613335206 and 613387533 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613387564 and 613438939 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613438951 and 613489915 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613489930 and 613537265 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613537272 and 613587302 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613587310 and 613635557 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613635558 and 613686562 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613686573 and 613739701 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613739709 and 613790903 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613790917 and 613841132 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613841133 and 613890123 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613890131 and 613941822 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613941827 and 613994028 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  613994057 and 614042917 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614042922 and 614093660 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614093664 and 614140874 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614140951 and 614192592 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614192626 and 614244936 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614244942 and 614295787 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614295811 and 614345867 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614345871 and 614399260 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614399263 and 614457369 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614457389 and 614509261 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614509270 and 614562136 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614562147 and 614616354 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614616369 and 614669276 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614669283 and 614724447 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614724486 and 614776558 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614776560 and 614829117 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614829160 and 614881174 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614881194 and 614926315 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614926319 and 614969316 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  614969319 and 615022335 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615022354 and 615077381 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615077382 and 615131939 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615131980 and 615186409 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615186432 and 615241754 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615241775 and 615293727 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615293732 and 615347825 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615347851 and 615402410 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615402411 and 615459034 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615459035 and 615516133 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615516175 and 615574237 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  615574240 and 642883926 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  642898628 and 670248473 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  670248474 and 686857413 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  686865258 and 712321182 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  712331866 and 742273475 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742273552 and 742331241 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742331254 and 742388046 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742388082 and 742444242 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742444265 and 742500689 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742500710 and 742557903 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742557909 and 742617007 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742617013 and 742673146 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742673195 and 742730262 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742730288 and 742784892 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742784941 and 742840159 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742840195 and 742896942 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742896952 and 742951870 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  742951875 and 743005289 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743005308 and 743061238 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743061291 and 743112649 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743112656 and 743166609 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743166623 and 743217491 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743217560 and 743265894 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743265915 and 743315890 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743315892 and 743367174 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743367223 and 743418717 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743418720 and 743470109 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743470112 and 743522735 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743522763 and 743576024 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743576026 and 743633032 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743633050 and 743689559 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743689560 and 743743063 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743743078 and 743797487 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743797488 and 743848739 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743848744 and 743901163 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743901188 and 743954729 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  743954752 and 744007414 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744007488 and 744058755 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744058759 and 744109742 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744109749 and 744162440 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744162444 and 744216238 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744216263 and 744269837 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744269853 and 744320690 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744320721 and 744371844 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744371861 and 744423254 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744423257 and 744478489 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744478494 and 744536841 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744536847 and 744599101 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744599111 and 744661371 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744661389 and 744725779 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744725830 and 744788661 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744788665 and 744850775 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744850781 and 744913520 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744913528 and 744974597 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  744974607 and 745035957 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745035960 and 745098298 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745098299 and 745157409 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745157421 and 745218909 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745218978 and 745281447 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745281456 and 745342045 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745342070 and 745399402 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745399421 and 745454827 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745454846 and 745511778 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745511791 and 745568247 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745568294 and 745624248 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745624254 and 745683990 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745683992 and 745748430 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745748444 and 745823867 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745823876 and 745886984 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745886993 and 745948477 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  745948480 and 746012470 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746012521 and 746078381 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746078435 and 746143887 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746143889 and 746211549 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746211565 and 746279936 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746279943 and 746347993 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746348000 and 746417513 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746417557 and 746487161 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746487178 and 746558454 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746558458 and 746625718 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746625721 and 746695268 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746695303 and 746766065 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746766114 and 746831371 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746831390 and 746896897 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746896906 and 746962865 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  746962891 and 747029964 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  747029967 and 747099512 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  747099541 and 771865444 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  771865487 and 771933267 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  771933281 and 771999100 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  771999136 and 772065443 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772065470 and 772132572 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772132636 and 772200600 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772200646 and 772268428 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772268455 and 772330414 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772330422 and 772388733 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772388740 and 772439383 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772439392 and 772489808 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772489820 and 772558816 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772558832 and 772635949 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772635990 and 772710244 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772710254 and 772785066 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772785078 and 772856970 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772857023 and 772915823 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772915854 and 772990005 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  772990022 and 773043160 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773043168 and 773091616 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773091623 and 773157182 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773157190 and 773222434 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773222435 and 773293325 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773293367 and 773355146 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773355150 and 773414897 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773414900 and 773476001 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773476007 and 773540054 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773540060 and 773617669 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773617786 and 773702317 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773702463 and 773786190 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773786198 and 773863056 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773863062 and 773931678 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773931719 and 773977767 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  773977777 and 774023925 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774023941 and 774073970 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774073980 and 774124262 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774124283 and 774182793 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774182800 and 774235953 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774235995 and 774287924 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774287979 and 774342354 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774342384 and 774391637 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774391641 and 774440839 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774440858 and 774488411 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774488421 and 774540007 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774540016 and 774592722 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774592770 and 774649316 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774649318 and 774715926 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774715928 and 774800913 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774801094 and 774903989 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  774904108 and 775008993 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775009004 and 775117555 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775117584 and 775234582 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775234624 and 775331362 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775331377 and 775418603 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775418608 and 775495988 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775496018 and 775565233 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775565270 and 775646994 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775647067 and 775742638 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775742710 and 775837772 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775837794 and 775920763 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775920787 and 775993533 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  775993534 and 776064456 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776064465 and 776121432 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776121434 and 776161946 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776161958 and 776198096 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776198127 and 776234399 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776234415 and 776270251 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776270265 and 776304577 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776304583 and 776339633 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776339645 and 776375405 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776375458 and 776412639 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776412655 and 776455280 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776455286 and 776506666 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776506672 and 776581241 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776581286 and 776663191 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776663221 and 776724994 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  776725021 and 810649746 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810649749 and 810668484 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810668502 and 810686335 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810686356 and 810703540 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810703541 and 810721675 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810721685 and 810739533 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810739535 and 810757723 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810757734 and 810775735 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810775736 and 810795122 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810795135 and 810814059 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810814062 and 810833921 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810833922 and 810851718 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810851719 and 810868685 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810868692 and 810885710 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810885718 and 810902024 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810902044 and 810919225 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810919230 and 810935665 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810935675 and 810952194 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810952195 and 810968819 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810968825 and 810985731 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  810985734 and 811002703 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811002705 and 811019452 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811019454 and 811036228 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811036237 and 811052704 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811052728 and 811068557 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811068559 and 811085483 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811085485 and 811103012 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811103013 and 811119473 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811119482 and 811136552 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811136556 and 811153898 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811153900 and 811172067 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811172075 and 811191281 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811191289 and 811207499 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811207508 and 811225466 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811225480 and 811243724 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811243730 and 811257267 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811257272 and 811272413 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811272422 and 811289771 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811289779 and 811307254 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811307256 and 811324796 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811324807 and 811344051 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811344052 and 811364082 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811364099 and 811384129 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811384132 and 811403262 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811403263 and 811420602 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811420627 and 811437964 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811437986 and 811455684 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811455685 and 811473450 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811473454 and 811491284 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811491298 and 811510331 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811510333 and 811531803 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811531811 and 811551588 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811551590 and 811570791 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811570794 and 811591184 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811591198 and 811610606 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811610631 and 811633094 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811633096 and 811655454 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811655456 and 811674254 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811674256 and 811693064 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811693065 and 811712065 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811712069 and 811731377 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811731380 and 811751618 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811751623 and 811776205 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811776230 and 811799004 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811799006 and 811822819 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811822828 and 811846886 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811846916 and 811872920 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811872923 and 811896706 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811896722 and 811920975 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811920989 and 811947137 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811947143 and 811972990 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811972993 and 811995587 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  811995597 and 812011082 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812011083 and 812031246 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812031281 and 812055934 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812055950 and 812078187 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812078193 and 812095396 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812095412 and 812117379 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812117385 and 812139060 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812139069 and 812170832 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812170840 and 812199535 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812199537 and 812220855 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812220860 and 812238680 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812238681 and 812256997 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812257002 and 812277763 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812277774 and 812312330 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812312357 and 812389409 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812389411 and 812422270 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812422274 and 812448956 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812448961 and 812474907 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812474911 and 812511408 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812511410 and 812541038 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812541056 and 812572583 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812572645 and 812598875 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812598877 and 812616447 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812616456 and 812633638 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812633644 and 812648342 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812648343 and 812663451 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812663456 and 812678119 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812678121 and 812694910 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812694922 and 812712010 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812712033 and 812736220 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  812736235 and 833864708 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  833890654 and 860500111 ;
with t1 as (
select
	pk,
	rank() over ( partition by msisdn order by create_date desc )
from bfp_sync_log
where msisdn in (select msisdn from deactivation_msisdns)
)
update bfp_sync_log bsl 
set activationstatusenum = 'DEACTIVATED',
	activation_date = now(),
	last_modified = now()
from t1 
where t1.pk = bsl.pk 
and rank = 1 
and t1.pk  between  860500118 and 960825023 ;

