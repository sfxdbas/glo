-- eyaballing status
SELECT 'Total Eyeballed' as eyeballing, count(1) 
FROM EYEBALLING
-- where extract(month from create_date) = extract(month from now()-1) {make changes}
union all
SELECT case
		when status = 'Invalid' then 'Total Invalid'
		when status = 'Valid' then 'Total Valid'
		when status = 'Unreg' then 'Total Unregistered'
		else status end as status,
	  count(1)
FROM EYEBALLING
-- where extract(month from create_date) = extract(month from now()-1) {make changes}
group by status 
;

-- eyeballing agents
SELECT -- k.email_address,
b.agent_email_address,
count(1)
FROM EYEBALLING e, -- km_user k 
 bfp_sync_log b
where --e.kmuser_pk = k.pk 
e.bfp_sync_log_fk = b.pk 
-- and extract(month from e.create_date) = extract(month from now()-1) {make changes}
group by 1 
order by 2 desc 
;


-- hourly syncs
select 
	date(receipt_timestamp) "day",	round(extract(hour from receipt_timestamp)::numeric,2) "hour", 
	count(1) total
from sms_activation_request s
-- where date(receipt_timestamp) = date(now()) {make changes}
group by 1,2--  ,6
ORDER BY 2 
;


-- TAT Capture2Sync & Sync2HProv
create table Daily_Reg_pilot as 
SELECT
    /*+ parallel */
    DISTINCT S.phone_number,
    S.unique_id,
    S.registration_timestamp,
    S.receipt_timestamp,
    m.confirmation_timestamp,
    S.REGISTRATION_TYPE,
    bb.FILE_SYNC_DATE,
    s.state_id,
    (CASE WHEN bb.target_path like '\\10%' then 'LAN' else 'DMZ' END) AS CHANNEL,
    (CASE WHEN DA14 = 'UNVERIFIED' then 'OFFLINE' else 'ONLINE' END) AS STATUS
from sms_activation_request s, bid_view b, meta_data m, bfp_sync_log bb, DYNAMIC_DATA D
where s.unique_id = bb.unique_id
and bb.unique_id = b.unique_id
And B.Id = M.Basic_Data_Fk
And D.Basic_Data_Fk = B.Id
and bb.FILE_SYNC_DATE is not null
and bb.bfpsyncstatusenum = 'SUCCESS'
AND  trunc(receipt_timestamp)=trunc(sysdate)
-- {add changes}
;


create table capture2sync_NEW_pilot as 
SELECT  hour,status,
SUM(DECODE(capture2sync_mins, 'Within 1 Min', simreg_count, '0')) Within_0_1_Mins,
SUM(DECODE(capture2sync_mins, 'Within 3 Mins', simreg_count, '0')) Within_3_Mins,
SUM(DECODE(capture2sync_mins, 'Within 5 Mins', simreg_count, '0')) Within_5_Mins,
SUM(DECODE(capture2sync_mins, 'Within 8 Mins', simreg_count, '0')) Within_8_Mins,
SUM(DECODE(capture2sync_mins, 'Within 10 Mins', simreg_count, '0')) Within_10_Mins,
SUM(DECODE(capture2sync_mins, 'Within 15 Mins', simreg_count, '0')) Within_15_Mins,
SUM(DECODE(capture2sync_mins, 'Within 20 Mins', simreg_count, '0')) Within_20_Mins, 
SUM(DECODE(capture2sync_mins, 'Within 30 Mins', simreg_count, '0')) Within_30_Mins,
SUM(DECODE(capture2sync_mins, 'Within 1 Hour', simreg_count, '0')) Within_1_Hour,
SUM(DECODE(capture2sync_mins, 'Within 2 Hour', simreg_count, '0')) Within_2_Hour,
SUM(DECODE(capture2sync_mins, 'Within 1 Day', simreg_count, '0')) Within_1_Day,
SUM(DECODE(capture2sync_mins, 'Greater than 1 day', simreg_count, '0')) Greater_than_1_day,
sum(simreg_count) Total
FROM
(
select hour, capture2sync_mins, count(1) simreg_count,status
from (
select to_char(s.receipt_timestamp, 'hh24') "hour",status,
  case
    when (FILE_SYNC_DATE  - registration_timestamp ) <= interval '1 minute'  then 'Within 1 Min'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '2 minutes' and '3 minutes' then  'Within 3 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '4 minutes' and '5 minutes' then  'Within 5 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '6 minutes' and '8 minutes' then  'Within 8 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '9 minutes' and '10 minutes' then  'Within 10 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '11 minutes' and '15 minutes' then  'Within 15 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '16 minutes' and '20 minutes' then  'Within 20 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '21 minutes' and '30 minutes' then  'Within 30 Mins'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '31 minutes' and '60 minutes' then  'Within 1 Hour'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '61 minutes' and '120 minutes' then  'Within 2 Hour'
    when (FILE_SYNC_DATE  - registration_timestamp ) between interval '121 minutes' and '1440 minutes' then  'Within 1 Day'
    when (FILE_SYNC_DATE  - registration_timestamp ) > interval '1440 minutes' then  'Greater than 1 day'
   end  capture2sync_mins
  from bfp_sync_log b, sms_activation_request s
  where right(b.msisdn, 10) = right(s.phone_number, 10)
and trunc(s.receipt_timestamp)=trunc(sysdate)
-- {add changes}
  )
group by hour,capture2sync_mins,status
)
GROUP BY hour,status
order by hour
;
