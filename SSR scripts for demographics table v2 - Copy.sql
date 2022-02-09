create table b_msisdn_entry_keep_28012022 as 
with tab_a as (
select * from (
select 
row_number() over (partition by msisdn order by create_date desc ),
* 
from sim_swap_demographic qr
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select msisdn from msisdn_entry_keep_28012022 mek where mek.msisdn = qr.msisdn)
) a 
where row_number =1
), tab_b as (
select * from (
select row_number() over (partition by bsl.msisdn order by bsl.create_date desc ) as rank_,
*
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and exists (
select 1 
from msisdn_entry_keep_28012022 mek 
where mek.msisdn = bsl.msisdn 
)
) b where rank_ = 1
and reg_type not in ('ARC','CAR','CN','SSR','CSR','NLR','CR','NMSC','RRC')
) 
select tab_b.create_date bsl_date, tab_a.create_date ssd_date,msisdn , tab_b.reg_type
from tab_a 
join tab_b using ( msisdn ) 
where tab_b.create_date < tab_a.create_date
;

-- USER_ID 
-->
INSERT INTO public.user_id
(id, active, blacklisted, "conflict", u_part_key, description, unique_id)
select hibernate_sequence.nextval, NULL, NULL, false, create_date , NULL, unique_id 
from (
select 
row_number() over (partition by msisdn order by create_date desc ),
* 
from sim_swap_demographic qr
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a 
where row_number =1
;


-- BASIC_DATA
-->
INSERT INTO public.basic_data
(id, biometric_capture_agent, birthday, bd_part_key, firstname, gender, is_processed,
 last_basic_data_edit_agent, last_basic_data_edit_login_id, match_found, match_id, othername,
 sms_status, surname, sv_init_timestamp, sv_push_timestamp, sv_status, sync_status, 
 state_of_registration_fk, user_id_fk, user_category)
with a as  (
select hibernate_sequence.nextval id,biometric_capture_agent, birthday::timestamp,  bd_part_key, first_name firstname,
gender, false is_processed,agent_f_name||' '||agent_l_name last_basic_data_edit_agent,
agent_f_name||' '||agent_l_name last_basic_data_edit_login_id,false match_found,null match_id, middle_name othername,
 'NOT_SENT' sms_status, surname, null sv_init_timestamp, null sv_push_timestamp, null sv_status, null sync_status, 
 state_fk state_of_registration_fk, id user_id_fk, null user_category,msisdn
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn ,
ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
  qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
left join state l on upper(l."name") = upper(qr.state_of_registration)
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a 
where row_number =1
), b as ( 
select * from (
select row_number () over (partition by bsl.msisdn order by bsl.create_date desc ),
bd.state_of_registration_fk sofr2, bsl.msisdn 
from bfp_sync_log bsl 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = bsl.msisdn)
) a where row_number = 1
) 
select id,biometric_capture_agent, birthday::timestamp,  bd_part_key,  firstname,
case when lower(gender) in ('m','male') then 'MALE' 
when LOWER(GENDER) in ('f','female') thEN 'FEMALE' else GENDER end GENDER,  is_processed, last_basic_data_edit_agent,
last_basic_data_edit_login_id, match_found, match_id,  othername,
sms_status, surname,  null sv_init_timestamp, null  sv_push_timestamp,  sv_status,  sync_status, 
 sofr2 state_of_registration_fk,  user_id_fk,  user_category 
from a 
join b using ( msisdn )
;



INSERT INTO public.dynamic_data
(id,da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
dda10,dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda23,dda25,dda29,dda32,
dda34,dda36,dda40,dda43,dda44,dda58,dda59,dda67,basic_data_fk)
with a as (
select /*hibernate_sequence.nextval id,da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
dda10,dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda23,dda25,dda29,dda32,
dda34,dda36,dda40,dda43,dda44,dda58,dda59,dda67,basic_data_fk*/ *
from(
select row_number () over (partition by bsl.msisdn order by bsl.create_date desc ),
da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
dda10,dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda25,dda29,dda32,
dda40,dda43,dda44,dda58,dda59,dda67,bsl.msisdn 
from bfp_sync_log bsl 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where bfpsyncstatusenum = 'SUCCESS'
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = bsl.msisdn)
) a where row_number = 1
) , b as ( select * from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn ,nvl.transaction_id dda23
,nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
  qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
left join state l on upper(l."name") = upper(qr.state_of_registration)
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
)
select hibernate_sequence.nextval id,da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
dda10,'SSR' dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda23,dda25,dda29,dda32,
dda34,dda36,dda40,dda43,dda44,dda58,dda59,dda67,basic_data_fk 
from a 
join b using ( msisdn )
;




