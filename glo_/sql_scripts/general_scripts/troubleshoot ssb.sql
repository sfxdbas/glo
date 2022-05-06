select md.msisdn ,bsl.msisdn , bd.id, md.basic_data_fk, bsl.reg_type , bsl.create_date , bsl.unique_id, ui.unique_id 
from bfp_sync_log bsl , user_id ui, basic_data bd , msisdn_detail md
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and md.basic_data_fk = bd.id
and md.msisdn = bsl.msisdn 
and bsl.msisdn = '07056893547'
;

select * 
from bfp_sync_log bsl ;

--insert into bfp_sync_log 
select * --hibernate_sequence.nextval, true, now, false, now, 
from bfp_sync_log
where msisdn = '08113999687'
and reg_type = 'RRC'
;

--INSERT INTO public.bfp_sync_log
--(pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date,
-- msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, 
-- instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, glo_status, user_id)
with cte as (
select HIBERNATE_SEQUENCE.NEXTVAL, bsl.active, create_date, deleted, last_modified, activation_date, activationstatusenum,
bfpsyncstatusenum, file_name, file_sync_date, md.msisdn, md.serial , source_path, target_path, bsl.unique_id, enrollment_ref_fk, agent_email_address,
capture_mode, device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, 
msisdn_compliance_timestamp, glo_status, user_id
from bfp_sync_log bsl , user_id ui, basic_data bd , msisdn_detail md
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and md.basic_data_fk = bd.id
and bsl.msisdn = '08113999687'
) 
select * 
from cte 
where msisdn != '08113999687'
;


select bsl.create_date, md.msisdn ,bsl.msisdn , bd.id, md.basic_data_fk, bsl.reg_type , bsl.create_date , bsl.unique_id, ui.unique_id 
from bfp_sync_log bsl , user_id ui, basic_data bd , msisdn_detail md
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and md.basic_data_fk = bd.id
and bsl.msisdn = '08113999687'
;