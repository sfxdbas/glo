--> BFP_SYNC_LOG
insert into bfp_sync_log 
select  HIBERNATE_SEQUENCE.NEXTVAL PK,QR.ACTIVE ,QR.CREATE_DATE,QR.DELETED,QR.LAST_MODIFIED,QR.create_date ACTIVATION_DATE,
'ACTIVATED' activationstatusenum,'SUCCESS' bfpsyncstatusenum, null file_name, NOW file_sync_date,QMD.MSISDN,
QMD.serial SIM_SERIAL,null source_path,null target_path,
QR.UNIQUE_ID, ER.ID as ENROLLMENT_REF_FK, QR.registration_agent as AGENT_EMAIL_ADDRESS, 'SIMROP' CAPTURE_MODE, 
er.DEVICE_ID, '10.152.89.182' INSTANCE_IP, '8190' INSTANCE_PORT,qr.dda11 REG_TYPE,null REJECTION_REASON,  'HTTP' TRANSFER_MODE, 
'NOT_APPLICABLE' MSISDN_COMPLIANCE_STATUS, '2021-09-22 11:17:50' MSISDN_COMPLIANCE_TIMSETAMP 
from quarantined_registration qr
join quarantined_msisdn_detail qmd on qr.pk = qmd.quarantined_reg_fk 
join enrollment_ref er on ER.code = QR.kit_tag 
where unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464')
and not exists 
(select 1 from bfp_sync_log bsl where BSL.unique_id = QR.unique_id)
;


-- USER_ID 
-->
INSERT INTO public.user_id
(id, active, blacklisted, "conflict", u_part_key, description, unique_id)
select hibernate_sequence.nextval, NULL, NULL, false, create_date , NULL, unique_id 
from quarantined_registration qr 
where  unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464')
and not exists 
(select 1 from user_id ui where ui.unique_id = qr.unique_id )
;


-- BASIC_DATA
-->
INSERT INTO public.basic_data
(id, biometric_capture_agent, birthday, bd_part_key, firstname, gender, is_processed,
 last_basic_data_edit_agent, last_basic_data_edit_login_id, match_found, match_id, othername,
 sms_status, surname, sv_init_timestamp, sv_push_timestamp, sv_status, sync_status, 
 state_of_registration_fk, user_id_fk, user_category)
select hibernate_sequence.nextval id,registration_agent biometric_capture_agent, birthday, create_date bd_part_key, first_name firstname,
gender, false is_processed,agent_f_name||' '||agent_l_name last_basic_data_edit_agent,
agent_f_name||' '||agent_l_name last_basic_data_edit_login_id,false match_found,null match_id, other_name othername,
 'NOT_SENT' sms_status, surname, null sv_init_timestamp, null sv_push_timestamp, null sv_status, null sync_status, 
 state_fk state_of_registration_fk, id user_id_fk, null user_category 
from (
select 
ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, birthday, dda11, dda12, dda14, dda15, dda16, 
dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag, qr.other_name, 
passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, registration_date, 
release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, registration_type, da1, da11,
da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30, da31, da32, da33, da34, da35, 
da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30,
dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46, dda47, dda48, dda49, dda50, 
dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, dda76, dda77, dda78, dda79, 
dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95, dda96, dda97, dda98, dda99, 
dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id, l.state_fk 
from quarantined_registration qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join km_user ku on ku.pk = qr.km_user_fk 
join lga l on upper(l."name") = upper(qr.dda9)
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464'
) 
and not exists 
(select 1 from basic_data bd where bd.user_id_fk = ui.id )
)
;



