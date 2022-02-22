INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588905, 8.0, 'LEFT_INDEX_FINGER', 2, 'NOT APPLICABLE', 127182545, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588906, 8.0, 'LEFT_LITTLE_FINGER', 2, 'NOT NEEDED', 127182546, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588907, 8.0, 'LEFT_RING_FINGER', 2, 'NOT NEEDED', 127182547, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588908, 8.0, 'RIGHT_MIDDLE_FINGER', 2, 'NOT NEEDED', 127182548, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588909, 8.0, 'RIGHT_THUMB', 1, 'NOT APPLICABLE', 127182549, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588910, 8.0, 'RIGHT_RING_FINGER', 1, 'NOT NEEDED', 127182550, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588911, 8.0, 'LEFT_THUMB', 1, 'NOT APPLICABLE', 127182551, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588912, 8.0, 'LEFT_MIDDLE_FINGER', 2, 'NOT NEEDED', 127182552, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588913, 8.0, 'RIGHT_LITTLE_FINGER', 3, 'NOT NEEDED', 127182553, 3225588897);
INSERT INTO public.wsq_image
(id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk)
VALUES(3225588914, 8.0, 'RIGHT_INDEX_FINGER', 2, 'NOT APPLICABLE', 127182554, 3225588897);


INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
VALUES(3225588915, 127182555, 'MODE_OF_IDENTIFICATION', NULL, 3225588897, NULL, 'WER52090AA06', NULL);
INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
VALUES(3225588916, 127182556, 'Certificate Of Incorporation', '', 3225588897, NULL, NULL, NULL);


INSERT INTO public.passport
(id, face_count, passport_data, basic_data_fk)
VALUES(3225588900, 0, 127182544, 3225588897);


INSERT INTO public.phone_number_status
(id, churn_timestamp, final_timestamp, init_timestamp, remarks, status, tabsfilenumber)
VALUES(3225588903, NULL, NULL, '2022-02-17 02:20:52.627', '', 'ACTIVATED', NULL);


