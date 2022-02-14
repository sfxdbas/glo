-- summary  report 2
with t2 as (
with report_2 as (
select
	bb.msisdn, bb.create_date as time_sfx_received,
s.receipt_timestamp as time_sfx_released,
bb.activation_date as hprov_time,
	round((extract(epoch from bb.activation_date)::numeric - extract(epoch from bb.create_date)::numeric)/ 60, 2) as TIME_TAKEN
from
	meta_data m
join basic_data b on	m.basic_data_fk = b.id
join user_id u on	b.user_id_fk = u.id
join sms_activation_request s on	s.unique_id = u.unique_id
join bfp_sync_log bb on	s.unique_id = bb.unique_id
where	bfpsyncstatusenum = 'SUCCESS'
	and msisdn = s.phone_number
	and date(bb.create_date) = '2021-05-24'
	-- order by bb.create_date
)
select	*,
case 
	when time_taken between 0 and 5 then '0-5mins'
	when time_taken between 6 and 10 then '6-10mins'
	when time_taken between 11 and 30 then '11-30mins'
	when time_taken between 31 and 60 then '31mins-1hr'
	when time_taken between 61 and 120 then '1-2hrs'
	when time_taken between 121 and 180 then '2-3hrs'
	when time_taken between 181 and 240 then '3-4hrs'
	when time_taken between 241 and 300 then '4-5hrs'
	when time_taken between 301 and 360 then '5-6hrs'
	when time_taken between 361 and 420 then '6-7hrs'
	when time_taken between 421 and 480 then '7-8hrs'
	when time_taken between 481 and 540 then '8-9hrs'
	when time_taken between 541 and 600 then '9-10hrs'
	when time_taken between 601 and 660 then '10-11hrs'
	when time_taken between 661 and 720 then '11-12hrs'
	when time_taken between 721 and 780 then '12-13hrs'
	when time_taken between 781 and 840 then '13-14hrs'
	when time_taken between 841 and 900 then '14-15hrs'
	when time_taken between 901 and 960 then '15-16hrs'
	when time_taken between 961 and 1020 then '16-17hrs'
	when time_taken between 1021 and 1080 then '17-18hrs'
	when time_taken between 1081 and 1040 then '18-19hrs'
	when time_taken between 1041 and 1200 then '19-20hrs'
	when time_taken between 1201 and 1260 then '20-21hrs'
	when time_taken between 1261 and 1320 then '21-22hrs'
	when time_taken between 1321 and 1380 then '22-23hrs'
	when time_taken between 1381 and 1439 then '23-24hrs'
	when time_taken > 1439 then 'gt 24 hrs'
	when time_taken is null then 'N/A'
else 'gt 24 hrs' end as duration 
from report_2 
--  order by time_taken desc
) select case when duration = '0-5mins'		then 'a:0-5mins'
 when duration = '6-10mins'		then 'b:6-10mins'
 when duration = '11-30mins'	then 'c:11-30mins'
 when duration = '31mins-1hr'	then 'd:31mins-1hr'
 when duration = '1-2hrs'		then 'e:1-2hrs'
 when duration = '2-3hrs'		then 'f:2-3hrs'
 when duration = '3-4hrs'		then 'g:3-4hrs'
 when duration = '4-5hrs'		then 'h:4-5hrs'
 when duration = '5-6hrs'		then 'i:5-6hrs'
 when duration = '6-7hrs'		then 'j:6-7hrs'
 when duration = '7-8hrs'		then 'k:7-8hrs'
 when duration = '8-9hrs'		then 'l:8-9hrs'
 when duration = '9-10hrs'		then 'm:9-10hrs'
 when duration = '10-11hrs'		then 'n:10-11hrs'
 when duration = '11-12hrs'		then 'o:11-12hrs'
 when duration = '12-13hrs'		then 'p:12-13hrs'
 when duration = '13-14hrs'		then 'q:13-14hrs'
 when duration = '14-15hrs'		then 'r:14-15hrs'
 when duration = '15-16hrs'		then 's:15-16hrs'
 when duration = '16-17hrs'		then 't:16-17hrs'
 when duration = '17-18hrs'		then 'u:17-18hrs'
 when duration = '18-19hrs'		then 'v:18-19hrs'
 when duration = '19-20hrs'		then 'w:19-20hrs'
 when duration = '20-21hrs'		then 'x:20-21hrs'
 when duration = '21-22hrs'		then 'y:21-22hrs'
 when duration = '22-23hrs'		then 'z:22-23hrs'
 when duration = '23-24hrs'		then 'zz:23-24hrs'
 when duration = 'gt 24 hrs'	then 'zzz:gt 24 hrs'
else duration end as duration
, count(1) 
from t2 group by 1 order by 1 
;


-- data breakdown 
with report_2 as (
select
	bb.msisdn, bb.create_date as time_sfx_received,
s.receipt_timestamp as time_sfx_released,
bb.activation_date as hprov_time,
	round((extract(epoch from bb.activation_date)::numeric - extract(epoch from bb.create_date)::numeric)/ 60, 2) as TIME_TAKEN
from
	meta_data m
join basic_data b on	m.basic_data_fk = b.id
join user_id u on	b.user_id_fk = u.id
join sms_activation_request s on	s.unique_id = u.unique_id
join bfp_sync_log bb on	s.unique_id = bb.unique_id
where	bfpsyncstatusenum = 'SUCCESS'
	and msisdn = s.phone_number
	and date(bb.create_date) = '2021-05-24'
	-- order by bb.create_date
)
select	*,
case 
	when time_taken between 0 and 5 then '0-5mins'
	when time_taken between 6 and 10 then '6-10mins'
	when time_taken between 11 and 30 then '11-30mins'
	when time_taken between 31 and 60 then '31mins-1hr'
	when time_taken between 61 and 120 then '1-2hrs'
	when time_taken between 121 and 180 then '2-3hrs'
	when time_taken between 181 and 240 then '3-4hrs'
	when time_taken between 241 and 300 then '4-5hrs'
	when time_taken between 301 and 360 then '5-6hrs'
	when time_taken between 361 and 420 then '6-7hrs'
	when time_taken between 421 and 480 then '7-8hrs'
	when time_taken between 481 and 540 then '8-9hrs'
	when time_taken between 541 and 600 then '9-10hrs'
	when time_taken between 601 and 660 then '10-11hrs'
	when time_taken between 661 and 720 then '11-12hrs'
	when time_taken between 721 and 780 then '12-13hrs'
	when time_taken between 781 and 840 then '13-14hrs'
	when time_taken between 841 and 900 then '14-15hrs'
	when time_taken between 901 and 960 then '15-16hrs'
	when time_taken between 961 and 1020 then '16-17hrs'
	when time_taken between 1021 and 1080 then '17-18hrs'
	when time_taken between 1081 and 1040 then '18-19hrs'
	when time_taken between 1041 and 1200 then '19-20hrs'
	when time_taken between 1201 and 1260 then '20-21hrs'
	when time_taken between 1261 and 1320 then '21-22hrs'
	when time_taken between 1321 and 1380 then '22-23hrs'
	when time_taken between 1381 and 1439 then '23-24hrs'
	when time_taken > 1439 then 'gt 24 hrs'
	when time_taken is null then 'N/A'
else 'gt 24 hrs' end as duration 
from report_2 
--  order by time_taken desc
;