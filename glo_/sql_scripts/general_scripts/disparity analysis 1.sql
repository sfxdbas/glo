create table came_in_first_sept_14092021 as 
select   msisdn, create_date,reg_type,msisdn_compliance_status  -- distinct msisdn 
from bfp_sync_log b 
where date(create_date) = '2021-09-1' 
and bfpsyncstatusenum = 'SUCCESS'
and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
;

--create table came_in_snd_thten_sept_14092021 as 
select    msisdn, create_date,reg_type,msisdn_compliance_status 
from bfp_sync_log b 
where date(create_date) between  '2021-09-2'  and  '2021-09-13'
and bfpsyncstatusenum = 'SUCCESS'
and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
;
select * from nin_data_20092021 nd ;
select *
from came_in_snd_thten_sept_14092021 a
where exists 
(select 1 from  came_in_first_sept_14092021 b where a.msisdn = b.msisdn)
--group by 1 
order by 2 desc 
;

select *
from came_in_first_sept_14092021  a
where exists 
(select 1 from came_in_snd_thten_sept_14092021   b where a.msisdn = b.msisdn)
--group by 1 
order by 2 desc 
;



select  msisdn, create_date,reg_type,msisdn_compliance_status,msisdn_compliance_timestamp 
from bfp_sync_log bsl 
where msisdn = '08052193888'
--and date(create_date) between  '2021-09-1'  and  '2021-09-13'
order by 2
;