-- DYNAMIC_DATA
--> 
INSERT INTO public.dynamic_data
(id,da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
dda10,dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda23,dda25,dda29,dda32,
dda34,dda36,dda40,dda43,dda44,dda58,dda59,dda67,basic_data_fk)
select hibernate_sequence.nextval id,da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
dda10,dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda23,dda25,dda29,dda32,
dda34,dda36,dda40,dda43,dda44,dda58,dda59,dda67,basic_data_fk
from (
select 
ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, dda15, dda16, 
dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag, qr.other_name, 
passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, registration_date, 
release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, registration_type, da1, da11,
da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30, da31, da32, da33, da34, da35, 
da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30,
dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46, dda47, dda48, dda49, dda50, 
dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, dda76, dda77, dda78, dda79, 
dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95, dda96, dda97, dda98, dda99, 
dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk , bd.id basic_data_fk 
from quarantined_registration qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join lga l on upper(l."name") = upper(qr.dda9)
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464'
) 
and  not exists 
(select 1 from dynamic_data dd where dd.basic_data_fk= bd.id )
) 
;


--ENROLLMENT_LOG
-->
INSERT INTO public.enrollment_log
(id, enrollment_date, enrollment_time, basic_data_fk, enrollment_ref_fk)
select hibernate_sequence.nextval id, create_date enrollment_date, create_date enrollment_time, basic_data_fk, enrollment_ref_fk
from (
select row_number() over (partition  by QR.unique_id order by qr.pk desc),
/*unique_id ,passport_data*/ /*,loread( lo_open( passport_data , 262144 ), 1000000 )  as photo */
ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join enrollment_ref er on er.code = qr.kit_tag 
join lga l on upper(l."name") = upper(qr.dda9)
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464'
) 
and  not exists 
(select 1 from enrollment_log el where el.basic_data_fk= bd.id )
)
;


--MSISDN_DETAIL
-->
INSERT INTO public.msisdn_detail
(id, activation_status, activation_timestamp, msisdn, msdidn_part_key, new_subscriber,
 serial, subscriber_type, yellow_account_enabled, yellow_account_types, zap, basic_data_fk,
 msisdn_category, platform, imsi, visitor, alternate_number, first_name, last_name, nin,
 nin_status, transaction_id, user_category, corporate_category)
select hibernate_sequence.nextval id,null activation_status,null  activation_timestamp, msisdn,null msdidn_part_key,false  new_subscriber,
 sim_serial serial,'PREPAID' subscriber_type, false yellow_account_enabled,null yellow_account_types, false zap, basic_data_fk,
 'MOBILE' msisdn_category,null platform,null imsi, false visitor, null alternate_number, first_name, surname last_name, dda34 nin,
 dda36 nin_status, dda23 transaction_id, null user_category, null corporate_category
from (
select bsl.msisdn, bsl.sim_serial ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
join bfp_sync_log bsl on bsl.unique_id = qr.unique_id 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join enrollment_ref er on er.code = qr.kit_tag 
join lga l on upper(l."name") = upper(qr.dda9)
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464'
) and  not exists 
(select 1 from msisdn_detail md where md.basic_data_fk= bd.id )
);



--META_DATA
-->
INSERT INTO public.meta_data
(id, agent_mobile, app_version, capture_machine_id, confirmation_timestamp, latitude, 
location_accuracy, longitude, mocked_coordinate, realtime_device_id,
 registration_network_status, state_of_registration, sync_timestamp, within_geofence, 
 basic_data_fk, enrollment_ref_fk, device_type, user_id)
select hibernate_sequence.nextval id,null agent_mobile,  app_version, mac_address capture_machine_id, null confirmation_timestamp, null latitude, 
null location_accuracy, null longitude, false  mocked_coordinate,  realtime_device_id,
 null registration_network_status, state  state_of_registration, create_date sync_timestamp, null within_geofence, 
 basic_data_fk, enrollment_ref_fk, null device_type, null user_id
from (
select row_number() over (partition  by QR.unique_id order by qr.pk desc),
		(select  round(n2.last_installed_update::numeric,2) from node n2-- km_user ku2, kyc_dealer kd2 
		where (n2.enrollment_ref)=(er.id )) as app_version,
		(select  s.name from state s 
		where (s.id )=(l.state_fk )) as state,
/*unique_id ,passport_data*/ /*,loread( lo_open( passport_data , 262144 ), 1000000 )  as photo */
/*s."name" state,*/ er.mac_address, er.device_id realtime_device_id ,/*bsl.msisdn, bsl.sim_serial ,*/ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
--join bfp_sync_log bsl on bsl.unique_id = qr.unique_id 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join enrollment_ref er on er.code = qr.kit_tag 
--join node n on n.enrollment_ref = er.id 
join lga l on upper(l."name") = upper(qr.dda9)
--join state s on s.id = l.state_fk 
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464') 
and  not exists 
(select 1 from meta_data md where md.basic_data_fk= bd.id )
) 
;


