select pk,msisdn ,unique_id , previous_reg_unique_id ,create_date 
from sim_swap_demographic ssd 
where (demographic_update_consent is true or biometric_update_consent is true)
and date(create_date)< '2021-12-05'
--and 
order by create_date 
;

select * 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and reg_type = 'SSR'
--order by 3
;


select bdl.firstname ,bd.firstname ,bdl.surname ,bd.surname ,bdl.birthday ,bd.birthday 
from basic_data_log bdl ,basic_data bd 
where bdl.basic_data_fk = bd.id 
and bd.id = 776340413
;

select bsl.msisdn ,ui.unique_id ,bdl.firstname ,bd.firstname ,bdl.surname ,bd.surname ,bdl.birthday ,bd.birthday, pl.passport_data , /*wil.wsq_data , wil.finger*/
ddl.basic_data_fk 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join basic_data_log bdl on bdl.basic_data_fk =bd.id 
join passport_log pl on pl.basic_data_fk =bd.id
--join  wsq_image_log wil on wil.basic_data_fk =bd.id 
join dynamic_data_log ddl on ddl.basic_data_fk = bd.id 
where bd.id =776340413
;

select * from user_id ;
select * from basic_data bd ;
select * from dynamic_data dd;
select * from passport p ;
select * from wsq_image wi ;

select * from user_id;

select 'GLO-HH-2345-'||extract( epoch from now )::numeric*1000;

select bsl.msisdn ,ui.unique_id ,bdl.firstname ,bd.firstname ,bdl.surname ,bd.surname ,bdl.birthday ,bd.birthday, pl.passport_data , /*wil.wsq_data , wil.finger*/
ddl.basic_data_fk 
from bfp_sync_log bsl 
right join user_id ui using (unique_id)
right join basic_data bd on bd.user_id_fk = ui.id 
right join basic_data_log bdl on bdl.basic_data_fk =bd.id 
right join passport_log pl on pl.basic_data_fk =bd.id
--join  wsq_image_log wil on wil.basic_data_fk =bd.id 
right join dynamic_data_log ddl on ddl.basic_data_fk = bd.id 
where bd.id =776340413
;

--insert into user_id 
select ui.*,bd.* -- ui.id, true active, false blacklisted, false "conflict",ui.u_part_key u_part_key, null description,
/*unique_id||'-'||round(extract( epoch from now )::numeric*1000)*/ UNIQUE_ID 
from  user_id ui
left join basic_data bd on bd.user_id_fk = ui.id 
left join basic_data_log bdl on bdl.basic_data_fk =bd.id 
left join passport_log pl on pl.basic_data_fk =bd.id
--join  wsq_image_log wil on wil.basic_data_fk =bd.id 
left join dynamic_data_log ddl on ddl.basic_data_fk = bd.id 
--where bdl.basic_data_fk =776340413
where ui.unique_id like '56580472%'
;




--insert into basic_data 
select hibernate_sequence.nextval as id , bdl.biometric_capture_agent, bdl.birthday,bd_part_key, bdl.firstname, bdl.gender, 
bdl.is_processed, bdl.last_basic_data_edit_agent, bdl.last_basic_data_edit_login_id, bdl.match_found, bdl.match_id, bdl.othername, 
bdl.sms_status, bdl.surname, bdl.sv_init_timestamp, bdl.sv_push_timestamp, bdl.sv_status, bdl.sync_status, bdl.state_of_registration_fk, 
3062816518 user_id_fk, bd.user_category
from 
basic_data_log bdl 
join basic_data bd on bd.id = bdl.basic_data_fk 
where bdl.basic_data_fk =776340413
;

select * from user_id where id = 3062816518;
select * from basic_data bd where user_id_fk =3062816518;
select * from dynamic_data dd where basic_data_fk = 3062824944;
select * from passport p where basic_data_fk = 3062824944;
select * from wsq_image wi where basic_data_fk = 3062824944;


