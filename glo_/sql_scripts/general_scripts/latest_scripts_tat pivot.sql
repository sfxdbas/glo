with pivot as (
with tt as (
with analysis as (
select bsl.msisdn,sar.registration_timestamp,sar.receipt_timestamp as time_released_from_eyeball,  bsl.create_date as backend_time, --, bsl.activation_date,
--	   ail_2.request_time  as siebel_request_time,ail_2.response_time  as siebel_response_time,
	   ail_1.request_time  as hprov_request_time,ail_1.response_time  as hprov_response_time
from bfp_sync_log bsl 
join sms_activation_request sar on sar.unique_id = bsl.unique_id 
join agility_integration_log_ ail_1 on (bsl.msisdn = 0||ail_1.msisdn and ail_1.request_type = 'HPROV_UNBAR')
--join agility_integration_log_ ail_2 on (bsl.msisdn = ail_2.msisdn and ail_2.request_type = 'SIM_REGISTER')
-- and sar.phone_number = ail.msi
where bsl.bfpsyncstatusenum = 'SUCCESS'
-- and bsl.msisdn = sar.phone_number 
and date(bsl.create_date) = '2021-05-24'
) 
select msisdn,backend_time,registration_timestamp,time_released_from_eyeball,--activation_date,siebel_request_time,siebel_response_time,
	   hprov_request_time,hprov_response_time,
--	   round((extract(epoch from activation_date)::numeric - extract(epoch from receipt_timestamp)::numeric)/60,2) as total_time_mins, 
	   round((extract(epoch from backend_time)::numeric - extract(epoch from registration_timestamp)::numeric)/60,2) as agent_to_sfx,
--	   round((extract(epoch from siebel_response_time)::numeric - extract(epoch from receipt_timestamp)::numeric)/60,2) as backend_to_siebel_mins,
	   round((extract(epoch from time_released_from_eyeball)::numeric - extract(epoch from backend_time)::numeric)/ 60, 2) as time_taken_to_release,
	   round((extract(epoch from hprov_response_time)::numeric - extract(epoch from hprov_request_time)::numeric)/60,2) as hprov_request_to_response_mins
from analysis a 
) select *,agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins as total_time,
 case 
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 0 and 5 then '0-5mins'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 6 and 10 then '6-10mins'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 11 and 30 then '11-30mins'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 31 and 60 then '31mins-1hr'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 61 and 120 then '1-2hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 121 and 180 then '2-3hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 181 and 240 then '3-4hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 241 and 300 then '4-5hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 301 and 360 then '5-6hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 361 and 420 then '6-7hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 421 and 480 then '7-8hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 481 and 540 then '8-9hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 541 and 600 then '9-10hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 601 and 660 then '10-11hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 661 and 720 then '11-12hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 721 and 780 then '12-13hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 781 and 840 then '13-14hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 841 and 900 then '14-15hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 901 and 960 then '15-16hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 961 and 1020 then '16-17hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1021 and 1080 then '17-18hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1081 and 1040 then '18-19hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1041 and 1200 then '19-20hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1201 and 1260 then '20-21hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1261 and 1320 then '21-22hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1321 and 1380 then '22-23hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins between 1381 and 1439 then '23-24hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins > 1439 then 'gt 24 hrs'
	when agent_to_sfx+time_taken_to_release+hprov_request_to_response_mins is null then 'N/A'
else 'gt 24 hrs' end as duratioN 
from tt
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
from pivot group by 1 order by 1 
;