--SMS_ACTIVATION_REQUEST
-->
INSERT INTO public.sms_activation_request
(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status,
 sar_part_key, crm_update_time, customer_name, enrollment_ref, is_initiator, 
 msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, 
 receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number,
 state_id, status, unique_id, phone_number_status_fk, msisdn_compliance_status)
select hibernate_sequence.nextval id, create_date activation_timestamp,null agility_push_timestamp,null crm_bio_update_time,0 confirmation_status,
 create_date sar_part_key, null crm_update_time,surname ||' '||first_name customer_name,code enrollment_ref,true  is_initiator, 
 null msisdn_update_status,null msisdn_update_timestamp, msisdn phone_number,null previous_unique_id, 
 create_date receipt_timestamp,create_date  registration_timestamp,reg_type  registration_type, 'BIOMETRICS' sender_number, sim_serial serial_number,
 state_of_registration_fk state_id, 'UNACTIVATED' status, unique_id, hibernate_sequence.nextval phone_number_status_fk, 
 msisdn_compliance_status
from (
select row_number() over (partition  by QR.unique_id order by qr.pk desc),
		(select  round(n2.last_installed_update::numeric,2) from node n2-- km_user ku2, kyc_dealer kd2 
		where (n2.enrollment_ref)=(er.id )) as app_version,
		(select  s.name from state s 
		where (s.id )=(l.state_fk )) as state,
/*unique_id ,passport_data*/ /*,loread( lo_open( passport_data , 262144 ), 1000000 )  as photo */
bsl.msisdn_compliance_status ,bd.state_of_registration_fk ,bsl.reg_type ,er.code ,er.mac_address, er.device_id realtime_device_id ,bsl.msisdn, bsl.sim_serial ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
join bfp_sync_log bsl on bsl.unique_id = qr.unique_id 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join enrollment_ref er on er.code = qr.kit_tag 
--join node n on n.enrollment_ref = er.id 
join lga l on upper(l."name") = upper(qr.dda9)
--join state s on s.id = l.state_fk 
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464') 
and not exists 
(select 1 from sms_activation_request sar where sar.unique_id = bsl.unique_id and sar.phone_number= bsl.msisdn)
) 
;


--PHONE_NUMBER_STATUS
-->
INSERT INTO public.phone_number_status
(id, churn_timestamp, final_timestamp, init_timestamp, remarks, status, tabsfilenumber)
select phone_number_status_fk id,null churn_timestamp, null final_timestamp, create_date init_timestamp, null remarks,
'ACTIVATED' status,null  tabsfilenumber
from (
select		(select phone_number_status_fk from sms_activation_request sar where bsl.unique_id =sar.unique_id
and bsl.msisdn=sar.phone_number) phone_number_status_fk,
bsl.msisdn_compliance_status ,bd.state_of_registration_fk ,bsl.reg_type ,er.code ,er.mac_address, er.device_id realtime_device_id ,bsl.msisdn, bsl.sim_serial ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
qr.registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
join bfp_sync_log bsl on bsl.unique_id = qr.unique_id  
join USER_ID UI on UI.unique_id = QR.unique_id 
join sms_activation_request sar2 on sar2.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join enrollment_ref er on er.code = qr.kit_tag 
--join node n on n.enrollment_ref = er.id 
join lga l on upper(l."name") = upper(qr.dda9)
--join state s on s.id = l.state_fk 
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464') 
and bsl.msisdn =sar2.phone_number 
and not exists 
(select 1 from phone_number_status pns where pns.id = sar2.phone_number_status_fk)
) 
;


