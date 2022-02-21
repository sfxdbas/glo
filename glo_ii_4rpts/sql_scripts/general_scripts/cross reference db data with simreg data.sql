
 select count(distinct phone_number) 
 from sms_activation_request s
 where not exists 
 (select right(msisdn, 10)
  from table_simreg t
  where right(s.phone_number,10) = right(t.msisdn,10))
  and s.confirmation_status = 0
 and date(s.receipt_timestamp) >= '2020-03-20'
 and date(s.receipt_timestamp) <= '2020-03-25'


 select count(distinct phone_number) 
 from sms_activation_request s
 where exists 
 (select right(phone_number, 10)
  from client_activity_log t
  where right(s.phone_number,10) = right(t.phone_number,10))
 --  and s.confirmation_status = 0
 and date(s.receipt_timestamp) >= '2020-03-20'
 and date(s.receipt_timestamp) <= '2020-03-25'



select count(distinct phone_number) 
from sms_activation_request s
where not  exists 
(select right(phone_number, 10)
 from client_activity_log t
 where right(s.phone_number,10) = right(t.phone_number,10))
--  and s.confirmation_status = 0
and date(s.receipt_timestamp) >= '2020-03-20'
and date(s.receipt_timestamp) <= '2020-03-25' -- 116045



select count(distinct phone_number) 
from sms_activation_request s
where not  exists 
(select right(phone_number, 10)
 from client_activity_log t
 where right(s.phone_number,10) = right(t.phone_number,10)) -- 313113
 
 
 
 select distinct phone_number, receipt_timestamp, agility_push_timestamp
 from sms_activation_request s
 where not exists 
 (select right(msisdn, 10)
  from table_simreg t
  where right(s.phone_number,10) = right(t.msisdn,10))
  and s.confirmation_status = 0
 and date(s.receipt_timestamp) >= '2020-03-20'
 and date(s.receipt_timestamp) <= '2020-03-25'