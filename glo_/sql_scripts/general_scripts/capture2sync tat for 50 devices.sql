--> c2s for 50 devices


select
	s.enrollment_ref kittag, 
	round(avg(case when date(create_date) = '2020-04-30'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-04-30",
	round(avg(case when date(create_date) = '2020-05-01'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-01",
	round(avg(case when date(create_date) = '2020-05-02'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-02",
	round(avg(case when date(create_date) = '2020-05-03'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-03",
	round(avg(case when date(create_date) = '2020-05-04'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-04",
	round(avg(case when date(create_date) = '2020-05-05'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-05",
	round(avg(case when date(create_date) = '2020-05-06'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-06",
	round(avg(case when date(create_date) = '2020-05-07'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-07",
	round(avg(case when date(create_date) = '2020-05-08'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-08",
	round(avg(case when date(create_date) = '2020-05-09'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-09",
	round(avg(case when date(create_date) = '2020-05-10'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-10",
	round(avg(case when date(create_date) = '2020-05-11'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-11",
	round(avg(case when date(create_date) = '2020-05-12'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-12",
	round(avg(case when date(create_date) = '2020-05-13'  
			  then (extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60
			  else 0 end),2) as "2020-05-13"
from bfp_sync_log b, sms_activation_request s 
where b.unique_id = s.unique_id
and date(b.create_date) >= date(now()) - interval '2 weeks'
group by 1
--order by 1
limit 50
;

;


select
	enrollment_ref kittag, date(create_date),
	round(avg((extract(epoch from b.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60), 2 ) capture2sync_mins
from bfp_sync_log b, sms_activation_request s 
where b.unique_id = s.unique_id
--and date(b.create_date) >= date(now()) - interval '2 weeks'
group by 1,2
order by 1