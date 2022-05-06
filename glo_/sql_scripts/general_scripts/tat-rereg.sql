--RE_REG_TAT =( (SIEBEL RESPONSE TIMESTAMP - REGIGRATION TIMESTAMP) - ( RECEIPT TIMESTAMP - QUARANTINED RELEASE TIMESTAMP ) )
with tab1 as (
select bsl.msisdn, ail.msisdn, bsl.create_date,AIL.response_time, sar.registration_timestamp, sar.receipt_timestamp ,qr.last_modified 
,(ail.response_time-sar.registration_timestamp) , (sar.receipt_timestamp-qr.last_modified)
,(ail.response_time-sar.registration_timestamp) - (sar.receipt_timestamp-qr.last_modified) as RE_REG_TAT
,row_number()over(partition by sar.phone_number order by  sar.receipt_timestamp desc ) as rank_
from bfp_sync_log bsl
left join agility_integration_log_ ail on ail.msisdn = bsl.msisdn 
left join quarantined_registration qr on qr.unique_id = bsl.unique_id 
left join sms_activation_request sar on sar.unique_id = sar.unique_id 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.reg_type like 'RR%'
and sar.phone_number = bsl.msisdn 
--and AIL.msisdn = '08159345444'
and ail.request_type = 'SIM_REGISTER'
and date(bsl.create_date) = date(now()-1)
) 
select * 
from tab1 
where rank_ = 1
;