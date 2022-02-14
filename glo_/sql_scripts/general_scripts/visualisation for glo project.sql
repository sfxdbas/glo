--syncs for the day 
select count(id) as sync_for_the_day
from sms_activation_request 
where date(receipt_timestamp) = date(now())
;

--syncs for the week
select count(id) as sync_for_the_week
from sms_activation_request 
where extract(week from receipt_timestamp) = extract(week from now())
;

--syncs for the year 
select count(id) as sync_for_the_year
from sms_activation_request 
where extract(year from receipt_timestamp) = extract(year from now())
;

--syncs from inception
select count(id) as sync_for_inception
from sms_activation_request 
;

--flow of successful syncs in the last 30 days
select date(receipt_timestamp) days, count(id) syncs
from sms_activation_request
where date(receipt_timestamp) >= date(now()) - interval '30 days'
group by 1
order by 1
;

--reasons for quarantined
select rejection_reason, count(1) total
from bfp_sync_log
where bfpsyncstatusenum = 'ERROR'
and rejection_reason is not null
and DATE(CREATE_DATE) = DATE(NOW())
group by 1
;

--hourly flow of syncs for the day 
select extract(hour from create_date), 'ERROR' category, count(1) total
from bfp_sync_log
where bfpsyncstatusenum = 'ERROR'
and rejection_reason is not null
and DATE(CREATE_DATE) = DATE(NOW())
group by 1
union all 
select extract(hour from create_date), 'SUCCESS', count(1) total
from bfp_sync_log
where bfpsyncstatusenum = 'SUCCESS'
and DATE(CREATE_DATE) = DATE(NOW())
group by 1
order by 1
;

--yesterday vs today (trend)
select date(receipt_timestamp), count(id) 
from sms_activation_request
where date(receipt_timestamp) = date(now())-1
group by 1
union all
select date(receipt_timestamp), count(id) 
from sms_activation_request
where date(receipt_timestamp) = date(now())
group by 1
order by 1
;


--this week vs last week (trend)
select case when  extract(week from receipt_timestamp)::text = extract(week from receipt_timestamp)::text then 'Last Week' else extract(week from receipt_timestamp)::text end , count(id) 
from sms_activation_request
where extract(week from receipt_timestamp) = extract(week from now())-1
group by 1
union all
select case when  extract(week from receipt_timestamp)::text = extract(week from receipt_timestamp)::text then 'This Week' else extract(week from receipt_timestamp)::text end , count(id) 
from sms_activation_request
where extract(week from receipt_timestamp) = extract(week from now())
group by 1
order by 1
;

