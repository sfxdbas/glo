-- select * from aaaa where not exists (select 1 from pg_largeobject pl where pl.loid = aaaa.loid);
-- select * from agent_fingerprint where not exists (select 1 from pg_largeobject pl where pl.loid = agent_fingerprint.fingerprint_);
-- select * from agent_passport where not exists (select 1 from pg_largeobject pl where pl.loid = agent_passport.passport_data);
-- select * from attachment_ where not exists (select 1 from pg_largeobject pl where pl.loid = attachment_.file_data_);
-- select * from b2b_log where not exists (select 1 from pg_largeobject pl where pl.loid = b2b_log.kit_image);
-- select * from delta_qrt_tbl where not exists (select 1 from pg_largeobject pl where pl.loid = delta_qrt_tbl.loid);
-- select * from delta_qrt_tbl_2 where not exists (select 1 from pg_largeobject pl where pl.loid = delta_qrt_tbl_2.lomowner);
-- select * from delta_qrt_tbl_2 where not exists (select 1 from pg_largeobject pl where pl.loid = delta_qrt_tbl_2.oid);
-- select * from device_tracking_request where not exists (select 1 from pg_largeobject pl where pl.loid = device_tracking_request.kit_image);
-- select * from glo_nin where not exists (select 1 from pg_largeobject pl where pl.loid = glo_nin.passport_data);
-- select * from glo_nin2 where not exists (select 1 from pg_largeobject pl where pl.loid = glo_nin2.passport_data);
-- select * from issue_log_attachment where not exists (select 1 from pg_largeobject pl where pl.loid = issue_log_attachment.file_data_);
-- select * from issue_log_attachment_ret where not exists (select 1 from pg_largeobject pl where pl.loid = issue_log_attachment_ret.file_data_);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.left_index);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.left_little);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.left_middle);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.left_pinky);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.left_ring);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.left_thumb);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.passport);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.right_index);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.right_little);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.right_middle);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.right_pinky);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.right_ring);
select * from legacy_biometrics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_biometrics.right_thumb);
select * from legacy_demographics where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics.passport_photo);
select * from legacy_demographics_2 where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_2.passport_photo);
select * from legacy_demographics_3 where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_3.passport_photo);
select * from legacy_demographics_backup where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_backup.passport_photo);
select * from legacy_demographics_history where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_history.passport_photo);
select * from legacy_demographics_history3 where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_history3.passport_photo);
select * from legacy_demographics_namo where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_namo.passport_photo);
select * from legacy_demographics_old2 where not exists (select 1 from pg_largeobject pl where pl.loid = legacy_demographics_old2.passport_photo);
-- select * from msisdn_complete_bio where not exists (select 1 from pg_largeobject pl where pl.loid = msisdn_complete_bio.passport_photo); -- in progress 178
-- select * from msisdn_incomplete_bio where not exists (select 1 from pg_largeobject pl where pl.loid = msisdn_incomplete_bio.passport_photo); --in progress 177
-- select * from namo_1 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_1.lomowner);
-- select * from namo_1 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_1.oid);
-- select * from namo_1a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_1a.lomowner);
-- select * from namo_1a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_1a.oid);
-- select * from namo_2 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_2.loid);
-- select * from namo_2a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_2a.loid);
-- select * from namo_3 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_3.lomowner);
-- select * from namo_3 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_3.oid);
-- select * from namo_3a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_3a.lomowner);
-- select * from namo_3a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_3a.oid);
-- select * from namo_4a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_4a.loid);
-- select * from namo_4a2 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_4a2.loid);
-- select * from namo_6 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_6.lomowner);
-- select * from namo_6 where not exists (select 1 from pg_largeobject pl where pl.loid = namo_6.oid);
-- select * from namo_6a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_6a.lomowner);
-- select * from namo_6a where not exists (select 1 from pg_largeobject pl where pl.loid = namo_6a.oid);
-- select * from new_new_pglo where not exists (select 1 from pg_largeobject pl where pl.loid = new_new_pglo.loid);
-- select * from new_new_pglo_m where not exists (select 1 from pg_largeobject pl where pl.loid = new_new_pglo_m.lomowner);
-- select * from new_new_pglo_m where not exists (select 1 from pg_largeobject pl where pl.loid = new_new_pglo_m.oid);
-- select * from new_new_sd_pglo where not exists (select 1 from pg_largeobject pl where pl.loid = new_new_sd_pglo.loid);
-- select * from new_new_sd_pglo_m where not exists (select 1 from pg_largeobject pl where pl.loid = new_new_sd_pglo_m.lomowner);
-- select * from new_new_sd_pglo_m where not exists (select 1 from pg_largeobject pl where pl.loid = new_new_sd_pglo_m.oid);
-- select * from nimc_nin_sim_reg_table where not exists (select 1 from pg_largeobject pl where pl.loid = nimc_nin_sim_reg_table.fingerprint);
-- select * from nimc_nin_sim_reg_table where not exists (select 1 from pg_largeobject pl where pl.loid = nimc_nin_sim_reg_table.photo);
-- select * from nimc_nin_sim_reg_table_v2 where not exists (select 1 from pg_largeobject pl where pl.loid = nimc_nin_sim_reg_table_v2.fingerprint);
-- select * from nimc_nin_sim_reg_table_v2 where not exists (select 1 from pg_largeobject pl where pl.loid = nimc_nin_sim_reg_table_v2.photo);
-- select * from nimc_verification_log where not exists (select 1 from pg_largeobject pl where pl.loid = nimc_verification_log.photo); 
-- select * from nimc_verification_log where not exists (select 1 from pg_largeobject pl where pl.loid = nimc_verification_log.signature);
-- select * from nin_data_migrate_02032021_finger_v2 where not exists (select 1 from pg_largeobject pl where pl.loid = nin_data_migrate_02032021_finger_v2.fingerprint);
-- select * from nin_data_migrate_02032021_passport_v2 where not exists (select 1 from pg_largeobject pl where pl.loid = nin_data_migrate_02032021_passport_v2.photo);
-- select * from nindata_migrate_08012021_v2_fingerprint where not exists (select 1 from pg_largeobject pl where pl.loid = nindata_migrate_08012021_v2_fingerprint.wsq_data);
-- select * from nindata_migrate_08012021_v2_fingerprint2 where not exists (select 1 from pg_largeobject pl where pl.loid = nindata_migrate_08012021_v2_fingerprint2.fingerprint);
-- select * from nindata_migrate_08012021_v2_passport where not exists (select 1 from pg_largeobject pl where pl.loid = nindata_migrate_08012021_v2_passport.passport_data);
-- select * from nindata_migrate_08012021_v2_passport2 where not exists (select 1 from pg_largeobject pl where pl.loid = nindata_migrate_08012021_v2_passport2.photo);
-- select * from outlet where not exists (select 1 from pg_largeobject pl where pl.loid = outlet.outlet_picture);
-- select * from passport where not exists (select 1 from pg_largeobject pl where pl.loid = passport.passport_data);       
-- select * from passport_batch_1 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_1.passport_data); 
-- select * from passport_batch_10 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_10.passport_data);  
-- select * from passport_batch_11 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_11.passport_data); 
-- select * from passport_batch_12 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_12.passport_data);  
-- select * from passport_batch_13 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_13.passport_data); 
-- select * from passport_batch_14 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_14.passport_data);
-- select * from passport_batch_15 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_15.passport_data);  
-- select * from passport_batch_16 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_16.passport_data); 
-- select * from passport_batch_17 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_17.passport_data);  
-- select * from passport_batch_18 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_18.passport_data); 
-- select * from passport_batch_19 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_19.passport_data); 
-- select * from passport_batch_2 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_2.passport_data);   
-- select * from passport_batch_20 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_20.passport_data); 
-- select * from passport_batch_3 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_3.passport_data); 
-- select * from passport_batch_4 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_4.passport_data); 
-- select * from passport_batch_5 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_5.passport_data); 
-- select * from passport_batch_6 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_6.passport_data); 
-- select * from passport_batch_7 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_7.passport_data); 
-- select * from passport_batch_8 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_8.passport_data); 
-- select * from passport_batch_9 where not exists (select 1 from pg_largeobject pl where pl.loid = passport_batch_9.passport_data);
-- select * from passport_sim_swap where not exists (select 1 from pg_largeobject pl where pl.loid = passport_sim_swap.passport_data);
-- select * from passport_sim_swap_log where not exists (select 1 from pg_largeobject pl where pl.loid = passport_sim_swap_log.passport_data);
-- select * from pg_largeobject11 where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject11.loid);
-- select * from pg_largeobject_11_a where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_11_a.loid);
-- select * from pg_largeobject_2 where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_2.lomowner);
-- select * from pg_largeobject_2 where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_2.oid);
-- select * from pg_largeobject_2b where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_2b.loid);
-- select * from pg_largeobject_3 where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_3.lomowner);
-- select * from pg_largeobject_3 where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_3.oid);
-- select * from pg_largeobject_c where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_c.loid);
-- select * from pg_largeobject_metadata_111 where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_metadata_111.loid);
-- select * from pg_largeobject_metadata_11_b where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_metadata_11_b.loid);
-- select * from pg_largeobject_metadata_11b where not exists (select 1 from pg_largeobject pl where pl.loid = pg_largeobject_metadata_11b.loid);
-- select * from pl_metadata_27032021 where not exists (select 1 from pg_largeobject pl where pl.loid = pl_metadata_27032021.lomowner);
-- select * from pl_metadata_27032021 where not exists (select 1 from pg_largeobject pl where pl.loid = pl_metadata_27032021.oid);
-- select * from qr_pg_lo where not exists (select 1 from pg_largeobject pl where pl.loid = qr_pg_lo.loid);
-- select * from qr_pg_lo_m where not exists (select 1 from pg_largeobject pl where pl.loid = qr_pg_lo_m.lomowner);
-- select * from qr_pg_lo_m where not exists (select 1 from pg_largeobject pl where pl.loid = qr_pg_lo_m.oid);
-- select * from qr_sd_pg_lo where not exists (select 1 from pg_largeobject pl where pl.loid = qr_sd_pg_lo.loid);
-- select * from qr_sd_pg_lo_m where not exists (select 1 from pg_largeobject pl where pl.loid = qr_sd_pg_lo_m.lomowner);
-- select * from qr_sd_pg_lo_m where not exists (select 1 from pg_largeobject pl where pl.loid = qr_sd_pg_lo_m.oid);
-- select * from qr_wi_pg_lo where not exists (select 1 from pg_largeobject pl where pl.loid = qr_wi_pg_lo.loid);
-- select * from qr_wi_pg_lo_m where not exists (select 1 from pg_largeobject pl where pl.loid = qr_wi_pg_lo_m.lomowner);
-- select * from qr_wi_pg_lo_m where not exists (select 1 from pg_largeobject pl where pl.loid = qr_wi_pg_lo_m.oid);
-- select * from quarantined_registration where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_registration.passport_data); 
-- select * from quarantined_registration2 where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_registration2.passport_data);
-- select * from quarantined_registration3 where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_registration3.passport_data);
-- select * from quarantined_registration_bkup where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_registration_bkup.passport_data);
-- select * from quarantined_registration_migrated where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_registration_migrated.passport_data);
-- select * from quarantined_special_data where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_special_data.biometric_data);
-- select * from quarantined_wsq_image where not exists (select 1 from pg_largeobject pl where pl.loid = quarantined_wsq_image.wsq_data);
-- select * from r3_passport where not exists (select 1 from pg_largeobject pl where pl.loid = r3_passport.passport_data);
-- select * from r3_special_data where not exists (select 1 from pg_largeobject pl where pl.loid = r3_special_data.biometric_data);
-- select * from r3_wsq_image where not exists (select 1 from pg_largeobject pl where pl.loid = r3_wsq_image.wsq_data);
-- select * from registration_signature where not exists (select 1 from pg_largeobject pl where pl.loid = registration_signature.wsq_data);
-- select * from registration_v_log where not exists (select 1 from pg_largeobject pl where pl.loid = registration_v_log.passport_data); 
-- select * from signature where not exists (select 1 from pg_largeobject pl where pl.loid = signature.signature_data);
-- select * from sim_swap_log where not exists (select 1 from pg_largeobject pl where pl.loid = sim_swap_log.subscriber_passport);
-- select * from sim_swap_validation_failure_log where not exists (select 1 from pg_largeobject pl where pl.loid = sim_swap_validation_failure_log.subscriber_passport);
-- select * from sim_swap_validation_log where not exists (select 1 from pg_largeobject pl where pl.loid = sim_swap_validation_log.subscriber_passport);
-- select * from special_data where not exists (select 1 from pg_largeobject pl where pl.loid = special_data.biometric_data); -->                         
-- select * from special_data_alt where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_alt.biometric_data);            
-- select * from special_data_batch_1 where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_batch_1.biometric_data);           
-- select * from special_data_batch_2 where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_batch_2.biometric_data);                         
-- select * from special_data_batch_3 where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_batch_3.biometric_data);                       
-- select * from special_data_batch_4 where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_batch_4.biometric_data); 
-- select * from special_data_batch_5 where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_batch_5.biometric_data);                        
-- select * from special_data_batch_6 where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_batch_6.biometric_data);               
-- select * from special_data_simswap where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_simswap.biometric_data);                        
-- select * from special_data_simswap_log where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_simswap_log.biometric_data);                
-- select * from special_data_v_log where not exists (select 1 from pg_largeobject pl where pl.loid = special_data_v_log.biometric_data);                            
-- select * from subscriber_detail where not exists (select 1 from pg_largeobject pl where pl.loid = subscriber_detail.passport_image);                              
-- select * from t_pg_m2 where not exists (select 1 from pg_largeobject pl where pl.loid = t_pg_m2.lomowner);                                                        
-- select * from t_pg_m2 where not exists (select 1 from pg_largeobject pl where pl.loid = t_pg_m2.oid);                                                             
-- select * from t_pg_m3 where not exists (select 1 from pg_largeobject pl where pl.loid = t_pg_m3.lomowner);                                                        
-- select * from t_pg_m3 where not exists (select 1 from pg_largeobject pl where pl.loid = t_pg_m3.oid);                                                             
-- select * from t_pg_m4 where not exists (select 1 from pg_largeobject pl where pl.loid = t_pg_m4.loid);                                                            
-- select * from t_pg_m5 where not exists (select 1 from pg_largeobject pl where pl.loid = t_pg_m5.loid);                                                            
-- select * from temp_missing_passport where not exists (select 1 from pg_largeobject pl where pl.loid = temp_missing_passport.passport_data);                       
-- select * from temp_missing_special_data where not exists (select 1 from pg_largeobject pl where pl.loid = temp_missing_special_data.biometric_data);              
-- select * from temp_quarantined_registration where not exists (select 1 from pg_largeobject pl where pl.loid = temp_quarantined_registration.passport_data);       
-- select * from temp_quarantined_special_data where not exists (select 1 from pg_largeobject pl where pl.loid = temp_quarantined_special_data.biometric_data);      
-- select * from temp_quarantined_wsq_image where not exists (select 1 from pg_largeobject pl where pl.loid = temp_quarantined_wsq_image.wsq_data);                  
-- select * from temp_registration_v_log where not exists (select 1 from pg_largeobject pl where pl.loid = temp_registration_v_log.passport_data);                   
-- select * from temp_registration_v_log_12072020 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_registration_v_log_12072020.passport_data); 
-- select * from temp_special_data_v_log where not exists (select 1 from pg_largeobject pl where pl.loid = temp_special_data_v_log.biometric_data);                  
-- select * from temp_special_data_v_log_12072020 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_special_data_v_log_12072020.biometric_data);
-- select * from temp_users_2 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_2.passport_data);                                         
-- select * from temp_users_2a where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_2a.wsq_data);                                            
-- select * from temp_users_2a2 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_2a2.wsq_data);                                          
-- select * from temp_users_3 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_3.passport_data);                                         
-- select * from temp_users_4 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_4.passport_data);                                         
-- select * from temp_users_5a where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_5a.biometric_data);                                      
-- select * from temp_users_5a_2 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_users_5a_2.biometric_data);                                  
-- select * from temp_wsq_image_v_log where not exists (select 1 from pg_largeobject pl where pl.loid = temp_wsq_image_v_log.wsq_data);                              
-- select * from temp_wsq_image_v_log_12072020 where not exists (select 1 from pg_largeobject pl where pl.loid = temp_wsq_image_v_log_12072020.wsq_data);            
-- select * from urgent_passport where not exists (select 1 from pg_largeobject pl where pl.loid = urgent_passport.passport_data);                                   
-- select * from wsq_image where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image.wsq_data); 
-- select * from wsq_image_2b_ where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_2b_.wsq_data);
-- select * from wsq_image_2b_2 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_2b_2.wsq_data);
-- select * from wsq_image_batch_1 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_1.wsq_data);
-- select * from wsq_image_batch_10 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_10.wsq_data); 
-- select * from wsq_image_batch_11 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_11.wsq_data);
-- select * from wsq_image_batch_12 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_12.wsq_data); 
-- select * from wsq_image_batch_13 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_13.wsq_data); 
-- select * from wsq_image_batch_14 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_14.wsq_data); 
-- select * from  wsq_image_batch_15 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_15.wsq_data); 
-- select * from wsq_image_batch_2 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_2.wsq_data); 
-- select * from wsq_image_batch_3 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_3.wsq_data); 
-- select * from wsq_image_batch_4 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_4.wsq_data); 
-- select * from wsq_image_batch_5 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_5.wsq_data); 
-- select * from wsq_image_batch_6 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_6.wsq_data);
-- select * from wsq_image_batch_7 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_7.wsq_data); 
-- select * from wsq_image_batch_8 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_8.wsq_data); 
-- select * from wsq_image_batch_9 where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_batch_9.wsq_data); 
-- select * from wsq_image_v_log where not exists (select 1 from pg_largeobject pl where pl.loid = wsq_image_v_log.wsq_data); 
-- select * from zz_attachment_ where not exists (select 1 from pg_largeobject pl where pl.loid = zz_attachment_.file_data_);
-- select * from zz_b2b_log where not exists (select 1 from pg_largeobject pl where pl.loid = zz_b2b_log.kit_image);
-- select * from zz_issue_log_attachment where not exists (select 1 from pg_largeobject pl where pl.loid = zz_issue_log_attachment.file_data_);
-- select * from zz_outlet where not exists (select 1 from pg_largeobject pl where pl.loid = zz_outlet.outlet_picture);




select * from batch from RE 
select wsq_data from temp_schema.wsq_image_batch_ wib where not exists (select 1 from pg_catalog.pg_largeobject pl where pl.loid = wib.wsq_data ); from Z 
select * from pg_catalog.pg_largeobject where loid in (select wsq_data from temp_schema.wsq_check_new_ wcn  ); from RE 

