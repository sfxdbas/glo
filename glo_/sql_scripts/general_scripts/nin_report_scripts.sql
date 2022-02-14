with t1 as (
select b.firstname, b.surname, phone_number as msisdn,d.dda34 as nin,
receipt_timestamp as registration_date, 
rank() over(partition by dda34 order by phone_number,receipt_timestamp desc)
from basic_data b 
join user_id u on b.user_id_fk = u.id
join dynamic_data d on	d.basic_data_fk = b.id
join sms_activation_request s on s.unique_id = u.unique_id
where dda34 != '' --in (select nin from nin_dd_enll_5)
	-- limit 20
) 
select  nin, count(1) as no_of_msisdns
from t1 
-- where date(registration_date) between ? and ?
-- and nin like ?
group by 1
having count(1) > 4
order by 2 desc 
;



with t2 as (
with t1 as (
select b.firstname, b.surname, phone_number as msisdn,d.dda34 as nin,
receipt_timestamp as registration_date--, 
-- rank() over(partition by dda34 order by phone_number,receipt_timestamp desc)
from basic_data b 
join user_id u on b.user_id_fk = u.id
join dynamic_data d on	d.basic_data_fk = b.id
join sms_activation_request s on s.unique_id = u.unique_id
where  dda34 != ''--in (select nin from nin_dd_enll_5)
	-- limit 20
) 
select  nin, count(1) as no_of_msisdns
from t1 
-- where date(registration_date) between  '2020-11-24' and '2020-11-30'
-- and nin like '69240597836'
group by 1
having count(1) > 4
order by 2 desc
)
select b.firstname, b.surname, phone_number as msisdn,d.dda34 as nin,
receipt_timestamp as registration_date, 
rank() over(partition by nin order by phone_number,receipt_timestamp desc)
from basic_data b 
join user_id u on b.user_id_fk = u.id
join dynamic_data d on	d.basic_data_fk = b.id
join sms_activation_request s on s.unique_id = u.unique_id
join t2 on t2.nin = d.dda34
;