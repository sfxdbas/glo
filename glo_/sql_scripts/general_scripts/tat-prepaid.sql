--SIMREG_TAT_Prepaid =( (HPROV RESPONSE TIMESTAMP - REGISTRATION TIMESTAMP) -( RECEIPT TIMESTAMP - QUARANTINED RELEASE TIMESTAMP ) )
with tab1 as (
select bsl.msisdn, ail.msisdn,AIL.response_time, bsl.create_date as registration_timestamp, 
sar.receipt_timestamp ,qr.last_modified 
,(ail.response_time-bsl.create_date) as activation_time  , (qr.last_modified - sar.receipt_timestamp) quarantined_time
,(ail.response_time-bsl.create_date) - (qr.last_modified - sar.receipt_timestamp) as SIMREG_TAT_Prepaid
,row_number()over(partition by sar.phone_number order by  sar.receipt_timestamp desc ) as rank_
from bfp_sync_log bsl
left join agility_integration_log_ ail on 0||ail.msisdn = bsl.msisdn 
left join quarantined_registration qr on qr.unique_id = bsl.unique_id 
left join sms_activation_request sar on sar.unique_id = sar.unique_id 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and sar.phone_number = bsl.msisdn 
and bsl.reg_type like 'NM%'
--and AIL.msisdn = '8159345444'
and ail.request_type = 'HPROV_UNBAR'
and date(bsl.create_date) = '2021-08-01'
) 
select * 
from tab1 
where rank_ = 1
;

select * 
from agility_integration_log_ ail 
where msisdn = '08159345444'
order by 3 desc 
;

select * 
from bfp_sync_log bslail 
where msisdn = '08159345444'
order by 3 desc 
;

select * 
from sms_activation_request sarbslail 
where phone_number = '08159345444'
order by receipt_timestamp desc 
;

select * 
from quarantined_registration qr 
where qr.unique_id in 
('GLO-DH-LAG-IKD-GWLAIKD-398W-1627551028522',
'32874340')
