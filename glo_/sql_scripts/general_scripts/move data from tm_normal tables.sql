--TM_BASIC_DATA
-- TM_DYNAMIC_DATA
--TM_PASSPORT
--TM_PASSPORT_DETAIL
--TM_SIGNATURE
--TM_WSQ_IMAGE
--TM_REGISTRATION_SIGNATURE
--TM_FIELD_EDIT_REASON
--TM_SPECIAL_DATA

select * 
from bfp_sync_log bsl 
where msisdn ='08118906863'
order by 3 desc ;

select * from basic_data bd where id = 2851053438;


insert into basic_data 
select pk id, biometric_capture_agent, birthday,tbd.create_date as bd_part_key, firstname, gender, is_processed, last_basic_data_edit_agent,
last_basic_data_edit_login_id, match_found, match_id, othername, sms_status, surname, sv_init_timestamp,
Sv_push_timestamp, sv_status, sync_status, state_of_registration_fk, user_id_fk, user_category 
from tm_basic_data tbd where user_id_fk in (
select ID  from USER_ID where unique_id ='GLO-DH-LAG-SUR-GWLAMUS-419W-1630078760096'
)
;

insert into dynamic_data 
select hibernate_sequence.nextval id , da1, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da2, da20, da21, da22, da23, da24, da25, da26, da27, da28, da29, da3, da30, da31, da32, da33, da34, da35, da36, da37, da38, da39, da4, da40, da5, da6, da7, da8, da9, dda1, dda10, dda11, dda12, dda13, dda14, dda15, dda16, dda17, dda18, dda19, dda2, dda20, dda21, dda22, dda23, dda24, dda25, dda26, dda27, dda28, dda29, dda3, dda30, dda31, dda32, dda33, dda34, dda35, dda36, dda37, dda38, dda39, dda4, dda40, dda5, dda6, dda7, dda8, dda9, tm_basic_data_fk, dda41, dda42, dda43, dda44, dda45, dda46, dda47, dda48, dda49, dda50, dda51, dda52, dda53, dda54, dda55, dda56, dda57, dda58, dda59, dda60 
from tm_dynamic_data tdd where tm_basic_data_fk in (
select PK  from tm_basic_data tbd where user_id_fk in (
select ID  from USER_ID where unique_id ='GLO-DH-LAG-SUR-GWLAMUS-419W-1630078760096'
)
)
;

insert into passport
select hibernate_sequence.nextval id, face_count, passport_data, tm_basic_data_fk
from tm_passport tptdd where tm_basic_data_fk in (
select PK  from tm_basic_data tbd where user_id_fk in (
select ID  from USER_ID where unique_id ='GLO-DH-LAG-SUR-GWLAMUS-419W-1630078760096'
)
)
;


insert into wsq_image
select hibernate_sequence.nextval id, compression_ratio, finger, nfiq, reason_code, wsq_data, basic_data_fk 
from tm_wsq_image twidd where basic_data_fk in (
select PK  from tm_basic_data tbd where user_id_fk in (
select ID  from USER_ID where unique_id ='GLO-DH-LAG-SUR-GWLAMUS-419W-1630078760096'
)
)
;


insert into special_data 
select  hibernate_sequence.nextval id, biometric_data, biometricdatatype, reason, tm_basic_data_fk, document_expiration_date, document_number 
from tm_special_data tsdtsdd where TM_basic_data_fk in (
select PK  from tm_basic_data tbd where user_id_fk in (
select ID  from USER_ID where unique_id ='GLO-DH-LAG-SUR-GWLAMUS-419W-1630078760096'
)
)
;
