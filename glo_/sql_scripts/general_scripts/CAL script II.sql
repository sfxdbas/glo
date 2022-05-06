with t1 as (
select enrollment_ref as tag,activity,
	   case when date(create_date) = '2021-05-20' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-20",
	   case when date(create_date) = '2021-05-21' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-21",
	   case when date(create_date) = '2021-05-22' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-22",
	   case when date(create_date) = '2021-05-23' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-23",
	   case when date(create_date) = '2021-05-24' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-24",
	   case when date(create_date) = '2021-05-25' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-25",
	   case when date(create_date) = '2021-05-26' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-26"
--	   round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric),2) as duration_in_mins
from client_activity_log cal 
where activity = 'PORTRAIT_CAPTURE'
and enrollment_ref in ('GLO-DH-LAG-ETI-GWLALEK3-412W','GLO-DH-413W','GLO-HH-803R','GLO-HH-804R')
and date(activity_start_time) between '2021-05-20' and '2021-05-26'
group by enrollment_ref,activity,date(create_date)
) 
select tag,activity, max("2021-05-20") "2021-05-20",max("2021-05-21") "2021-05-21",max("2021-05-22") "2021-05-22",max("2021-05-23") "2021-05-23",
	    max("2021-05-24") "2021-05-24",max("2021-05-25") "2021-05-25",max("2021-05-26") "2021-05-26"
from t1 
group by tag,activity
;

select * from msisdn_provision_status mps where msisdn = '08155573564';

select date(create_date),activity,--activity_start_time, activity_end_time,duration, activity_end_time-activity_start_time
avg(duration),avg(activity_end_time-activity_start_time) as duration
from client_activity_log cal 
where date(activity_start_time)= '2021-05-26'
and activity = 'PORTRAIT_CAPTURE'
and enrollment_ref = 'GLO-DH-LAG-ETI-GWLALEK3-412W'
group by 1,2