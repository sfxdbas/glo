
SELECT distinct(phone_number), receipt_timestamp time_entered_into_db, agility_push_timestamp time_pushed_to_mCentric
FROM public.sms_activation_request
where date(s.receipt_timestamp) >= '2020-03-26'
and date(s.receipt_timestamp) <= '2020-03-30'
;