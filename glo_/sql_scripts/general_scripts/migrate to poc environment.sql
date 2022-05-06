select * 
from user_id 
where unique_id in 
(select unique_id from sms_activation_request sar where phone_number in ('08055578784','08055571132'))
;

select * from basic_data bd where user_id_fk in (
select id
from user_id 
where unique_id in 
(select unique_id from sms_activation_request sar where phone_number in ('08055578784','08055571132'))
)
;

select * from passport  where basic_data_fk in (
select id from basic_data bd where user_id_fk in (
select id
from user_id 
where unique_id in 
(select unique_id from sms_activation_request sar where phone_number in ('08055578784','08055571132'))
))
;

select * from wsq_image wi  where basic_data_fk in (
select id from basic_data bd where user_id_fk in (
select id
from user_id 
where unique_id in 
(select unique_id from sms_activation_request sar where phone_number in ('08055578784','08055571132'))
))
;


select pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date, msisdn,
sim_serial, source_path, target_path, unique_id, 54054 as enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, user_id
from bfp_sync_log bsl where msisdn in 
('08055578784'
,'08055571132')
;

select * from msisdn_provision_status mps where msisdn in 
('08055578784'
,'08055571132')
;
