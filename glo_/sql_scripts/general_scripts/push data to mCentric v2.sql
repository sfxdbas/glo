
---> 
 insert into agility_push_status
 (pk, active,create_date, deleted, last_modified, basic_data_fk,msisdn, serial,status, unique_id)
with t1 as (
select
	hibernate_sequence.nextval, true, current_timestamp, false as _, current_timestamp,	b.id, m.msisdn,	m.serial, 'PENDING', u.unique_id ,
	receipt_timestamp, rank() over ( partition by msisdn order by receipt_timestamp desc ),	s.customer_name
from
	basic_data b, user_id u, msisdn_detail m, sms_activation_request s
where
	s.unique_id = u.unique_id
	and m.basic_data_fk = b.id
	and b.user_id_fk = u.id
	and  s.phone_number =  m.msisdn
	and  phone_number in 
(

)
-- and extract(week from receipt_timestamp) = extract(week from now())
-- and confirmation_status = 0
) 
select nextval, bool, current_timestamp, _, current_timestamp, id, msisdn, serial, "?column?", unique_id
from t1
where rank = 1
;


