with t1 as 
(
	select date(receipt_timestamp), count(1)
	from sms_activation_request
	where extract(month from receipt_timestamp) = 3
	group by 1
)
select avg(count) 
from t1
;