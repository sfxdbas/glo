INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
VALUES(473671089, 15956632, 'MODE_OF_IDENTIFICATION', NULL, 473671081, NULL, 'FJFEKF', NULL);
INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
VALUES(635456403, 348837535, 'SECONDARY_PORTRAIT', 'BACKEND_CLIPPED', 473671081, NULL, NULL, NULL);
INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
VALUES(473671058, 15729454, 'MODE_OF_IDENTIFICATION', NULL, 473671050, NULL, 'NM VKHCJGJ', NULL);
INSERT INTO public.special_data
(id, biometric_data, biometricdatatype, reason, basic_data_fk, document_expiration_date, document_number, file_format)
VALUES(635456404, 348837565, 'SECONDARY_PORTRAIT', 'BACKEND_CLIPPED', 473671050, NULL, NULL, NULL);


INSERT INTO public.passport
(id, face_count, passport_data, basic_data_fk)
VALUES(473671053, NULL, 348837578, 473671050);
INSERT INTO public.passport
(id, face_count, passport_data, basic_data_fk)
VALUES(473671084, NULL, 348837561, 473671081);


INSERT INTO public.phone_number_status
(id, churn_timestamp, final_timestamp, init_timestamp, remarks, status, tabsfilenumber)
VALUES(473671087, NULL, NULL, '2020-06-21 04:14:10.309', '', 'ACTIVATED', NULL);
INSERT INTO public.phone_number_status
(id, churn_timestamp, final_timestamp, init_timestamp, remarks, status, tabsfilenumber)
VALUES(473671056, NULL, NULL, '2020-06-21 04:02:29.547', '', 'ACTIVATED', NULL);


INSERT INTO public.sms_activation_request
(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status, sar_part_key, crm_update_time, customer_name, enrollment_ref, is_initiator, msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number, state_id, status, unique_id, phone_number_status_fk, msisdn_compliance_status)
VALUES(473671057, '2020-06-21 04:02:29.547', '2020-06-21 09:52:36.613', NULL, 1, '2020-06-21 04:02:29.547', NULL, 'Nnanna Dsanity', 'GLO-DH-557W', true, NULL, NULL, '08055533333', NULL, '2020-06-21 04:02:29.547', '2020-06-20 20:39:21.883', 'NMSI', 'BIOMETRICS', '8234533333333333333F', 25, 'UNACTIVATED', 'GLO-DH-557W-1592681841142', 473671056, NULL);
INSERT INTO public.sms_activation_request
(id, activation_timestamp, agility_push_timestamp, crm_bio_update_time, confirmation_status, sar_part_key, crm_update_time, customer_name, enrollment_ref, is_initiator, msisdn_update_status, msisdn_update_timestamp, phone_number, previous_unique_id, receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number, state_id, status, unique_id, phone_number_status_fk, msisdn_compliance_status)
VALUES(473671088, '2020-06-21 04:14:10.309', '2020-06-21 09:52:36.832', NULL, 1, '2020-06-21 04:14:10.309', NULL, 'Nnamdi Victor', 'GLO-DH-557W', true, NULL, NULL, '08055533333', NULL, '2020-06-21 04:14:10.309', '2020-06-21 04:16:12.361', 'NMSI', 'BIOMETRICS', '8234567877677577777F', 25, 'UNACTIVATED', 'GLO-DH-557W-1592709266737', 473671087, NULL);


INSERT INTO public.meta_data
(id, agent_mobile, app_version, capture_machine_id, confirmation_timestamp, latitude, location_accuracy, longitude, mocked_coordinate, realtime_device_id, registration_network_status, state_of_registration, sync_timestamp, within_geofence, basic_data_fk, enrollment_ref_fk, device_type, user_id)
VALUES(473671054, '07038851805', '1.2', '28-92-4A-45-DE-E9', NULL, NULL, NULL, NULL, NULL, 'HEWLETT-PACKARD-5CD2353LXJ', NULL, 'LAGOS', '2020-06-21 04:04:17.171', NULL, 473671050, 37824090, NULL, NULL);
INSERT INTO public.meta_data
(id, agent_mobile, app_version, capture_machine_id, confirmation_timestamp, latitude, location_accuracy, longitude, mocked_coordinate, realtime_device_id, registration_network_status, state_of_registration, sync_timestamp, within_geofence, basic_data_fk, enrollment_ref_fk, device_type, user_id)
VALUES(473671085, '07038851805', '1.2', '28-92-4A-45-DE-E9', NULL, NULL, NULL, NULL, NULL, 'HEWLETT-PACKARD-5CD2353LXJ', NULL, 'LAGOS', '2020-06-21 04:16:14.755', NULL, 473671081, 37824090, NULL, NULL);


