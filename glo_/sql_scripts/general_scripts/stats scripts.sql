1. Total SIM registration in the last 3 months, 6 months and 12 months.

select 'SIM REG 3 MONTHS', count(1)
from bfp_sync_log 
where bfpsyncstatusenum = 'SUCCESS'
and date(create_date) >= date(now) - interval '3 months'
union all 
select 'SIM REG 6 MONTHS', count(1)
from bfp_sync_log 
where bfpsyncstatusenum = 'SUCCESS'
and date(create_date) >= date(now) - interval '6 months'
union all 
select 'SIM REG 12 MONTHS', count(1)
from bfp_sync_log 
where bfpsyncstatusenum = 'SUCCESS'
and date(create_date) >= date(now) - interval '12 months'
;


2. Total SIM activated registration in the last 3 months, 6 months and 12 months.

select 'ACTIVATED REG 3 MONTHS', count(1)
from bfp_sync_log 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(create_date) >= date(now) - interval '3 months'
union all 
select 'ACTIVATED REG 6 MONTHS', count(1)
from bfp_sync_log 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(create_date) >= date(now) - interval '6 months'
union all 
select 'ACTIVATED REG 12 MONTHS', count(1)
from bfp_sync_log 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(create_date) >= date(now) - interval '12 months'
;


3. Total agents created in the last 3 months, 6 months and 12 months.

select 'AGENT CREATED 3 MONTHS', count(1)
from km_user 
where date(create_date) >= date(now) - interval '3 months'
union all 
select 'AGENT CREATED 6 MONTHS', count(1)
from km_user 
where date(create_date) >= date(now) - interval '6 months'
union all 
select 'AGENT CREATED 12 MONTHS', count(1)
from km_user 
where date(create_date) >= date(now) - interval '12 months'
;


4. Total devices enabled (tagged) in the last 3 months, 6 months and 12 months

select 'TOTAL DEVICES ENABLED 3 MONTHS', count(1)
from enrollment_ref ER, NODE N, NODE_ASSIGNMENT NA
where er.id = n.enrollment_ref
AND n.id = na.node_fk
AND date(date_installed ) >= date(now) - interval '3 months'
UNION ALL 
select 'TOTAL DEVICES ENABLED 6 MONTHS', count(1)
from enrollment_ref ER, NODE N, NODE_ASSIGNMENT NA
where er.id = n.enrollment_ref
AND n.id = na.node_fk
AND date(date_installed ) >= date(now) - interval '6 months'
UNION ALL 
select 'TOTAL DEVICES ENABLED 12 MONTHS', count(1)
from enrollment_ref ER, NODE N, NODE_ASSIGNMENT NA
where er.id = n.enrollment_ref
AND n.id = na.node_fk
AND date(date_installed ) >= date(now) - interval '13 months'
;


5. Services calls in the last 3 months, 6 months and 12 months.

