--Unique MSISDNs with NINs submitted	
--with validnin as (
select count(distinct  bsl.msisdn)
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
--and dda36 = 'Valid'
and dda34 != '' 
and bsl.bfpsyncstatusenum = 'SUCCESS'
--) 
--select *
--from validnin
--group by 1 
--order by 2 desc 
;

--Unique NINs Submitted
select count(distinct  dd.dda34)
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
--and dda36 = 'Valid'
and dda34 != '' 
and bsl.bfpsyncstatusenum = 'SUCCESS'
;

--Unique NINs Verified
select count(distinct  dd.dda34)
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
and dda36 = 'Valid'
and dda34 != '' 
and bsl.bfpsyncstatusenum = 'SUCCESS'
;

--MSISDNs with verified NINs linked in SIMREG
select count(distinct  bsl.msisdn)
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
and dda36 = 'Valid'
and dda34 != '' 
and bsl.bfpsyncstatusenum = 'SUCCESS'