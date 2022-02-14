-- rereg prepaid
--create table simreg_tat_prepaid_rereg as 
--insert into simreg_tat_prepaid_rereg
with tab1 as (
select
bsl.msisdn, bsl.activation_date, bsl.create_date as registration_timestamp, 
bd.bd_part_key as receipt_timestamp,qr.create_date as quarantinedtimestamp,
qr.last_modified as released_timestamp
,bsl.activation_date - bd.bd_part_key as tat_prepaid
,row_number()over(partition by bsl.msisdn order by qr.last_modified desc ) as rank_
from bfp_sync_log bsl
left join quarantined_registration qr on qr.unique_id = bsl.unique_id 
left join user_id ui on ui.unique_id = bsl.unique_id 
left join basic_data bd on bd.user_id_fk = ui.id 
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.reg_type like 'RR%'
and bsl.sim_serial = mps.sim_serial 
and mps.platform LIKE 'ICC%'
and date(bsl.create_date) = date(now)-1
and date(qr.create_date) = date(now)-1
--and date(sar.receipt_timestamp) = '2021-08-05'
) 
select * 
from tab1 
where rank_ = 1
;

