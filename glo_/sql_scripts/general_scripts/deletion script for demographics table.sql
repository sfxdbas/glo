--WSQ_IMAGE
-->
select wi.*
from wsq_image wi 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = wi.basic_data_fk 
)
;


--SPECIAL_DATA
--> 
select *
from special_data sd  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = sd.basic_data_fk 
)
;


--PASSPORT
-->
select *
from passport p  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = p.basic_data_fk 
)
;


--PHONE_NUMBER_STATUS
-->
select *
from phone_number_status pns  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
join sms_activation_request sar on sar.unique_id = bsl.unique_id 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and sar.phone_number = bsl.msisdn 
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and pns.id = sar.phone_number_status_fk 
)
;



--SMS_ACTIVATION_REQUEST
-->
select *
from sms_activation_request sar  
where phone_number = 'insert_here'
and date(sar.receipt_timestamp)>'2015-08-04'
;


--META_DATA
-->
select *
from meta_data md 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = md.basic_data_fk 
)
;


--MSISDN_DETAIL
-->
select *
from msisdn_detail md 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = md.basic_data_fk 
)
;


--ENROLLMENT_LOG
-->
select *
from enrollment_log el 
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = el.basic_data_fk 
)
;



--DYNAMIC_DATA
-->
select *
from dynamic_data dd  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.id = dd.basic_data_fk 
)
;


-- BASIC_DATA
-->
select *
from basic_data bd  
where exists 
(select bd.id 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and bd.user_id_fk = ui.id 
)
;


-- USER_ID
-->
select *
from user_id ui  
where exists 
(select 1 
from bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04'
and ui.unique_id = bsl.unique_id 
)
;


--BFP_SYNC_LOG
-->
select *
from  bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn = 'insert_here'
and date(create_date)>'2015-08-04' 
;