INSERT INTO public.msisdn_detail
(id, activation_status, activation_timestamp, msisdn, msdidn_part_key, new_subscriber, serial, subscriber_type, yellow_account_enabled, yellow_account_types, zap, basic_data_fk, msisdn_category, platform, imsi, visitor, alternate_number, first_name, last_name, nin, nin_status, transaction_id, user_category, corporate_category)
VALUES(473671055, NULL, NULL, '08055533333', NULL, true, '8234533333333333333F', 'PREPAID', NULL, NULL, false, 473671050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.msisdn_detail
(id, activation_status, activation_timestamp, msisdn, msdidn_part_key, new_subscriber, serial, subscriber_type, yellow_account_enabled, yellow_account_types, zap, basic_data_fk, msisdn_category, platform, imsi, visitor, alternate_number, first_name, last_name, nin, nin_status, transaction_id, user_category, corporate_category)
VALUES(473671086, NULL, NULL, '08055533333', NULL, true, '8234567877677577777F', 'PREPAID', NULL, NULL, false, 473671081, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO public.enrollment_log
(id, enrollment_date, enrollment_time, basic_data_fk, enrollment_ref_fk)
VALUES(473671052, '2020-06-20 00:00:00.000', '1970-01-01 20:39:21.883', 473671050, 37824090);
INSERT INTO public.enrollment_log
(id, enrollment_date, enrollment_time, basic_data_fk, enrollment_ref_fk)
VALUES(473671083, '2020-06-21 00:00:00.000', '1970-01-01 04:16:12.361', 473671081, 37824090);


INSERT INTO public.dynamic_data
(id, da1, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da2, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da3, da30, da31, da32, da33, da34, da35, da36, da37, da38, da39, da4, da40, da5, da6, da7, da8, da9, dda1, dda10, dda11, dda12, dda13, dda14, dda15, dda16, dda17, dda18, dda19, dda2, dda20, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30, dda31, dda32, dda33, dda34, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda5, dda6, dda7, dda8, dda9, basic_data_fk, dda41, dda42, dda43, dda44, dda45, dda46, dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, dda70, dda71, dda72, dda73, dda74, dda75, dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95, dda96, dda97, dda98, dda99)
VALUES(473671051, '1998-06-18', '', '5', 'IKATE', 'LEKKI', 'UNVERIFIED', '', '', '', '0', '0', '', '0', '21', NULL, NULL, NULL, NULL, 'CLIPPED', '', '', '', '5 IKATE LEKKI', NULL, 'NOT_APPLICABLE', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '', 'National ID card', '', '21 - 30', 'ADAMAWA', 'GAYUK', NULL, NULL, 'NMSI', 'ADA', NULL, '', '', '', '', '', 'NIGERIA', 'GURIN', 'BOTH EYES BLIND', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15', NULL, 'ADAMAWA', 'FUFURE', '', '', 'ALIMOSHO', 473671050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.dynamic_data
(id, da1, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da2, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da3, da30, da31, da32, da33, da34, da35, da36, da37, da38, da39, da4, da40, da5, da6, da7, da8, da9, dda1, dda10, dda11, dda12, dda13, dda14, dda15, dda16, dda17, dda18, dda19, dda2, dda20, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30, dda31, dda32, dda33, dda34, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda5, dda6, dda7, dda8, dda9, basic_data_fk, dda41, dda42, dda43, dda44, dda45, dda46, dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60, dda100, dda61, dda62, dda63, dda64, dda65, dda66, dda67, dda68, dda69, dda70, dda71, dda72, dda73, dda74, dda75, dda76, dda77, dda78, dda79, dda80, dda81, dda82, dda83, dda84, dda85, dda86, dda87, dda88, dda89, dda90, dda91, dda92, dda93, dda94, dda95, dda96, dda97, dda98, dda99)
VALUES(473671082, '1996-06-13', '', '4', 'IKOTA', 'LEKKI', 'UNVERIFIED', '', '', '', '0', '0', '', '0', '21', NULL, NULL, NULL, NULL, 'CLIPPED', '', '', '', '4 IKOTA LEKKI', NULL, 'NOT_APPLICABLE', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '', 'Driver''s License', '', '21 - 30', 'BAUCHI', 'BAUCHI', NULL, NULL, 'NMSI', 'ADA', NULL, '', '', '', '', '', 'NIGERIA', 'FUFORE', 'BOTH EYES BLIND', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15', NULL, 'ADAMAWA', 'FUFURE', '', '', 'ALIMOSHO', 473671081, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'UNCHECKED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO public.basic_data
(id, biometric_capture_agent, birthday, bd_part_key, firstname, gender, is_processed, last_basic_data_edit_agent, last_basic_data_edit_login_id, match_found, match_id, othername, sms_status, surname, sv_init_timestamp, sv_push_timestamp, sv_status, sync_status, state_of_registration_fk, user_id_fk, user_category)
VALUES(473671081, 'soli@seamfix.com', '1996-06-13 00:00:00.000', '2020-06-21 04:14:10.294', 'Victor', 'MALE', false, 'Somto Oli', 'Somto Oli', false, NULL, '', 'NOT_SENT', 'Nnamdi', NULL, NULL, NULL, 'NONE', 25, 473671080, NULL);
INSERT INTO public.basic_data
(id, biometric_capture_agent, birthday, bd_part_key, firstname, gender, is_processed, last_basic_data_edit_agent, last_basic_data_edit_login_id, match_found, match_id, othername, sms_status, surname, sv_init_timestamp, sv_push_timestamp, sv_status, sync_status, state_of_registration_fk, user_id_fk, user_category)
VALUES(473671050, 'soli@seamfix.com', '1998-06-18 00:00:00.000', '2020-06-21 04:02:29.532', 'Dsanity', 'MALE', false, 'Somto Oli', 'Somto Oli', false, NULL, '', 'NOT_SENT', 'Nnanna', NULL, NULL, NULL, 'NONE', 25, 473671049, NULL);


INSERT INTO public.user_id
(id, active, blacklisted, "conflict", u_part_key, description, unique_id)
VALUES(473671049, NULL, NULL, false, '2020-06-21 04:02:29.235', NULL, 'GLO-DH-557W-1592681841142');
INSERT INTO public.user_id
(id, active, blacklisted, "conflict", u_part_key, description, unique_id)
VALUES(473671080, NULL, NULL, false, '2020-06-21 04:14:10.011', NULL, 'GLO-DH-557W-1592709266737');


INSERT INTO public.bfp_sync_log
(pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date, msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, glo_status, user_id, rgs_attempt_count, rgs_due_timestamp, rgs_timestamp, deactivation_date)
VALUES(472474302, true, '2020-06-20 23:14:27.858', false, '2020-06-21 04:02:29.641', '2020-06-20 23:14:27.858', NULL, 'SUCCESS', 'BIO-27CNcE1HTK8gTVrKuiRs6A==.sv2.sync', '2020-06-21 04:02:29.204', '08055533333', '8234533333333333333F', NULL, '\\127.0.0.1\fix\_bio\receivedfiles\processed_syncs\2020-06-21', 'GLO-DH-557W-1592681841142', 37824090, 'soli@seamfix.com', 'CLIENT', 'HEWLETT-PACKARD-5CD2353LXJ', '10.152.89.238', '8190', 'NMSI', NULL, 'HTTP', 'OLD_COMPLIANT', '2021-08-08 03:05:39.364', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.bfp_sync_log
(pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date, msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, glo_status, user_id, rgs_attempt_count, rgs_due_timestamp, rgs_timestamp, deactivation_date)
VALUES(473671093, true, '2020-06-21 04:14:10.387', false, '2020-06-21 04:14:10.387', '2020-06-21 04:14:10.387', 'ACTIVATED', 'SUCCESS', 'BIO-z46QV7BaW7fT1LBQ-7zjew==.sv2.sync', '2020-06-21 04:14:09.979', '08055533333', '8234567877677577777F', NULL, '\\127.0.0.1\fix\_bio\receivedfiles\processed_syncs\2020-06-21', 'GLO-DH-557W-1592709266737', 37824090, 'soli@seamfix.com', 'CLIENT', 'HEWLETT-PACKARD-5CD2353LXJ', '10.152.89.238', '8190', 'NMSI', NULL, 'HTTP', 'OLD_COMPLIANT', '2021-08-08 03:05:39.364', NULL, NULL, NULL, NULL, NULL, NULL);
