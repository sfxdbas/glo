select bb.msisdn PHONE_NUMBER,
	m.sync_timestamp metadata_synctimestamp, el.enrollment_date, el.enrollment_time
from meta_data m 
join basic_data b on m.basic_data_fk = b.id
join user_id u on b.user_id_fk = u.id
join sms_activation_request s on s.unique_id = u.unique_id
join bfp_sync_log bb on	s.unique_id = bb.unique_id
join enrollment_log el on el.basic_data_fk = b.id
and bb.bfpsyncstatusenum = 'SUCCESS'
and right(bb.msisdn, 10) in (
    7053401832,
    7051423330,
    8055015238,
    8053076563,
    7053401832,
    8052517650,
    8054219480,
    8057368878,
    8057134541,
    8050235437,
    8056151617,
    8051619050
)
;



select 
    bb.msisdn PHONE_NUMBER,	m.sync_timestamp metadata_synctimestamp, el.enrollment_date, el.enrollment_time,ef.code kittag, 
    case 
        when h.app_version = '1.00' then 'DROID' else 'WIN' 
    end device_type
from 
    meta_data m
join basic_data b on
	m.basic_data_fk = b.id
join user_id u on
	b.user_id_fk = u.id
join sms_activation_request s on
	s.unique_id = u.unique_id
join bfp_sync_log bb on
	s.unique_id = bb.unique_id
join enrollment_log el on 
	el.basic_data_fk = b.id
join enrollment_ref ef on
    ef.id = bb.enrollment_ref_fk
join heart_beat_status h on
    h.tag = ef.code
and bb.bfpsyncstatusenum = 'SUCCESS'
and right(bb.msisdn, 10) in (
7053401832,
7051423330,
8055015238,
8053076563,
7053401832,
8052517650,
8054219480,
8057368878,
8057134541,
8050235437,
8056151617,
8051619050
)
;