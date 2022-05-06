create table nmsi_nin_msisdn_count_inception_19082021 as 
select dda34 as nin,  count(distinct bsl.msisdn) as totalmsisdns
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
--and dda36 = 'Valid'
--and dda34 = '13352814735' 
--and bsl.msisdn 
--in 
and bsl.reg_type = 'NMSI'
--and date(bsl.create_date) >= /*'2021-07-12' --*/ '2021-04-27'
and bsl.bfpsyncstatusenum = 'SUCCESS'
--and dda34 = '81692625188'
group by 1 
--having  count(distinct bsl.msisdn) > 4
order by 2 desc 
;

select distinct dda34 as nin,  bsl.msisdn , bsl.create_date, ui.u_part_key 
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
--and dda36 = 'Valid'
--and dda34 = '13352814735' 
--and bsl.msisdn 
--in 
and bsl.reg_type = 'NMSI'
and date(bsl.create_date) >= '2021-04-27'
and bsl.bfpsyncstatusenum = 'SUCCESS'
and dda34 = '46119353033'
order by 1 ,2 
;

select * from device_specific_setting dss where enrollment_ref_fk in (select id from enrollment_ref er where device_id='HEWLETT-PACKARD-USH11201AP')
