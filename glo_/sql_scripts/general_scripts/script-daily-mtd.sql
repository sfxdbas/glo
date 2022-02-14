--Date               |ITEM              |Daily  	|MTD
----------------------------------------------------------
--08/12/2021         |REGISTRATION		|15000  	|500000


with daily as (
select  count(distinct msisdn) as daily
from bfp_sync_log b
where bfpsyncstatusenum = 'SUCCESS' 
and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN','CAR'))
and date(create_date) = date(now()) -1  
), mtd as (
select  count(distinct msisdn) as mtd
from bfp_sync_log b
where bfpsyncstatusenum = 'SUCCESS' 
and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN','CAR'))
and date(create_date) between  cast(date_trunc('month', current_date) as date) and current_date -1
) select date(now)-1 as date,'REGISTRATION' as item,*
from daily, mtd 
;