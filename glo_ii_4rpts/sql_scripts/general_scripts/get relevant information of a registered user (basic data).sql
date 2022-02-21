Select
234||trim(leading 0 from trim(sms.phone_number)) MSISDN ,
b.surname LAST_NAME,
b.firstname FIRST_NAME,
b.othername OTHER_NAME,
d.dda12 AS MOTHER_MAIDEN_NAME,
b.gender,
to_char(b.birthday, 'dd-mm-yyyy')  DATE_OF_BIRTH,
b.biometric_capture_agent agent_login,
km_user.first_name ||' '|| km_user.surname as agent_name,
km_user.mobile as agent_mobile,
sms.enrollment_ref AGENT_DEVICE,
u.unique_id PIN_REF,
to_char(sms.receipt_timestamp, 'dd-mm-yyyy hh24:mi:ss') REGISTRATION_DATE,
d.da3 AS RESIDENTIAL_ADDRESS,
d.dda5 AS RESIDENTIAL_STATE,
d.dda6 AS RESIDENTIAL_LGA,
d.da8 AS STATE_OF_ORIGIN,
d.da9 AS LGA_OF_ORIGIN,
m.state_of_registration AS REGISTRATION_STATE,
d.dda9 AS REGISTRATION_LGA,
d.da2 AS occupation,
d.dda19 AS nationality,
DDA11 "Registration Type",
DA10 "Alternate Phone Numbers"
FROM basic_data b JOIN dynamic_data d ON d.basic_data_fk = b.ID
     JOIN   meta_data m ON m.basic_data_fk = b.ID
     JOIN   user_id u ON  b.user_id_fk = u.ID
     JOIN   sms_activation_request sms ON  u.UNIQUE_ID = sms.UNIQUE_ID
     left join km_user on lower(b.biometric_capture_agent) = lower(km_user.email_address)
   WHERE sms.phone_number in
()    ORDER BY sms.phone_number,sms.receipt_timestamp ;
