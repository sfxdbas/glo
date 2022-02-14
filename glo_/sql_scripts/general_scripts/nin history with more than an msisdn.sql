-- v1 ---
with d_minus_1 as (
select dd.dda34 nin  ,bsl.msisdn, bsl.reg_type , bsl.create_date 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and bsl.reg_type in ('NMSI','ARI','MPI','VNI')
and date(bsl.create_date) = date(now())-1
--and dd.dda34='10028344613'
)
select distinct dm.nin, bsl.msisdn,bsl.reg_type,bsl.create_date as REG_DATE
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id  
join dynamic_data dd on dd.basic_data_fk = bd.id
join d_minus_1 dm on dd.dda34 = dm.nin 
where bfpsyncstatusenum = 'SUCCESS'
--order by dm.nin,bsl.create_date 
;


-- v2 -----
with top as (
with d_minus_1 as (
select dd.dda34 nin  ,bsl.msisdn, bsl.reg_type , bsl.create_date 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and bsl.reg_type in ('NMSI','ARI','MPI','VNI')
and date(bsl.create_date) = date(now())-1
--and dd.dda34 = '94313027478' -- in ('10007429619','31223601074')
)
select  dm.nin, count(distinct bsl.msisdn) --bsl.msisdn,bsl.reg_type,bsl.create_date as REG_DATE
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id  
join dynamic_data dd on dd.basic_data_fk = bd.id
join d_minus_1 dm on dd.dda34 = dm.nin 
where bfpsyncstatusenum = 'SUCCESS'
--order by dm.nin,bsl.create_date 
group by nin 
having count(distinct bsl.msisdn) > 1 
) 
select   top.nin,bsl.msisdn,bsl.reg_type,bsl.create_date as REG_DATE 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id  
join dynamic_data dd on dd.basic_data_fk = bd.id 
join top on dd.dda34 =top.nin 
;


-- V3 ----
select * from (
with top as (
with d_minus_1 as (
select dd.dda34 nin  ,bsl.msisdn, bsl.reg_type , bsl.create_date 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
--and bsl.reg_type in ('NMSI','ARI','MPI','VNI')
and date(bsl.create_date) = date(now())-1
and dd.dda34  != '' -- ='80965505171' -- in ('10007429619','31223601074')
)
select  dm.nin, count(distinct bsl.msisdn) --bsl.msisdn,bsl.reg_type,bsl.create_date as REG_DATE
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id  
join dynamic_data dd on dd.basic_data_fk = bd.id
join d_minus_1 dm on dd.dda34 = dm.nin 
where bfpsyncstatusenum = 'SUCCESS'
--order by dm.nin,bsl.create_date 
group by nin 
having count(distinct bsl.msisdn) > 4 
 ) 
select    top.nin,bsl.msisdn,bsl.reg_type,bsl.create_date as REG_DATE 
,row_number () over (partition by bsl.msisdn order by bsl.create_date desc )
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id  
join dynamic_data dd on dd.basic_data_fk = bd.id 
join top on dd.dda34 =top.nin 
where bfpsyncstatusenum = 'SUCCESS'
) A  where row_number = 1
;