-- tat postpaid 1 ==> new reg (mttc & mtta)
select date(registration_timestamp), round(avg(mtta2) ,2) as mtta,  round(avg(mttc2) ,2) as mttc
from (
with tab1 as (
select
bsl.msisdn, bsl.activation_date, bsl.create_date as registration_timestamp, 
bd.bd_part_key as receipt_timestamp/* ,qr.create_date as quarantinedtimestamp, */
,bsl.activation_date - bd.bd_part_key as mtta
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mtta2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mtta3
,bsl.activation_date - bsl.create_date as mttc
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mttc2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mttc3
,row_number()over(partition by bsl.msisdn order by bsl.create_date desc ) as rank_
from bfp_sync_log bsl
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and (bsl.reg_type like 'NM%' or bsl.reg_type like 'AR%' or bsl.reg_type in ('MPI','VNI','CN'))
-- and bsl.sim_serial = mps.sim_serial 
and mps.platform LIKE 'CBS%'
and date(bsl.create_date) = '2021-08-30'
-- and date(qr.create_date) = '2021-08-30'
--and date(sar.receipt_timestamp) = '2021-08-05'
) 
select * 
from tab1 
where rank_ = 1
) a
group by  1
;


-- tat prepaid 1 ==> new reg (mttc & mtta)
select date(registration_timestamp), round(avg(mtta2) ,2) as mtta,  round(avg(mttc2) ,2) as mttc
from (
with tab1 as (
select
bsl.msisdn, bsl.activation_date, bsl.create_date as registration_timestamp, 
bd.bd_part_key as receipt_timestamp/* ,qr.create_date as quarantinedtimestamp, */
,bsl.activation_date - bd.bd_part_key as mtta
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mtta2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mtta3
,bsl.activation_date - bsl.create_date as mttc
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mttc2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mttc3
,row_number()over(partition by bsl.msisdn order by bsl.create_date desc ) as rank_
from bfp_sync_log bsl
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and (bsl.reg_type like 'NM%' or bsl.reg_type like 'AR%' or bsl.reg_type in ('MPI','VNI','CN'))
-- and bsl.sim_serial = mps.sim_serial 
and mps.platform LIKE 'ICC%'
and date(bsl.create_date) = '2021-08-30'
-- and date(qr.create_date) = '2021-08-30'
--and date(sar.receipt_timestamp) = '2021-08-05'
) 
select * 
from tab1 
where rank_ = 1
) a
group by  1
;


-- tat postpaid 1 ==> re reg (mttc & mtta)
select date(registration_timestamp), round(avg(mtta2) ,2) as mtta,  round(avg(mttc2) ,2) as mttc
from (
with tab1 as (
select
bsl.msisdn, bsl.activation_date, bsl.create_date as registration_timestamp, 
bd.bd_part_key as receipt_timestamp/* ,qr.create_date as quarantinedtimestamp, */
,bsl.activation_date - bd.bd_part_key as mtta
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mtta2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mtta3
,bsl.activation_date - bsl.create_date as mttc
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mttc2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mttc3
,row_number()over(partition by bsl.msisdn order by bsl.create_date desc ) as rank_
from bfp_sync_log bsl
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and (bsl.reg_type like 'RR%' or bsl.reg_type = 'CR')
-- and bsl.sim_serial = mps.sim_serial 
and mps.platform LIKE 'CBS%'
and date(bsl.create_date) = '2021-08-30'
-- and date(qr.create_date) = '2021-08-30'
--and date(sar.receipt_timestamp) = '2021-08-05'
) 
select * 
from tab1 
where rank_ = 1
) a
group by  1
;



-- tat prepaid 1 ==> re reg (mttc & mtta)
select date(registration_timestamp), round(avg(mtta2) ,2) as mtta,  round(avg(mttc2) ,2) as mttc
from (
with tab1 as (
select
bsl.msisdn, bsl.activation_date, bsl.create_date as registration_timestamp, 
bd.bd_part_key as receipt_timestamp/* ,qr.create_date as quarantinedtimestamp, */
,bsl.activation_date - bd.bd_part_key as mtta
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mtta2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mtta3
,bsl.activation_date - bsl.create_date as mttc
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60 ) as mttc2
,round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2 ) as mttc3
,row_number()over(partition by bsl.msisdn order by bsl.create_date desc ) as rank_
from bfp_sync_log bsl
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and (bsl.reg_type like 'RR%' or bsl.reg_type = 'CR')
-- and bsl.sim_serial = mps.sim_serial 
and mps.platform LIKE 'ICC%'
and date(bsl.create_date) = '2021-08-30'
-- and date(qr.create_date) = '2021-08-30'
--and date(sar.receipt_timestamp) = '2021-08-05'
) 
select * 
from tab1 
where rank_ = 1
) a
group by  1
;
