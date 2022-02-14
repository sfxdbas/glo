create table pre_post_paid_tbl as 
SELECT
    DISTINCT S.phone_number,
    S.unique_id,
    S.registration_timestamp,
    S.receipt_timestamp,
    S.agility_push_timestamp as confirmation_timestamp,
	BB.activation_date,
    S.REGISTRATION_TYPE,
    bb.FILE_SYNC_DATE,
    ss.name as reg_state,
    BB.target_path,
	mps.platform, 
	m.app_version
from sms_activation_request s, bid_view b, meta_data m, bfp_sync_log bb, DYNAMIC_DATA D,state ss, msisdn_provision_status mps
where s.unique_id = bb.unique_id
AND s.phone_number=bB.msisdn
and bb.unique_id = b.unique_id
and mps.unique_id = bb.unique_id
and mps.msisdn = bb.msisdn 
And B.Id = M.Basic_Data_Fk
And D.Basic_Data_Fk = B.Id
and s.state_id=ss.id
and bb.bfpsyncstatusenum = 'SUCCESS'
and date(s.receipt_timestamp)= date(now)-1
;

create table PREPAID_TAT as 
select p.*,
ABS(ROUND((EXTRACT(EPOCH from ACTIVATION_DATE)::NUMERIC - EXTRACT(EPOCH from REGISTRATION_TIMESTAMP)::NUMERIC)/60)) AS total_time_prepaid,
ABS(ROUND((EXTRACT(EPOCH from ACTIVATION_DATE)::NUMERIC - EXTRACT(EPOCH from Receipt_timestamp)::NUMERIC)/60)) AS seamfix_to_hprov_prepaid,
ABS(ROUND((EXTRACT(EPOCH from Receipt_timestamp)::NUMERIC - EXTRACT(EPOCH from REGISTRATION_TIMESTAMP)::NUMERIC)/60)) as CAPTURE2BACKEND_prepaid
from pre_post_paid_tbl p 
where platform like 'ICC%'
and date(receipt_timestamp)=date(now)-1
;

create table POSTPAID_TAT as 
select p.*,
ABS(ROUND((EXTRACT(EPOCH from ACTIVATION_DATE)::NUMERIC - EXTRACT(EPOCH from REGISTRATION_TIMESTAMP)::NUMERIC)/60)) AS total_time_postpaid,
ABS(ROUND((EXTRACT(EPOCH from ACTIVATION_DATE)::NUMERIC - EXTRACT(EPOCH from Receipt_timestamp)::NUMERIC)/60)) AS seamfix_to_hprov_postpaid,
ABS(ROUND((EXTRACT(EPOCH from Receipt_timestamp)::NUMERIC - EXTRACT(EPOCH from REGISTRATION_TIMESTAMP)::NUMERIC)/60)) as CAPTURE2BACKEND_postpaid
from pre_post_paid_tbl p 
where platform like 'CBS%'
and date(receipt_timestamp)=date(now)-1
;

select date(receipt_timestamp), count(1) from PREPAID_TAT group by 1 order by 2 desc ;
select date(receipt_timestamp), count(1) from PostPAID_TAT group by 1 order by 2 desc ;


with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when total_time_prepaid <= 1 then 'A: less than 1 min'
 	when total_time_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when total_time_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when total_time_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when total_time_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when total_time_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when total_time_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 order by total_time_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
 
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when seamfix_to_hprov_prepaid <= 1 then 'A: less than 1 min'
 	when seamfix_to_hprov_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when seamfix_to_hprov_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when seamfix_to_hprov_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when seamfix_to_hprov_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when seamfix_to_hprov_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when seamfix_to_hprov_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 order by seamfix_to_hprov_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
 with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when CAPTURE2BACKEND_prepaid <= 1 then 'A: less than 1 min'
 	when CAPTURE2BACKEND_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when CAPTURE2BACKEND_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when CAPTURE2BACKEND_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when CAPTURE2BACKEND_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when CAPTURE2BACKEND_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when CAPTURE2BACKEND_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 order by CAPTURE2BACKEND_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
 with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when total_time_postpaid <= 1 then 'A: less than 1 min'
 	when total_time_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when total_time_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when total_time_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when total_time_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when total_time_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when total_time_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 order by total_time_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  

with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when seamfix_to_hprov_postpaid <= 1 then 'A: less than 1 min'
 	when seamfix_to_hprov_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when seamfix_to_hprov_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when seamfix_to_hprov_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when seamfix_to_hprov_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when seamfix_to_hprov_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when seamfix_to_hprov_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 order by seamfix_to_hprov_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  


with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when CAPTURE2BACKEND_postpaid <= 1 then 'A: less than 1 min'
 	when CAPTURE2BACKEND_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when CAPTURE2BACKEND_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when CAPTURE2BACKEND_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when CAPTURE2BACKEND_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when CAPTURE2BACKEND_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when CAPTURE2BACKEND_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 order by CAPTURE2BACKEND_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