--ENROLLMENT_LOG
-->
INSERT INTO public.enrollment_log
(id, enrollment_date, enrollment_time, basic_data_fk, enrollment_ref_fk)
select hibernate_sequence.nextval id, create_date enrollment_date, create_date enrollment_time, basic_data_fk, enrollment_ref_fk
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  er.id as enrollment_ref_fk,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
  qr.create_date ,qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
left join state l on upper(l."name") = upper(qr.state_of_registration)
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;




INSERT INTO public.msisdn_detail
(id, activation_status, activation_timestamp, msisdn, msdidn_part_key, new_subscriber,
 serial, subscriber_type, yellow_account_enabled, yellow_account_types, zap, basic_data_fk,
 msisdn_category, platform, imsi, visitor, alternate_number, first_name, last_name, nin,
 nin_status, transaction_id, user_category, corporate_category)
select hibernate_sequence.nextval id,null activation_status,null  activation_timestamp, msisdn,null msdidn_part_key,false  new_subscriber,
 sim_serial serial,'PREPAID' subscriber_type, false yellow_account_enabled,null yellow_account_types, false zap, basic_data_fk,
 'MOBILE' msisdn_category,null platform,null imsi, false visitor, null alternate_number, first_name, surname last_name, dda34 nin,
 dda36 nin_status,  transaction_id, null user_category, null corporate_category
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
  qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id 
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
left join state l on upper(l."name") = upper(qr.state_of_registration)
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;



--META_DATA
-->
INSERT INTO public.meta_data
(id, agent_mobile, app_version, capture_machine_id, confirmation_timestamp, latitude, 
location_accuracy, longitude, mocked_coordinate, realtime_device_id,
 registration_network_status, state_of_registration, sync_timestamp, within_geofence, 
 basic_data_fk, enrollment_ref_fk, device_type, user_id)
select hibernate_sequence.nextval id,null agent_mobile,  app_version, mac_address capture_machine_id, null confirmation_timestamp, null latitude, 
null location_accuracy, null longitude, false  mocked_coordinate,device_id  realtime_device_id,
 null registration_network_status, state  state_of_registration, create_date sync_timestamp, null within_geofence, 
 basic_data_fk, enrollment_ref_fk, null device_type, null user_id
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
  qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  round(n.last_installed_update::numeric,2) as app_version, hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
join node n on n.enrollment_ref = er.id 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;




INSERT INTO public.bfp_sync_log
(pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date,
 msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip,
 instance_port, reg_type, rejection_reason, transfer_mode)
select hibernate_sequence.nextval id,true active, create_date, false deleted, last_modified, create_date activation_date,
'ACTIVATED' activationstatusenum, 'SUCCESS' bfpsyncstatusenum ,null file_name, create_date file_sync_date, msisdn, sim_serial, 
null source_path, null target_path, unique_id, enrollment_ref_fk, biometric_capture_agent agent_email_address, 'CLIENT' capture_mode
,device_id, '10.152.89.182' INSTANCE_IP, '8190' INSTANCE_PORT,'SSR' REG_TYPE,null REJECTION_REASON,  'HTTP' TRANSFER_MODE
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
 qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  qr.app_version , hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;




--SMS_ACTIVATION_REQUEST
-->
INSERT INTO public.sms_activation_request
(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status,
 sar_part_key, crm_update_time, customer_name, enrollment_ref, is_initiator, 
 msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, 
 receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number,
 state_id, status, unique_id, phone_number_status_fk)
select hibernate_sequence.nextval id, create_date activation_timestamp,null agility_push_timestamp,null crm_bio_update_time,
0 confirmation_status,
 create_date sar_part_key, null crm_update_time,surname ||' '||first_name customer_name,code enrollment_ref,true  is_initiator, 
 null msisdn_update_status,null msisdn_update_timestamp, msisdn phone_number,null previous_unique_id, 
 create_date receipt_timestamp,create_date  registration_timestamp,'SSR'  registration_type, 'BIOMETRICS' sender_number, sim_serial serial_number,
 STATE_FK state_id, 'UNACTIVATED' status, unique_id, hibernate_sequence.nextval phone_number_status_fk
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
 qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  qr.app_version , hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk,ER.CODE
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;




