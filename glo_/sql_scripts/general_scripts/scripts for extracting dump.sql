--create table extract_dump_06072021 as 
with extract_dump as (
select sar.phone_number as msisdn, bd.firstname ||' '||bd.surname as name, bd.birthday as dateofbirth, sar.enrollment_ref as netbookid,
	sar.receipt_timestamp as registrationdate, da3 as address, da8 as state, bd.gender,
	row_number() over(partition by sar.phone_number order by sar.receipt_timestamp desc ) as rank_
from sms_activation_request sar 
join user_id ui on ui.unique_id = sar.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where phone_number = '00079049618'
)
select msisdn, name, dateofbirth,netbookid, registrationdate, address, state, gender 
from extract_dump
where rank_ = 1
;