--> make modification to the eyablling report

select
	/*+ parallel */
	SMS_ACTIVATION_REQUEST.RECEIPT_TIMESTAMP as RECEIPT_TIMESTAMP,
	sms_activation_request.registration_timestamp,
	SMS_ACTIVATION_REQUEST.PHONE_NUMBER,
	SMS_ACTIVATION_REQUEST.CUSTOMER_NAME,
	basic_data.gender,
	da3 address,
	SMS_ACTIVATION_REQUEST.SERIAL_NUMBER,
	SMS_ACTIVATION_REQUEST.UNIQUE_ID,
	SMS_ACTIVATION_REQUEST.ENROLLMENT_REF,
	SMS_ACTIVATION_REQUEST.REGISTRATION_TYPE,
	basic_data.biometric_capture_agent,
	meta_data.app_version,
	--passport.passport_data,
 	loread( lo_open( passport.passport_data,	262144 ),	1000000 ) as passport_data,
	(	select		loread( lo_open( sd.biometric_DATA,		262144 ),		1000000 ) as biometric_DATA		--biometric_DATA
	from		special_data sd
	where		sd.basic_data_fk = basic_data.id
	and sd.biometricdatatype = 'SECONDARY_PORTRAIT' ) SECONDARY_PORTRAIT,
	(	select		loread( lo_open( sd.biometric_DATA,		262144 ),		1000000 )
	from		special_data sd
	where		sd.basic_data_fk = basic_data.id
	and sd.biometricdatatype = 'MODE_OF_IDENTIFICATION' ) MODE_OF_IDENTIFICATION,
	coalesce((	select	case	when basic_data_fk = basic_data_fk then 'CAPTURED'	end
	from		wsq_image w
	where		w.basic_data_fk = basic_data.id
	group by		basic_data_fk ),	'NOT CAPTURED' ) finger_print,
	DDA20 OverrideReason
from
	SMS_ACTIVATION_REQUEST,
	basic_data,
	user_id,
	passport,
	meta_data ,
	dynamic_data
where
	sms_activation_request.unique_id = user_id.unique_id
	and basic_data.user_id_fk = user_id.id
	and basic_data.id = passport.basic_data_fk
	and basic_data.id = meta_data.basic_data_fk
	and dynamic_data.basic_data_fk = basic_data.id
	--and special_data.basic_data_fk=basic_data.id
	--and DATE(RECEIPT_TIMESTAMP) = ?
	--and extract(hour from receipt_timestamp) = ?
order by
	SMS_ACTIVATION_REQUEST.RECEIPT_TIMESTAMP ;