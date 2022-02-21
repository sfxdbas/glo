--Query1

select 
b.agent_email_address, count(s.phone_number) as "total_registrations", s.registration_type, b.capture_mode, 
b.transfer_mode, date_trunc('day', receipt_timestamp)as "receipt_date"
from sms_activation_request s, bfp_sync_log b
where b.unique_id = s.unique_id 
and s.phone_number = b.msisdn
and trunc(s.receipt_timestamp) < '2020-04-17'
and lower(b.bfpsyncstatusenum) = 'success' 
and b.deleted='false'
group by 1,3,4,5,6

--Query2

select 
count(s.phone_number) as "total_registrations", dda5 as "Resident State", dda6 as "Resident LGA", 
da36 as "Nationality", da7 as "Age Range", da5 as "ID Type"
from sms_activation_request s, bid_view bv, dynamic_data d, bfp_sync_log b
where s.unique_id = bv.unique_id 
and d.basic_data_fk = bv.id
and b.unique_id = s.unique_id
and s.phone_number = b.msisdn
and trunc(s.receipt_timestamp) < '2020-04-17'
and lower(b.bfpsyncstatusenum) = 'success' 
and b.deleted='false'
group by 2,3,4,5,6

--Query3

select 
date_trunc('hour', s.receipt_timestamp)as "registration_hour", count(s.phone_number) as "total_registrations", 
registration_type
from sms_activation_request s, bfp_sync_log b
where b.unique_id = s.unique_id 
and s.phone_number = b.msisdn
and trunc(s.receipt_timestamp) < '2020-04-17'
and lower(b.bfpsyncstatusenum) = 'success' 
and b.deleted='false'
group by 1, 3

--Query4

select 
avg(round((extract(epoch from b.file_sync_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60, 2 )) capture2sync_mins, 
avg(round((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60, 2 )) capture2mcentric_Mins,
avg(round((extract(epoch from s.receipt_timestamp)::numeric - extract(epoch from s.file_sync_date)::numeric)/60, 2 )) capture2mcentric_Mins,
count(s.phone_number) as "total_registrations"
from sms_activation_request s, bfp_sync_log b
where b.unique_id = s.unique_id 
and s.phone_number = b.msisdn
and trunc(s.receipt_timestamp) < '2020-04-17'
and lower(b.bfpsyncstatusenum) = 'success' 
and b.deleted='false'