--PHONE_NUMBER_STATUS
-->
INSERT INTO public.phone_number_status
(id, churn_timestamp, final_timestamp, init_timestamp, remarks, status, tabsfilenumber)
select phone_number_status_fk id,null churn_timestamp, null final_timestamp, create_date init_timestamp, null remarks,
'ACTIVATED' status,null  tabsfilenumber
from (
select row_number() over (partition  by QR.unique_id order by qr.pk desc),
	(select phone_number_status_fk from sms_activation_request sar where QR.unique_id =sar.unique_id) phone_number_status_fk
	,qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name  
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
 qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  qr.app_version , hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk,ER.CODE
from sim_swap_demographic qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;



--PASSPORT
-->
INSERT INTO public.passport
(id, face_count, passport_data, basic_data_fk)
select hibernate_sequence.nextval id,  face_count, passport_data, basic_data_fk
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,N.machine_architecture ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name ,
PSS.face_count ,
 NVL.photo  as passport_data
,qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
 qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  qr.app_version , hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk,ER.CODE
from sim_swap_demographic qr 
left join passport_sim_swap pss on PSS.simwap_demographic_fk = QR.pk 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
join NODE N on N.enrollment_ref = ER.ID 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a where ROW_NUMBER = 1 
;




--SPECIAL_DATA
--> 
INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
select hibernate_sequence.nextval id,  BIOMETRIC_DATA, BIOMETRICDATATYPE,REASON, basic_data_fk, document_expiration_date
,DOCUMENT_NUMBER, null FILE_FORMAT
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,SDS.biometric_data , SDS.biometricdatatype , SDS.reason ,SDS.document_expiration_date , SDS.document_number 
,N.machine_architecture ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name ,
qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
 qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  qr.app_version , hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk,ER.CODE
from sim_swap_demographic qr 
 join special_data_simswap sds  on SDS.simwap_demographic_fk = QR.pk 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
join NODE N on N.enrollment_ref = ER.ID 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a --where ROW_NUMBER = 1 
;




--WSQ_IMAGE
-->
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
select hibernate_sequence.nextval id,  compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk
from (
select 
row_number() over (partition by msisdn order by qr.create_date desc ),qr.msisdn , nvl.nin dda34, 'NIN_VERIFIED' dda36 
,N.machine_architecture ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,nvl.birth_date  birthday,nvl.middle_name ,
qr.pk, qr.active, qr.create_date bd_part_key , qr.deleted, qr.last_modified,  qr.target_sim_serial sim_serial,
  nvl.first_name first_name, nvl.gender gender, qr.device_tag , nvl.surname surname, qr.unique_id, 
 qr.agent_email biometric_capture_agent ,  ui.id, l.id state_fk, bd.id basic_data_fk, nvl.transaction_id
,  qr.app_version , hbs.mac_address , qr.device_id ,l.name state , qr.create_date , er.id enrollment_ref_fk,ER.CODE
,wiss.compression_ratio ,wiss.finger,wiss.nfiq ,wiss.reason_code,wiss.wsq_data 
from sim_swap_demographic qr 
join wsq_image_sim_swap wiss on wiss.simwap_demographic_fk = QR.pk 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk =bd.id 
join km_user ku on lower(ku.email_address )= lower(qr.agent_email )
join nimc_verification_log nvl on nvl.transaction_id = qr.transaction_id 
join enrollment_ref er on er.device_id = qr.device_id 
join NODE N on N.enrollment_ref = ER.ID 
left join heart_beat_status hbs on hbs.realtime_device_id = qr.device_id 
left join state l on l.id  = bd.state_of_registration_fk 
where check_status = 'CHECKED' 
and swap_status = 'SWAPPED' 
and subscriber_update_status = 'PENDING' 
and (biometric_update_consent is  true or demographic_update_consent is true or update_consent is true)
and exists (select 1 from b_msisdn_entry_keep_28012022 bmek where bmek.msisdn = qr.msisdn)
) a --where ROW_NUMBER = 1 
;


















