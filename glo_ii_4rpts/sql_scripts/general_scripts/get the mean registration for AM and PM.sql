
with t1 as (
select date(receipt_timestamp),
	sum(case when extract(hour from receipt_timestamp) in (0,1,2,3,4,5,6,7,8,9,10,11) then true else false end) as am12_1159,
	sum(case when extract(hour from receipt_timestamp) in (12,13,14,15,16,17,18,19,20,21,22,23) then true else false end) as pm12_1159
	,count(1) total
from sms_activation_request
group by 1                             
order by 1)
select round(avg(am12_1159),2) am12_1159, round(avg(pm12_1159),2) pm12_1159
from t1;