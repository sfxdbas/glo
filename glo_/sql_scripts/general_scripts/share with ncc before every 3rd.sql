select sar.phone_number as msisdn, dda34 as nin, receipt_timestamp as date, DDA9  as Place_of_registration
from 
 basic_data bd
 join user_id ui on ui.id = bd.user_id_fk
 join dynamic_data dd on dd.basic_data_fk = bd.id
 join 
sms_activation_request sar 
on sar.unique_id = ui.unique_id
where extract(year from receipt_timestamp) = extract(year from now())
and extract(month from receipt_timestamp) = extract(month from now()-15)
order by receipt_timestamp
;