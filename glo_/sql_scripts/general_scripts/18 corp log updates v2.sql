--USER_ID
-->
--INSERT INTO public.user_id
--(id, active, blacklisted, "conflict", u_part_key, description, unique_id)
--VALUES(256722, NULL, NULL, false, '2022-01-16 05:39:25.705', NULL, 
--'GLO-HH-371S-1640852839529');


--BASIC_DATA
-->
--INSERT INTO public.basic_data
--(id, biometric_capture_agent, birthday, bd_part_key, firstname, gender, is_processed,
-- last_basic_data_edit_agent, last_basic_data_edit_login_id, match_found, match_id, othername,
-- sms_status, surname, sv_init_timestamp, sv_push_timestamp, sv_status, sync_status, 
-- state_of_registration_fk, user_id_fk, user_category)
--VALUES(256722, 'tochi.onyeonoru@gloworld.com', '1997-09-01 00:00:00.000', '2022-01-16 05:39:25.705', 
--'Charles', 'MALE', false, 'TOCHI ONYEONORU', 'TOCHI ONYEONORU', false, NULL, 'Ajiboye', 
--'NOT_SENT', 'Agunloye', NULL, NULL, NULL, 'NONE', 25, 256722, 'PRIMARY_TM');


--DYNAMIC_DATA
--> 
--INSERT INTO public.dynamic_data
--(id,da1,da2,da3,da5,da6,da7,da8,da9,da10,da11,da12,da13,da14,da15,da16,da17,da18,da19,da20,da21,
--da23,da24,da26,da27,da28,da29,da33,da34,da35,da36,da40,dda1,dda2,dda4,dda5,dda6,dda7,dda8,dda9,
--dda10,dda11,dda12,dda14,dda15,dda16,dda17,dda18,dda19,dda21,dda22,dda23,dda25,dda29,dda32,
--dda34,dda36,dda40,dda43,dda44,dda58,dda59,dda67,basic_data_fk)
-- VALUES (256722,'1983-09-08',NULL,'1 GLORY COLLEGE GBOKO','N/A',NULL,'31 - 40','BENUE','GBOKO',NULL,1,
-- 'GLORY COLLEGE','GBOKO','VERIFIED','RC208767','GBOKO MAKURDI ROAD','GBOKO',14,0,0,26,28,28,
-- 'UNCLIPPED',NULL,NULL,NULL,'ONLINE',NULL,NULL,NULL,NULL,525731564,'DANGOTE CEMENT FACTORY',15,
-- 'BENUE','GBOKO','981101','DANOGOTE  CEMENT','GBOKO','GLO-DH-343W-1630485735713','CR',
-- 'TSEBEE',23409,'RC208767 GBOKO MAKURDI ROAD GBOKO','BENUE','GBOKO',NULL,'NIGERIA','SEARCH',
-- NULL,'41390843867-1640867850772',NULL,NULL,'ONLINE',41390843867,'NIN_VERIFIED',
-- 'NOT_APPLICABLE','FIRST',NULL,'CORPORATE','PRIMARY_TM','CR',256722);



--ENROLLMENT_LOG
-->
--INSERT INTO public.enrollment_log
--(id, enrollment_date, enrollment_time, basic_data_fk, enrollment_ref_fk)
--VALUES(256722, '2021-12-30 12:00:00.968', '1970-01-01 09:40:18.968', 256722, 883807131);


--MSISDN_DETAIL
-->
--INSERT INTO public.msisdn_detail
--(id, activation_status, activation_timestamp, msisdn, msdidn_part_key, new_subscriber,
-- serial, subscriber_type, yellow_account_enabled, yellow_account_types, zap, basic_data_fk,
-- msisdn_category, platform, imsi, visitor, alternate_number, first_name, last_name, nin,
-- nin_status, transaction_id, user_category, corporate_category)
--VALUES(256722, NULL, NULL, '08158191001', NULL, false, '8923450506192889695F', 'PREPAID',
-- false, NULL, false, 256722, 'MOBILE', NULL, NULL, false, NULL, 'DAVID', 
-- 'VICTOR', '72883051595', NULL, NULL, 'PRIMARY_TM', NULL);


