select dd.id, sar.phone_number , dd.dda34, dda36, sar.unique_id 
, 'update dynamic_data set dda34 = null '||' where id = '||dd.id||';'
from sms_activation_request sar, basic_data bd, user_id ui ,
dynamic_data dd 
where sar.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and bd.id = dd.basic_data_fk 
and dd.dda34 = '96232337118'
--and sar.phone_number in ()
;

--update dynamic_data set dda34 = null  where id = 2828451555;
--update dynamic_data set dda34 = null  where id = 2828455129;

