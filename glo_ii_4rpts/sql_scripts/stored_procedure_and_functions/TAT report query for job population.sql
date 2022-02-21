-- PROCEDURE: public.capturetosync_new()

-- DROP PROCEDURE public.capturetosync_new();

CREATE OR REPLACE PROCEDURE public.capturetosync_new(
	)
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 
BEGIN

execute immediate 'truncate table daily_reg';

execute immediate 'truncate table capture2sync_NEW';

Insert Into Daily_Reg
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
AND  trunc(receipt_timestamp)=trunc(sysdate);

COMMIT;

INSERT INTO capture2sync_NEW 
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
select to_char(s.receipt_timestamp, 'yyyy-mm-dd hh24') "hour",status,
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
    else 'Greater than 1 day'
   end  capture2sync_mins
  from bfp_sync_log b, sms_activation_request s
  where right(b.msisdn, 10) = right(s.phone_number, 10)
and trunc(s.receipt_timestamp)=trunc(sysdate)
  )
group by hour,capture2sync_mins,status
)
GROUP BY hour,status
order by hour;

COMMIT;

END$BODY$;
