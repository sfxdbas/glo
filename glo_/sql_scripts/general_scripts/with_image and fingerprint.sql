--create table temp_msisdn_with_image as 
select sar.phone_number as msisdn, sar.receipt_timestamp as reg_time, 
case when p.basic_data_fk = p.basic_data_fk then 'image' else p.basic_data_fk::text end as passport 
from basic_data bd 
join user_id ui on ui.id = bd.user_id_fk 
join sms_activation_request sar on sar.unique_id = ui.unique_id 
join passport p on p.basic_data_fk = bd.id 
;

--create table temp_msisdn_with_fp as
select sar.phone_number as msisdn, sar.receipt_timestamp as reg_time, wi.basic_data_fk, rank() over (partition by basic_data_fk order by finger) 
from basic_data bd 
join user_id ui on ui.id = bd.user_id_fk 
join sms_activation_request sar on sar.unique_id = ui.unique_id 
join wsq_image wi  on wi.basic_data_fk = bd.id 
;