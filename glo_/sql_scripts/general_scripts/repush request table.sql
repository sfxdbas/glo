insert into repush_request
select
	hibernate_sequence.nextval pk, current_timestamp date_time_of_repush,	b.id basic_data_fk, m.msisdn,	m.serial, u.unique_id 
from
	basic_data b, user_id u, msisdn_detail m, sms_activation_request s
where
	s.unique_id = u.unique_id
	and m.basic_data_fk = b.id
	and b.user_id_fk = u.id
	and right( s.phone_number, 10 ) = right( m.msisdn, 10 )
	and right( phone_number, 10 ) in 
(

)