--PASSPORT
-->
INSERT INTO public.passport
(id, face_count, passport_data, basic_data_fk)
select hibernate_sequence.nextval id, null face_count, passport_data, basic_data_fk
from (
select 
bd.state_of_registration_fk ,er.code ,er.mac_address, er.device_id realtime_device_id ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
qr.registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
--join bfp_sync_log bsl on bsl.unique_id = qr.unique_id  
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join km_user ku on ku.pk = qr.km_user_fk 
join enrollment_ref er on er.code = qr.kit_tag 
--join node n on n.enrollment_ref = er.id 
join lga l on upper(l."name") = upper(qr.dda9)
--join state s on s.id = l.state_fk 
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464') 
and not exists 
(select 1 from passport p where p.basic_data_fk = bd.id)
) 
;


--WSQ_IMAGE
-->
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
select hibernate_sequence.nextval, qwi.compression_ratio , qwi.finger , qwi.nfiq ,qwi.reason_code , qwi.wsq_data  ,bd.id
from quarantined_wsq_image qwi 
join quarantined_registration qr on qr.pk = qwi.quarantined_reg_fk 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
where quarantined_reg_fk in (
select pk from (
select row_number() over (partition  by qr.unique_id order by qr.create_date desc),* 
-- bsl.msisdn_compliance_status ,bd.state_of_registration_fk ,bsl.reg_type ,er.code ,er.mac_address, er.device_id realtime_device_id ,bsl.msisdn, bsl.sim_serial ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
--qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
--dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
--qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
--registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
--qr.registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
--da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
--dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
--dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
--dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
--dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
--bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464')
and not exists 
(select 1 from wsq_image wi where wi.basic_data_fk = bd.id )
)
);



--SPECIAL_DATA
--> 
INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
select hibernate_sequence.nextval, qsd.biometric_data , qsd.biometricdatatype, qsd.reason , bd.id, qsd.document_expiration_date, 
qsd.document_number ,qsd.file_format 
from quarantined_special_data qsd 
join quarantined_registration qr on qr.pk = qsd.quarantined_reg_fk 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
where quarantined_reg_fk in (
select pk from (
select row_number() over (partition  by qr.unique_id order by qr.create_date desc),* 
-- bsl.msisdn_compliance_status ,bd.state_of_registration_fk ,bsl.reg_type ,er.code ,er.mac_address, er.device_id realtime_device_id ,bsl.msisdn, bsl.sim_serial ,ku.pk,ku.first_name agent_f_name,ku.surname agent_l_name,
--qr.pk, qr.active, qr.create_date, qr.deleted, qr.last_modified, da10, da13, da2, da3, da5, da6, da8, da9, qr.birthday, dda11, dda12, dda14, 
--dda15, dda16, dda17, dda18, dda19, dda20, dda5, dda6, dda7, dda8, dda9, eye_balling_km_user_fk, feedback, qr.first_name, qr.gender, kit_tag,
--qr.other_name, passport_data, passport_expiry_date, passport_issue_country, passport_number, quarantine_reason, registration_agent, 
--registration_date, release_status, residency_status, qr.surname, qr.unique_id, km_user_fk, dda34, eyeballing_rejection_reason_fk, da4, 
--qr.registration_type, da1, da11,da12, da14, da15, da16, da17, da18, da19, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da30,
--da31, da32, da33, da34, da35, da36, da37, da38, da39, da40, da7, dda1, dda10, dda13, dda2, dda21, dda22, dda23, dda24, dda25, dda26, dda27,
--dda28, dda29, dda3, dda30,dda31, dda32, dda33, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda41, dda42, dda43, dda44, dda45, dda46,
--dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda70, dda71, dda72, dda73, dda74, dda75, 
--dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95,
--dda96, dda97, dda98, dda99, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, ui.id user_id_fk, l.state_fk ,
--bd.id basic_data_fk , er.id enrollment_ref_fk
from quarantined_registration qr 
join USER_ID UI on UI.unique_id = QR.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
where qr.unique_id in ('GLO-DN-749M-1646406848925','GLO-HH-LAG-ETI-LA1LAVIDEA0177-709X-1646406026464')
and not exists 
(select 1 from special_data sd where sd.basic_data_fk=bd.id)
))
;
