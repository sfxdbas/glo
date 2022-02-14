--> tat_postpaid new reg (backend to activation)
select date(registration_timestamp),  
case 
	when mtta2 between 0 and 5 then '0-5mins'
	when mtta2 between 6 and 10 then '6-10mins'
	when mtta2 between 11 and 30 then '11-30mins'
	when mtta2 between 31 and 60 then '31mins-1hr'
	when mtta2 between 61 and 1439 then 'greater_than_1hr'
	when mtta2 > 1439 then 'greater_than_24 hrs'
	when mtta2 is null then 'N/A'
else 'gt 24 hrs' end as duration,
count(1), round((count(1) / SUM(count(1)) OVER ())*100,2) AS "% of total"
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
group by 1,2
order by 3 desc 
;

--> tat_prepaid new reg (backend to activation)
select date(registration_timestamp),  
case 
	when mtta2 between 0 and 5 then '0-5mins'
	when mtta2 between 6 and 10 then '6-10mins'
	when mtta2 between 11 and 30 then '11-30mins'
	when mtta2 between 31 and 60 then '31mins-1hr'
	when mtta2 between 61 and 1439 then 'greater_than_1hr'
	when mtta2 > 1439 then 'greater_than_24 hrs'
	when mtta2 is null then 'N/A'
else 'gt 24 hrs' end as duration,
count(1), round((count(1) / SUM(count(1)) OVER ())*100,2) AS "% of total"
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
group by 1,2
order by 3 desc 
;


--> tat_postpaid re reg (backend to activation)
select date(registration_timestamp),  
case 
	when mtta2 between 0 and 5 then '0-5mins'
	when mtta2 between 6 and 10 then '6-10mins'
	when mtta2 between 11 and 30 then '11-30mins'
	when mtta2 between 31 and 60 then '31mins-1hr'
	when mtta2 between 61 and 1439 then 'greater_than_1hr'
	when mtta2 > 1439 then 'greater_than_24 hrs'
	when mtta2 is null then 'N/A'
else 'gt 24 hrs' end as duration,
count(1), round((count(1) / SUM(count(1)) OVER ())*100,2) AS "% of total"
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
group by 1,2
order by 3 desc 
;


--> tat_prepaid re reg (backend to activation)
select date(registration_timestamp),  
case 
	when mtta2 between 0 and 5 then '0-5mins'
	when mtta2 between 6 and 10 then '6-10mins'
	when mtta2 between 11 and 30 then '11-30mins'
	when mtta2 between 31 and 60 then '31mins-1hr'
	when mtta2 between 61 and 1439 then 'greater_than_1hr'
	when mtta2 > 1439 then 'greater_than_24 hrs'
	when mtta2 is null then 'N/A'
else 'gt 24 hrs' end as duration,
count(1), round((count(1) / SUM(count(1)) OVER ())*100,2) AS "% of total"
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
group by 1,2
order by 3 desc 
;