--INSERT INTO public.dynamic_data
(id, da1, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da2, da20, da21, da22,da23, da24, da25, da26, da27, da28, da29, da3, 
da30, da31, da32, da33, da34, da35, da36, da37, da38, da39, da4, da40, da5, da6, da7, da8,da9, dda1, dda10, dda11, dda12, dda13, dda14, 
dda15, dda16, dda17, dda18, dda19, dda2, dda20, dda21, dda22, dda23, dda24, dda25, dda26,dda27, dda28, dda29, dda3, dda30, dda31, dda32,
dda33, dda34, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda5, dda6, dda7, dda8, dda9,basic_data_fk)
select hibernate_sequence.nextval id ,da1, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da2, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29,
da3, da30, da31, da32, da33, da34, da35, da36, da37, da38, da39, da4, da40, da5, da6, da7, da8, da9, dda1, dda10, dda11, dda12, dda13, dda14
, dda15, dda16, dda17, dda18, dda19, dda2, dda20, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30, dda31, dda32,
dda33, dda34, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda5, dda6, dda7, dda8, dda9, 3062824944 basic_data_fk
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join basic_data_log bdl on bdl.basic_data_fk =bd.id 
join passport_log pl on pl.basic_data_fk =bd.id
--join  wsq_image_log wil on wil.basic_data_fk =bd.id 
join dynamic_data_log ddl on ddl.basic_data_fk = bd.id 
where bd.id =776340413
;

--INSERT INTO public.passport
--(id, face_count, passport_data, basic_data_fk)
select hibernate_sequence.nextval id , pl.face_count , pl.passport_data , 3062824944 basicdatafk
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join basic_data_log bdl on bdl.basic_data_fk =bd.id 
join passport_log pl on pl.basic_data_fk =bd.id
--join  wsq_image_log wil on wil.basic_data_fk =bd.id 
join dynamic_data_log ddl on ddl.basic_data_fk = bd.id 
where bd.id =776340413
;

select * from wsq_image wi ;


--INSERT INTO wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
select hibernate_sequence.nextval id, compression_ratio, finger, nfiq, reason_code, wsq_data, 3062824944 basic_data_fk
from  bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join basic_data_log bdl on bdl.basic_data_fk =bd.id 
--join passport_log pl on pl.basic_data_fk =bd.id
join  wsq_image_log wil on wil.basic_data_fk =bd.id 
join dynamic_data_log ddl on ddl.basic_data_fk = bd.id 
where bd.id =776340413
;


/*SIM SWAP RE-REG UPDATE

1- Identify sim swap request with subscriber update before the last sim swap go live (SSR)
2- Identify the unique id of the current sim registration as at the time of swap.
3- Make a copy of the sim regstration data that is mapped to unique id in item 2 (NB: if there is no passport_log or wsq_image_log created for the record with the unique id in item 2,
then the copy made should not have portrait or fingerprint as the case may be.) The reg_type for the copy should be SSR
4- Update the copy from item 3 with the details found in the following tables for unique id in item 2:
1- basic_data_log
2- dynamic _data_log
3- wsq_image_log
4- passport_log*/


--msisdn - 08059955600
--unique_id - 56580472-1640107198573

select * 
from bfp_sync_log bsl 
where msisdn = '08059955600'
;

select * 
from basic_data_log bdl 
;

--INSERT INTO public.bfp_sync_log
(pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date, 
msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, 
instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, glo_status, user_id, 
rgs_attempt_count, rgs_due_timestamp, rgs_timestamp, deactivation_date)
select hibernate_sequence.nextval, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum,
file_name, file_sync_date, msisdn, sim_serial, source_path, target_path, '56580472-1640107198573' unique_id, enrollment_ref_fk, agent_email_address, capture_mode, 
device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, 
glo_status, user_id, rgs_attempt_count, rgs_due_timestamp, rgs_timestamp, deactivation_date
from bfp_sync_log bsl 
where reg_type ='New'
and msisdn ='08059955600'
;

--INSERT INTO public.sms_activation_request
(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status, sar_part_key, crm_update_time, customer_name,
enrollment_ref, is_initiator, msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, receipt_timestamp, 
registration_timestamp, registration_type, sender_number, serial_number, state_id, status, unique_id, phone_number_status_fk,
msisdn_compliance_status)
select hibernate_sequence.nextval,activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status, sar_part_key,
crm_update_time, customer_name, enrollment_ref, is_initiator, msisdn_update_status, msisdn_update_timestamp, phone_number, 
previous_unique_id, receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number, state_id, status, '56580472-1640107198573'  unique_id,
phone_number_status_fk, msisdn_compliance_status 
from sms_activation_request sar where registration_type ='New' and phone_number ='08059955600' ;

select * 
from bfp_sync_log bsl 
where msisdn = '08059955600' 
--and unique_id = '56580472-1640107198573'
;

select * 
from sms_activation_request sar 
where  phone_number ='08059955600' 
--and unique_id = '56580472-1640107198573'
;