--pending and pushed records for the day by the hour v1
select 
	round(avg((extract(hour from receipt_timestamp)::numeric,2) "hour", 
	confirmation_status,
	count(1) total
from sms_activation_request s
where date(receipt_timestamp) = date(now())
group by 1,2
ORDER BY 1
;

--pending and pushed records for the day by the hour v2
select 
	confirmation_status, count(1)
from sms_activation_request s
 where date(receipt_timestamp) = date(now())
and not exists 
(select 1 from agility_push_status a where a.unique_id = s.unique_id)
group by 1
union all
select 
	confirmation_status, count(1)
from sms_activation_request s
 where date(receipt_timestamp) = date(now())
and exists 
(select 1 from agility_push_status a where a.unique_id = s.unique_id)
group by 1
ORDER BY 1
;

--top 5 states with the highest syncs
with t1 as (
select st."name", count(1)
from sms_activation_request sar, state st
where sar.state_id = st.id
group by 1
order by 2 desc 
limit 5 )
select * from t1
;

--top 5 states with the lowest syncs
with t1 as (
select st."name", count(1)
from sms_activation_request sar, state st
where sar.state_id = st.id
group by 1
order by 2  
limit 5 )
select * from t1
;

--syncs based on state for the day 
-- use Namos own

--active devices
with t1 as (
select count(distinct enrollment_ref) as total
from sms_activation_request s, heart_beat_status h
WHERE s.enrollment_ref = h.tag
and h.app_version != '1.00'
and date(s.receipt_timestamp) = date(current_date)
	union all
select count(distinct enrollment_ref) as total
from sms_activation_request s, heart_beat_status h
where s.enrollment_ref = h.tag
 and   h.app_version = '1.00'
and date(s.receipt_timestamp) = date(current_date)
)
select sum(total) active_devices
from t1
;

--active devices by type
select 'WINDOWS' device_type, count(distinct enrollment_ref) as total
from sms_activation_request s, heart_beat_status h
WHERE s.enrollment_ref = h.tag
and h.app_version != '1.00'
and date(s.receipt_timestamp) = date(current_date)
	union all
select 'DROID', count(distinct enrollment_ref) as total
from sms_activation_request s, heart_beat_status h
where s.enrollment_ref = h.tag
 and   h.app_version = '1.00'
and date(s.receipt_timestamp) = date(current_date)
;

--devices by version 
select app_version, count(1)
from heart_beat_status
group by 1
order by 1
;

--total windows vs droid
select 'WINDOWS' device_type, count(1) as total
from heart_beat_status h
WHERE h.app_version != '1.00'
	union all
select 'DROID' device_type, count(1) as total
from heart_beat_status h
WHERE h.app_version = '1.00'
;


--registration count by dealer
select kd."name", count(s.enrollment_ref)
from kyc_dealer kd, sms_activation_request s, km_user ku
where s.enrollment_ref = ku.first_name
and kd.pk = ku.dealer_fk
group by 1
order by 2 desc 

--top 5 dealers with highest agent
select kd."name", count(*)
from kyc_dealer kd, km_user ku
where kd.pk = ku.dealer_fk
group by 1
order by 2 desc 
;

--agents by state
select s."name", count(1)
from node_assignment na, state s 
where na.state_fk = s.id
group by 1
order by 2 desc;

--Top 10 devices with the highest no of successful reg
with t1 as (
select enrollment_ref, count(1)
from sms_activation_request sar
group by 1
order by 2  desc
limit 10 )
select * from t1

--Top 10 devices with the least no of successful reg
with t1 as (
select enrollment_ref, count(1)
from sms_activation_request sar
group by 1
order by 2 
limit 10 )
select * from t1


--newly created users (today)
select count(pk)
from km_user
where date(create_date) = date(now())
;

---tat metrics till the current hour 
select 'Capture To Sync' Metric, round(avg((extract(epoch from bb.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60 ), 2) tat_in_mins
from sms_activation_request s 
join bfp_sync_log bb on	s.unique_id = bb.unique_id
where date(s.receipt_timestamp) = date(current_date)
union all 
select 'Sync To Backend', round(avg((extract(epoch from s.Receipt_Timestamp)::numeric  - extract(epoch from bb.File_Sync_Date)::numeric)/60), 2) 
from sms_activation_request s 
join bfp_sync_log bb on	s.unique_id = bb.unique_id
where date(s.receipt_timestamp) = date(current_date)
union all
select 'Capture To Backend', round(avg((extract(epoch from s.receipt_timestamp)::numeric  - extract(epoch from s.registration_timestamp)::numeric)/60 ), 2) 
from sms_activation_request s 
where date(s.receipt_timestamp) = date(current_date)
union all
select 'Backend To Mcentric', round(avg((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.receipt_timestamp)::numeric)/60), 2) 
from sms_activation_request s 
where date(s.receipt_timestamp) = date(current_date)
union all 
select 'Capture To Mcentric', round(avg((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60), 2) 
from sms_activation_request s 
where date(s.receipt_timestamp) = date(current_date)
union all
select 'Sync To Mcentric', round(avg((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from bb.File_Sync_Date)::numeric)/60), 2) 
from sms_activation_request s 
join bfp_sync_log bb on	s.unique_id = bb.unique_id
where date(s.receipt_timestamp) = date(current_date)
order by 1
;

--mean reg for the week 
with t1 as (
select date(receipt_timestamp), count(1)
from sms_activation_request
where extract(week from receipt_timestamp) = extract(week from now())
group by 1)
select round(avg(count),2) mean_reg_for_the_week
from t1
;

--mean reg for the month 
with t1 as (
select date(receipt_timestamp), count(1)
from sms_activation_request
where extract(month from receipt_timestamp) = extract(month from now())
group by 1)
select round(avg(count),2) mean_reg_for_the_month
from t1
;

--registration by transfer mode for the day 
select transfer_mode, bfpsyncstatusenum, count(1)
from bfp_sync_log
where date(create_date) = date(now())
group by 1,2
;

--registration by reg type for the day 
select registration_type, count(1)
from sms_activation_request
where date(receipt_timestamp) = date(now())
group by 1
;

--network status of reg by the hour 
select  case when m.registration_network_status = 'OFF' then 'OFFLINE' else 'ONLINE' END as registration_network_status ,extract(hour from receipt_timestamp) hour_, count(1)
from meta_data m, sms_activation_request s, basic_data d, user_id u
where d.user_id_fk = u.id
and m.basic_data_fk = d.id
and s.unique_id = u.unique_id
and date(receipt_timestamp) = date(now())
group by 1,2
order by 2
;

--registration status by kittags 
select s.enrollment_ref, 
	sum(case when m.registration_network_status = 'OFF' then true else false end) as offline, 
	sum(case when m.registration_network_status is null or m.registration_network_status = 'ON' then true else false end) as online
from meta_data m, sms_activation_request s, basic_data d, user_id u
where d.user_id_fk = u.id
and m.basic_data_fk = d.id
and s.unique_id = u.unique_id
and date(receipt_timestamp) = date(now())
group by 1
--order by 
;


--UNtagging history for the week 
SELECT TO_CHAR(DATE_OF_REQUEST::DATE, 'DAY'), COUNT(1) 
FROM UNTAGGING_HISTORY
WHERE EXTRACT(WEEK FROM DATE_OF_REQUEST::DATE) = EXTRACT(WEEK FROM NOW())
GROUP BY 1,DATE_OF_REQUEST
ORDER BY DATE_OF_REQUEST


--eyeballing status 
select i."name", e.status, count(1)
from eyeballing e, infraction i 
where e.infraction_fk = i.pk 
group by 1,2
order by 1
;

--last successful login 
select max(last_successful_login) last_successful_login
from km_user
;

--last failed login 
select max(last_failed_login) last_failed_login
from km_user
;

--quarantine records by instance 
select right(instance_ip, 4), count(1)
from bfp_sync_log
where date(create_date) = date(now())
and bfpsyncstatusenum = 'ERROR'
group by 1
order by 1
;

-- total login attempt (today vs yesterday)
SELECT date(create_date), count(1) 
	FROM public.access_log
 group by 1
 order by 1
 ;
 
 -- Successful login attempt (today vs yesterday)
 SELECT date(create_date), count(1) 
	FROM public.access_log
where login_status_enum ='SUCCESS'
 group by 1
 order by 1
 ;
 
-- Failed login attempt (today vs yesterday)
 SELECT date(create_date), count(1) 
	FROM public.access_log
where login_status_enum !='SUCCESS'
 group by 1
 order by 1
 ;
 
 
 -->extra
  SELECT date(create_date) datetdate, count(1) 
	FROM public.access_log
 where date(create_date) >= '2020-06-10'
 and extract(hour from create_date) < extract(hour from now())
-- login_status_enum !='SUCCESS'
 group by 1
 order by 1