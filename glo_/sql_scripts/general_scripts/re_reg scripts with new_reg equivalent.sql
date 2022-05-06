--create table rereg_swap_subscribers_22042022 as 
with re_reg as (
select pk,msisdn,dd.dda34 nin, activationstatusenum,reg_type,create_date, er.code as kittag
from bfp_sync_log bsl 
join user_id ui using (unique_id )
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(create_date) >= '2022-04-04'
and (reg_type like 'RR%' or reg_type in ('SSR','CSR','NLR','CR'))
and msisdn in ('07055512462','08151810555')
)
, new_reg as (
select  pk,msisdn,activationstatusenum,reg_type,create_date   
from bfp_sync_log b 
where bfpsyncstatusenum = 'SUCCESS'
--and activationstatusenum = 'ACTIVATED'
and date(create_date) <= '2022-04-04'
and reg_type not in ('RRI','RRC','SSR','CSR','NLR','CR')
and msisdn in ('07055512462','08151810555')
)
select msisdn,nin,new_reg.create_date as new_reg_time, re_reg.create_date as re_reg_time,re_reg.kittag
from re_reg 
join new_reg using (msisdn )
;


with swaps as (
select ssd.msisdn,ssd.device_tag,ssd.nin ,ssd.create_date 
from sim_swap_demographic ssd 
where date(create_date) >= '2022-04-04'
and swap_status = 'SWAPPED' 
and msisdn in ('07055512462','08151810555')
) ,  new_reg as (
select  pk,msisdn,activationstatusenum,reg_type,create_date   
from bfp_sync_log b 
where bfpsyncstatusenum = 'SUCCESS'
--and activationstatusenum = 'ACTIVATED'
--and date(create_date) >= '2022-04-04'
and reg_type not in ('RRI','RRC','SSR','CSR','NLR','CR')
and msisdn in ('07055512462','08151810555')
) 
select msisdn,nin,new_reg.create_date as new_reg_time, swaps.create_date as re_reg_time,device_tag kittag 
from swaps 
join new_reg using (msisdn)
;


select msisdn,count(1) from rereg_swap_subscribers_22042022 group by 1 order by 2 desc ;


select distinct on (msisdn) msisdn, nin, new_reg_time , re_reg_time , kittag 
from rereg_swap_subscribers_22042022 
--where msisdn = '07055599882'
--where date(re_reg_time) <= 
order by msisdn, new_reg_time desc 
;