--META_DATA
-->
--INSERT INTO public.meta_data
--(id, agent_mobile, app_version, capture_machine_id, confirmation_timestamp, latitude, 
--location_accuracy, longitude, mocked_coordinate, realtime_device_id,
-- registration_network_status, state_of_registration, sync_timestamp, within_geofence, 
-- basic_data_fk, enrollment_ref_fk, device_type, user_id)
--VALUES(256722, '08055579741', '1.46', '80-CE-62-D8-53-D0', NULL, NULL, NULL, 
--NULL, false, 'INSYDE-CND80612YX', null, 'LAGOS', '2021-12-30 12:00:00.968',
-- NULL, 256722, 883807131, null, NULL);



--PHONE_NUMBER_STATUS
-->
--INSERT INTO public.phone_number_status
--(id, churn_timestamp, final_timestamp, init_timestamp, remarks, status, tabsfilenumber)
--VALUES(3076439950, NULL, NULL, '2021-12-30 09:42:49', '', 'ACTIVATED', NULL);


--SMS_ACTIVATION_REQUEST
-->
--INSERT INTO public.sms_activation_request
--(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status,
-- sar_part_key, crm_update_time, customer_name, enrollment_ref, is_initiator, 
-- msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, 
-- receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number,
-- state_id, status, unique_id, phone_number_status_fk, msisdn_compliance_status)
--VALUES(3076439950, '2021-12-30 09:42:49', NULL, NULL, 0, '2021-12-30 09:42:49',
-- NULL, 'Agunloye Charles', 'GLO-HH-371S', true, NULL, NULL, '08158191001',
-- NULL, '2021-12-30 09:42:49', '2022-01-17 11:12:14.968', 'CR', 'BIOMETRICS', 
-- '8923450506192889695F', 25, 'UNACTIVATED', 'GLO-HH-371S-1640852839529',
-- 3076439950, NULL);



--BFP_SYNC_LOG -- leave this just update to SUCCESS
-->
--UPDATE public.bfp_sync_log
--	SET bfpsyncstatusenum='SUCCESS'
--	WHERE pk=3076439950;

--AGILITY_PUSH_STATUS
-->
--INSERT INTO public.agility_push_status
--(pk, active, create_date, deleted, last_modified, basic_data_fk, error_category, 
--error_message, msisdn, quarantine_reason_code, quarantine_reason_description, resp_code,
-- resp_desc, response_time, serial, status, sync_file_name, unique_id)
--VALUES(3076439950, true, '2021-12-30 09:42:49', false, '2021-12-30 09:42:49', 
--256722, NULL, NULL, '08158191001', NULL, NULL, NULL, NULL, NULL, '8923450506192889695F',
-- 'PENDING', NULL, 'GLO-HH-371S-1640852839529');


--PASSPORT
-->
--INSERT INTO public.passport
--(id, face_count, passport_data, basic_data_fk)
select 256722, NULL, qr.passport_data, 256722
from quarantined_registration qr 
where unique_id = 'GLO-HH-371S-1640852839529'
;

--WSQ_IMAGE
-->
--INSERT INTO public.wsq_image
--(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
select hibernate_sequence.nextval, qwi.compression_ratio , qwi.finger , qwi.nfiq ,qwi.reason_code , qwi.wsq_data , 256722
from quarantined_wsq_image qwi 
where qwi.quarantined_reg_fk = any ( 
select pk 
from quarantined_registration qr 
where unique_id = 'GLO-HH-371S-1640852839529'
)
;



--SPECIAL_DATA
--> 
--INSERT INTO public.special_data
--(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
select hibernate_sequence.nextval, qsd.biometric_data , qsd.biometricdatatype, qsd.reason , 256722, qsd.document_expiration_date, 
qsd.document_number ,qsd.file_format 
from quarantined_special_data qsd 
where qsd.quarantined_reg_fk = any ( 
select pk 
from quarantined_registration qr 
where unique_id = 'GLO-HH-371S-1640852839529'
)
;