--> continue with device type (win & droid) 
  -->win
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when total_time_prepaid <= 1 then 'A: less than 1 min'
 	when total_time_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when total_time_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when total_time_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when total_time_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when total_time_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when total_time_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.0', '1.1', '1.2', '1.3', '1.31', '1.32')
 order by total_time_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
 
 -->droid
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when total_time_prepaid <= 1 then 'A: less than 1 min'
 	when total_time_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when total_time_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when total_time_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when total_time_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when total_time_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when total_time_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.00',  '1.20', '1.21', '1.22')
 order by total_time_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  

-->win
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when seamfix_to_hprov_prepaid <= 1 then 'A: less than 1 min'
 	when seamfix_to_hprov_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when seamfix_to_hprov_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when seamfix_to_hprov_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when seamfix_to_hprov_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when seamfix_to_hprov_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when seamfix_to_hprov_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.0', '1.1', '1.2', '1.3', '1.31', '1.32')
 order by seamfix_to_hprov_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
 
 -->droid
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when seamfix_to_hprov_prepaid <= 1 then 'A: less than 1 min'
 	when seamfix_to_hprov_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when seamfix_to_hprov_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when seamfix_to_hprov_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when seamfix_to_hprov_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when seamfix_to_hprov_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when seamfix_to_hprov_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.00',  '1.20', '1.21', '1.22')
 order by seamfix_to_hprov_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
  -->win
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when capture2backend_prepaid <= 1 then 'A: less than 1 min'
 	when capture2backend_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when capture2backend_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when capture2backend_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when capture2backend_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when capture2backend_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when capture2backend_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.0', '1.1', '1.2', '1.3', '1.31', '1.32')
 order by capture2backend_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
 
 -->droid
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when capture2backend_prepaid <= 1 then 'A: less than 1 min'
 	when capture2backend_prepaid between 2 and 5 then 'B: 2-5 mins'
 	when capture2backend_prepaid between 6 and 10 then 'C: 6-10 mins'
 	when capture2backend_prepaid between 11 and 30 then 'D: 11-30 mins'
 	when capture2backend_prepaid between 31 and 60 then 'E: 31mins-1 hour'
 	when capture2backend_prepaid between 61 and 120 then 'F: 1-2 hours'
 	when capture2backend_prepaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PrePAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.00',  '1.20', '1.21', '1.22')
 order by capture2backend_prepaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
 -->win
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when capture2backend_postpaid <= 1 then 'A: less than 1 min'
 	when capture2backend_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when capture2backend_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when capture2backend_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when capture2backend_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when capture2backend_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when capture2backend_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.0', '1.1', '1.2', '1.3', '1.31', '1.32')
 order by capture2backend_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
 
 -->droid
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when capture2backend_postpaid <= 1 then 'A: less than 1 min'
 	when capture2backend_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when capture2backend_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when capture2backend_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when capture2backend_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when capture2backend_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when capture2backend_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.00',  '1.20', '1.21', '1.22')
 order by capture2backend_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
  -->win
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when seamfix_to_hprov_postpaid <= 1 then 'A: less than 1 min'
 	when seamfix_to_hprov_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when seamfix_to_hprov_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when seamfix_to_hprov_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when seamfix_to_hprov_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when seamfix_to_hprov_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when seamfix_to_hprov_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.0', '1.1', '1.2', '1.3', '1.31', '1.32')
 order by seamfix_to_hprov_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
 
 -->droid
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when seamfix_to_hprov_postpaid <= 1 then 'A: less than 1 min'
 	when seamfix_to_hprov_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when seamfix_to_hprov_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when seamfix_to_hprov_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when seamfix_to_hprov_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when seamfix_to_hprov_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when seamfix_to_hprov_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.00',  '1.20', '1.21', '1.22')
 order by seamfix_to_hprov_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
  -->win
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when total_time_postpaid <= 1 then 'A: less than 1 min'
 	when total_time_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when total_time_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when total_time_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when total_time_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when total_time_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when total_time_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.0', '1.1', '1.2', '1.3', '1.31', '1.32')
 order by total_time_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
 
 -->droid
with t2 as (
 with t1 as (
 SELECT  DATE(receipt_timestamp), 
 case
 	when total_time_postpaid <= 1 then 'A: less than 1 min'
 	when total_time_postpaid between 2 and 5 then 'B: 2-5 mins'
 	when total_time_postpaid between 6 and 10 then 'C: 6-10 mins'
 	when total_time_postpaid between 11 and 30 then 'D: 11-30 mins'
 	when total_time_postpaid between 31 and 60 then 'E: 31mins-1 hour'
 	when total_time_postpaid between 61 and 120 then 'F: 1-2 hours'
 	when total_time_postpaid between 121 and 1440 then 'G: within 1 day'
 	else 'H: greater than 1 day' end as time_
 from PostPAID_TAT
 where date(receipt_timestamp) = date(now)-1
 and app_version in ('1.00',  '1.20', '1.21', '1.22')
 order by total_time_postpaid
 )
 select time_, count(1)
 from t1
 group by 1
 order by 1
 ) 
 select time_, count, (round((count / SUM(count) OVER ()),2)*100)::int||'%' AS "%"
 from t2
 group by time_, count
  ;
  
  
 
 