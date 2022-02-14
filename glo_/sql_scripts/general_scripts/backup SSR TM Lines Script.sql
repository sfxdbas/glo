select * 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
;

-- to go 2
select * from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
);

-- to go 1
select * from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
));

select * from field_edit_reason where basic_data_fk in (
select id  from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));

select * from DYNAMIC_DATA where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));

select * from enrollment_log el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));

select * from MSISDN_DETAIL el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));


select * from crm_push_status cps 
where   cps.msisdn_detail_fk in (
select id from MSISDN_DETAIL el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
))));

select * from META_DATA el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));



select sar.* from sms_activation_request sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))
;


select * from PHONE_NUMBER_STATUS 
where id in 
(select sar.phone_number_status_fk from sms_activation_request sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
);



select sar.* from MSISDN_PROVISION_STATUS sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))
;


select * from msisdn_provision_status_log mpsl where msisdn_provision_status_fk in (
select sar.pk  from MSISDN_PROVISION_STATUS sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )))
;

select sar.* from MSISDN_PROVISION_STATUS_LOG sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))
;

select sar.* from AGILITY_PUSH_STATUS sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))
;


select * from PASSPORT el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));


select * from WSQ_IMAGE el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));


select * from SPECIAL_DATA el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));



select * from EYEBALLING el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)));


select * from EYEBALLING_LOG where eyeballing_fk = any (
select pk from EYEBALLING el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
)))
);


select * from KYC_AGILITY_MAPPER el where basic_data_fk = any (
select id from basic_data where user_id_fk = any (
select id from user_id where unique_id = any (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )
))--)
);


select sar.* from ACTIVATION_SYNC_LOG sar
where record_id in (
select pk 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))
;


select sar.* from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))
;


select * from wsq_image_sim_swap where simwap_demographic_fk = any (
select sar.pk from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )) 
)
;


select * from simswap_approval where sim_swap_demographics_fk = any (
select sar.pk from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )) 
)
;


select * from sim_swap_validation_log where simwap_demographic_fk = any (
select sar.pk from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )) 
)
;



select * from passport_sim_swap where simwap_demographic_fk = any (
select sar.pk from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )) 
)
;



select * from special_data_simswap where simwap_demographic_fk = any (
select sar.pk from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )) 
)
;



select * from SIM_SWAP_DEMOGRAPHIC_LOG where unique_id in (
select sar.unique_id from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )))
;


select * from passport_sim_swap_log where simwap_demographic_log_fk = any (
select pk from SIM_SWAP_DEMOGRAPHIC_LOG where unique_id in (
select sar.unique_id from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 )))
)
;


select * from sim_swap_validation_failure_log where simwap_demographic_log_fk = any (
select pk  from SIM_SWAP_DEMOGRAPHIC_LOG where unique_id in (
select sar.unique_id from SIM_SWAP_DEMOGRAPHIC  sar
where unique_id in (
select unique_id 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum ='ACTIVATED'
and msisdn in (select msisdn from rmv_entry_11012022 ))))
;