INSERT INTO public.sms_activation_request
(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status, sar_part_key, crm_update_time, customer_name, enrollment_ref, is_initiator, msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number, state_id, status, unique_id, phone_number_status_fk, msisdn_compliance_status)
VALUES(3225588904, '2022-02-17 02:20:52.627', NULL, NULL, 0, '2022-02-17 02:20:52.627', NULL, 'AFOLABI AKEEM', 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T', true, NULL, NULL, '08053000057', '611922458', '2022-02-17 02:20:52.627', '2021-09-17 13:09:41.916', 'SSR', 'BIOMETRICS', '8923450704204304353F', 25, 'UNACTIVATED', 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588903, NULL);


INSERT INTO public.meta_data
(id, agent_mobile, app_version, capture_machine_id, confirmation_timestamp, latitude, location_accuracy, longitude, mocked_coordinate, realtime_device_id, registration_network_status, state_of_registration, sync_timestamp, within_geofence, basic_data_fk, enrollment_ref_fk, device_type, user_id, applied_privileges, user_privileges)
VALUES(3225588901, '08055573777', '1.43', '10-78-D2-A4-16-A6', NULL, NULL, NULL, NULL, NULL, 'LENOVO-S5CDFRW', NULL, 'LAGOS', '2021-09-17 13:09:41.916', NULL, 3225588897, 2817631280, 'WIN', NULL, NULL, NULL);


INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588917, '2022-02-17 02:20:52.659', NULL, 'PORTRAIT', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588918, '2022-02-17 02:20:52.659', NULL, 'MODE_OF_IDENTIFICATION', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588919, '2022-02-17 02:20:52.659', NULL, 'LEFT_INDEX_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588920, '2022-02-17 02:20:52.659', NULL, 'LEFT_LITTLE_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588921, '2022-02-17 02:20:52.659', NULL, 'LEFT_RING_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588922, '2022-02-17 02:20:52.659', NULL, 'RIGHT_MIDDLE_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588923, '2022-02-17 02:20:52.659', NULL, 'RIGHT_THUMB', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588924, '2022-02-17 02:20:52.659', NULL, 'RIGHT_RING_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588925, '2022-02-17 02:20:52.659', NULL, 'LEFT_THUMB', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588926, '2022-02-17 02:20:52.659', NULL, 'LEFT_MIDDLE_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588927, '2022-02-17 02:20:52.659', NULL, 'RIGHT_LITTLE_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);
INSERT INTO public.crm_push_status
(id, crm_create_timestamp, crm_push_timestamp_, crm_type, push_status, "skip", skip_reason, unique_id, msisdn_detail_fk)
VALUES(3225588928, '2022-02-17 02:20:52.659', NULL, 'RIGHT_INDEX_FINGER', 'NOT_SENT', false, NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 3225588902);




INSERT INTO public.msisdn_detail
(id, activation_status, activation_timestamp, msisdn, msdidn_part_key, new_subscriber, serial, subscriber_type, yellow_account_enabled, yellow_account_types, zap, basic_data_fk, msisdn_category, platform, imsi, visitor, alternate_number, first_name, last_name, nin, nin_status, transaction_id, user_category, corporate_category, nin_link_status, nin_user_id, v_nin)
VALUES(3225588902, NULL, NULL, '08053000057', NULL, false, '8923450704204304353F', 'POSTPAID', NULL, NULL, false, 3225588897, 'Mobile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO public.enrollment_log
(id, enrollment_date, enrollment_time, basic_data_fk, enrollment_ref_fk)
VALUES(3225588899, '2021-09-17 13:09:41.916', '2021-09-17 13:09:41.916', 3225588897, 2817631280);


INSERT INTO public.dynamic_data
(id, da1, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da2, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da3, da30, da31, da32, da33, da34, da35, da36, da37, da38, da39, da4, da40, da5, da6, da7, da8, da9, dda1, dda10, dda11, dda12, dda13, dda14, dda15, dda16, dda17, dda18, dda19, dda2, dda20, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30, dda31, dda32, dda33, dda34, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda5, dda6, dda7, dda8, dda9, basic_data_fk, dda41, dda42, dda43, dda44, dda45, dda46, dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, dda70, dda71, dda72, dda73, dda74, dda75, dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95, dda96, dda97, dda98, dda99)
VALUES(3225588898, '13-04-1979', NULL, '5', 'OKOYA THOMAS SURULERE', 'OTA', 'VERIFIED', '1', 'ABEBE VILLAGE ROAD IGAMU SURULERE', 'LAGOS', '14', '1', 'IT PROFESSIONAL', '0', '25', NULL, '28', '28', NULL, 'UNCLIPPED', NULL, NULL, NULL, '5 OKOYA THOMAS SURULERE LAGOS', NULL, NULL, NULL, 'ONLINE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '****', 'N/A', NULL, '41 - 50', '****', '****', '611922458', 'GLO-DH-LAG-ETI-GWLAVI-361W-1630327841383', 'SSR', NULL, NULL, '613', '1 ABEBE VILLAGE ROAD IGAMU SURULERE LAGOS', 'LAGOS', 'SURULERE', '234', 'NIGERIA', 'SURULERE', NULL, 'SEARCH', NULL, '31555874672-1631880345451', NULL, NULL, NULL, 'islam', NULL, NULL, '2 AKINOLA STREET SANGO', NULL, NULL, 'ONLINE', NULL, '31555874672', NULL, 'NIN_VERIFIED', NULL, NULL, NULL, '15', 'NOT_REQUIRED', 'OGUN', 'ADO-ODO/OTA', NULL, 'NIGERIAN BREWERIES PLC', 'ETI OSA', 3225588897, NULL, NULL, 'FIRST', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CORPORATE', 'PRIMARY_TM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO public.agility_push_status
(pk, active, create_date, deleted, last_modified, basic_data_fk, error_category, error_message, msisdn, quarantine_reason_code, quarantine_reason_description, resp_code, resp_desc, response_time, serial, status, sync_file_name, unique_id)
VALUES(3225590461, true, '2022-02-17 02:21:14.417', false, '2022-02-17 02:21:14.417', 3225588897, NULL, NULL, '08053000057', NULL, NULL, NULL, NULL, NULL, '8923450704204304353F', 'PENDING', NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495');


INSERT INTO public.basic_data
(id, biometric_capture_agent, birthday, bd_part_key, firstname, gender, is_processed, last_basic_data_edit_agent, last_basic_data_edit_login_id, match_found, match_id, othername, sms_status, surname, sv_init_timestamp, sv_push_timestamp, sv_status, sync_status, state_of_registration_fk, user_id_fk, user_category)
VALUES(3225588897, 'temitope.mokikan@gloworld.com', '1979-04-13 00:00:00.000', '2022-02-17 02:20:52.580', 'AKEEM', 'm', false, 'TEMITOPE MOKIKAN', 'temitope.mokikan@gloworld.com', false, NULL, NULL, 'NOT_SENT', 'AFOLABI', NULL, NULL, NULL, 'NONE', 25, 3225588896, 'PRIMARY_TM');


INSERT INTO public.user_id
(id, active, blacklisted, "conflict", u_part_key, description, unique_id)
VALUES(3225588896, NULL, NULL, false, '2022-02-17 02:20:51.547', NULL, 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495');


INSERT INTO public.bfp_sync_log
(pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date, msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, glo_status, user_id, rgs_attempt_count, rgs_due_timestamp, rgs_timestamp, deactivation_date, deactivation_reason)
VALUES(3225588930, true, '2022-02-17 02:20:52.800', false, '2022-02-17 02:22:14.797', '2022-02-17 02:22:14.797', 'ACTIVATED', 'SUCCESS', 'BIO-cMQGC2qDwqc5l7p4I8YlbQ==.web.sync', '2022-02-17 02:20:52.502', '08053000057', '8923450704204304353F', '', '\\127.0.0.1\fix\_bio\receivedfiles\processed_syncs\2022-02-17', 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495', 2817631280, 'temitope.mokikan@gloworld.com', 'PORTAL', 'LENOVO-S5CDFRW', '10.152.89.174', '8180', 'SSR', NULL, 'HTTP', 'NOT_APPLICABLE', '2022-02-17 02:22:14.797', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
