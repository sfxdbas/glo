select * 
from client_activity_log cal
where activity = 'LEFT_FOUR_FINGERS'
;

with t1 as (
select enrollment_ref as tag, --,activity,
	   case when date(create_date) = '2021-05-17' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-17",
	   case when date(create_date) = '2021-05-18' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-18",
	   case when date(create_date) = '2021-05-19' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-19",
	   case when date(create_date) = '2021-05-20' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-20",
	   case when date(create_date) = '2021-05-21' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-21",
	   case when date(create_date) = '2021-05-22' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-22",
	   case when date(create_date) = '2021-05-23' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-23",
	   case when date(create_date) = '2021-05-24' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-24",
	   case when date(create_date) = '2021-05-25' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-25",
	   case when date(create_date) = '2021-05-26' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-26",
	   case when date(create_date) = '2021-05-27' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-27",
	   case when date(create_date) = '2021-05-28' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-28",
	   case when date(create_date) = '2021-05-29' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-29",
	   case when date(create_date) = '2021-05-30' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-30",
	   case when date(create_date) = '2021-05-31' then round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric)/60,2) else 0 end as "2021-05-31"
--	   round(aVG(extract(epoch from activity_end_time)::numeric - extract(epoch from activity_start_time)::numeric),2) as duration_in_mins
from client_activity_log cal 
where activity in ('RIGHT_FOUR_FINGERS','LEFT_FOUR_FINGERS')
--and enrollment_ref in ('GLO-DH-LAG-ETI-GWLALEK3-412W','GLO-DH-413W','GLO-HH-803R','GLO-HH-804R')
and date(activity_start_time) between '2021-05-20' and '2021-05-26'
group by enrollment_ref--,activity
,date(create_date)
) 
select tag, --,activity, 
		max("2021-05-20") "2021-05-20",max("2021-05-21") "2021-05-21",max("2021-05-22") "2021-05-22",max("2021-05-23") "2021-05-23",
	    max("2021-05-24") "2021-05-24",max("2021-05-25") "2021-05-25",max("2021-05-26") "2021-05-26",max("2021-05-27") "2021-05-27",
		max("2021-05-28") "2021-05-28",max("2021-05-29") "2021-05-29",max("2021-05-30") "2021-05-30",max("2021-05-31") "2021-05-31"
from t1 
group by tag --,activity
;