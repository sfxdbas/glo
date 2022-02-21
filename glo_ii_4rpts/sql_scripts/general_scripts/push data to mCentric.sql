insert into agility_push_status (pk, active,create_date, deleted, last_modified, basic_data_fk,
msisdn, serial,
status, unique_id)
select hibernate_sequence.nextval,
true, current_timestamp, false, current_timestamp, b.id, m.msisdn, m.serial,
'PENDING', u.unique_id
from basic_data b, user_id u, msisdn_detail m, sms_activation_request s 
where b.user_id_fk = u.id
and m.basic_data_fk = b.id
and right(s.phone_number,10) = right(m.msisdn, 10)
and right(s.phone_number,10) in (


)
--order by msisdn
;