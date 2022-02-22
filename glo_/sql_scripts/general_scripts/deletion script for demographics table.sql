--v2
--WSQ_IMAGE
-->
SELECT *  
from wsq_image wi 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = wi.basic_data_fk 
)
;


--SPECIAL_DATA
--> 
SELECT *  
from special_data sd  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = sd.basic_data_fk 
)
;


--PASSPORT
-->
SELECT *  
from passport p  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = p.basic_data_fk 
)
;


--PHONE_NUMBER_STATUS
-->
SELECT *  
from phone_number_status pns  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
join sms_activation_request sar on sar.unique_id = bsl.unique_id 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and sar.phone_number = bsl.msisdn 
and SAR.unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and pns.id = sar.phone_number_status_fk 
)
;



--SMS_ACTIVATION_REQUEST
-->
SELECT *  
from sms_activation_request sar  
where unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and phone_number = '08053000057'
and registration_type ='SSR'
;


--META_DATA
-->
SELECT *  
from meta_data md 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = md.basic_data_fk 
)
;


--CRM_PUSH_STATUS
-->
select * from crm_push_status cps 
where CPS.msisdn_detail_fk in (
select ID   
from msisdn_detail md 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = md.basic_data_fk 
))
;


--MSISDN_DETAIL
-->
SELECT *  
from msisdn_detail md 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = md.basic_data_fk 
)
;


--ENROLLMENT_LOG
-->
SELECT *  
from enrollment_log el 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = el.basic_data_fk 
)
;



--DYNAMIC_DATA
-->
SELECT *  
from dynamic_data dd  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.id = dd.basic_data_fk 
)
;


-- BASIC_DATA
-->
SELECT *  
from basic_data bd  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and bd.user_id_fk = ui.id 
)
;


-- USER_ID
-->
SELECT *  
from user_id ui  
where exists 
(select 1 
from bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR'
and ui.unique_id = bsl.unique_id 
)
;


--BFP_SYNC_LOG
-->
SELECT *  
from  bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and unique_id = 'GLO-HH-LAG-ETI-IS-GLOWORLD-297T-1631879266495'
and MSISDN = '08053000057'
and reg_type ='SSR' 
;



