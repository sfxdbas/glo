GLO REPORT

-- Query1

select count(s.unique_id) total_registrations, b.agent_email_address, b.capture_mode, b.reg_type, b.transfer_mode,
DATE_TRUNC('day', b.file_sync_date) as "file synchronization date",  
case when (trunc(s.registration_timestamp) != trunc(b.file_sync_date)) then 'Abnormal Registration'
else 'Normal Registration'
end as "Nature of Registration"
from sms_activation_request s, bfp_sync_log b
where s.unique_id = b.unique_id
and s.phone_number = b.msisdn
and lower(b.bfpsyncstatusenum) = 'success'
and b.deleted = 'false'
and (trunc(b.file_sync_date) between '2020-04-19' and '2020-04-25')
group by 2,3,4,5,6,7


-- Query2

select date_trunc('day', s.receipt_timestamp) as activation_date, count(s.unique_id) as total_registrations,
d.da36 as "Nationality", d.da7 as "Age Range", d.da5 as "Identification Type", upper(to_char(s.receipt_timestamp, 'day')) as "Day of Week",
m.latitude, m.longitude, m.state_of_registration, 
case when lower(m.registration_network_status) = 'off' then 'OFFLINE'
else 'ONLINE'
end as "Registration Status"
from sms_activation_request s, bid_view bv, dynamic_data d, meta_data m--, bfp_sync_log b
where d.basic_data_fk = bv.id
and m.basic_data_fk = bv.id
and bv.unique_id = s.unique_id
and (date_trunc('day', s.activation_timestamp) between '2020-04-19' and '2020-04-25')
group by 1,3,4,5,6,7,8,9,10

--Query3

select  trunc(b.file_sync_date) as "Synchronization Date", extract(hour from s.receipt_timestamp) as registration_hour, count(s.unique_id) as total_registrations,
s.registration_type, case when (trunc(s.registration_timestamp) != trunc(b.file_sync_date)) then 'Abnormal Registration'
else 'Normal Registration'
end as "Nature of Registration", case when lower(m.registration_network_status) = 'off' then 'OFFLINE'
else 'ONLINE'
end as "Registration Status"
from sms_activation_request s, bfp_sync_log b, meta_data m, bid_view bv
where s.unique_id = b.unique_id
and s.phone_number = b.msisdn
and m.basic_data_fk = bv.id
and bv.unique_id = s.unique_id
and lower(b.bfpsyncstatusenum) = 'success'
and b.deleted = 'false'
and (trunc(b.file_sync_date) between '2020-04-19' and '2020-04-25')
group by 1,2,4,5,6

--Query4

select avg(total_reg) from
(select
extract('week' from b.file_sync_date) "Week of Year", count(s.unique_id) as total_reg
from bfp_sync_log b, sms_activation_request s
where b.unique_id = s.unique_id 
and s.phone_number = b.msisdn
and lower(b.bfpsyncstatusenum) = 'success'
and b.deleted='false'
group by 1)
where "Week of Year" not in ('8', '9')

-- Query5

select
avg((extract(epoch from b.file_sync_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)) as "capture2sync Time",
avg((extract(epoch from s.Receipt_Timestamp)::numeric  - extract(epoch from b.File_Sync_Date)::numeric)) "sync2backend Time",
avg((extract(epoch from s.receipt_timestamp)::numeric  - extract(epoch from s.registration_timestamp)::numeric)) "capture2backend Time",
avg((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.receipt_timestamp)::numeric)) "backend2mcentric Time",
avg((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.registration_timestamp)::numeric)) "capture2mcentric Time",
count(*), case
when (trunc(s.registration_timestamp) != trunc(receipt_timestamp)) then 'Abnormal Registration'
else 'Normal Registration'
end as "Nature of Registration"
from sms_activation_request s, bfp_sync_log b
where b.unique_id = s.unique_id 
and s.phone_number = b.msisdn
and (trunc(s.receipt_timestamp) between '2020-04-19' and '2020-04-25')
and lower(b.bfpsyncstatusenum) = 'success'
and b.deleted='false'
group by 7