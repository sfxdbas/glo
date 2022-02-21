Select /*+ parallel */SMS_ACTIVATION_REQUEST.PHONE_NUMBER,
loread(lo_open(passport.passport_data, 262144), 1000000) as passport_data,
(select loread(lo_open(sd.biometric_DATA, 262144), 1000000) 
from special_data sd   
where sd.basic_data_fk=basic_data.id 
AND  sd.biometricdatatype='MODE_OF_IDENTIFICATION') MODE_OF_IDENTIFICATION,
left(SMS_ACTIVATION_REQUEST.CUSTOMER_NAME, strpos(customer_name, ' ') -1) first_name,
right(SMS_ACTIVATION_REQUEST.CUSTOMER_NAME, length(customer_name) - strpos(customer_name, ' ') ) surname,
initcap(dda12) as mothers_maiden_name,
gender,
SMS_ACTIVATION_REQUEST.UNIQUE_ID,
meta_data.realtime_device_id,
SMS_ACTIVATION_REQUEST.ENROLLMENT_REF kittag,
sms_activation_request.registration_timestamp date_of_reg
from SMS_ACTIVATION_REQUEST, basic_data, user_id, passport, meta_data ,dynamic_data
where sms_activation_request.unique_id = user_id.unique_id
and basic_data.user_id_fk = user_id.id
and basic_data.id = passport.basic_data_fk
and basic_data.id = meta_data.basic_data_fk
and dynamic_data.basic_data_fk=basic_data.id 
order by 1
;