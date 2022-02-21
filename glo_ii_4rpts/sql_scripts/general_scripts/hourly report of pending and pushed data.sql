


select 
	date(receipt_timestamp) "day",	round(extract(hour from receipt_timestamp)::numeric,2) "hour", 
	sum(case when s.confirmation_status = 0 then 1 else 0 end) as pending,
	sum(case when s.confirmation_status = 1 then 1 else 0 end) as pushed,
	count(1) total
,abs(round(avg((extract(epoch from to_char(agility_push_timestamp, 'hh:mi:ss')::time)::numeric - extract(epoch from to_char(receipt_timestamp, 'hh:mi:ss')::time)::numeric)/60)::numeric, 2)) backend2mcentric_mins
from sms_activation_request s
where date(receipt_timestamp) = date(now())
group by 1,2--  ,6
ORDER BY 2 ;