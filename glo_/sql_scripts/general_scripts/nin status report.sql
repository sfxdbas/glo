--Count of Msisdn with nin and status verified. 
--1.
select count(1) from ( --4,753,693
select distinct on (bsl.msisdn) bsl.msisdn,dd.dda34 nin,dd.dda36 as nin_status ,bsl.create_date , bsl.activationstatusenum
from bfp_sync_log bsl 
join user_id ui on  ui.unique_id= bsl.unique_id
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where bfpsyncstatusenum = 'SUCCESS'
--and bsl.activationstatusenum = 'ACTIVATED'
--and dd.dda34 is not null 
--and date(bsl.create_date) between '2022-03-01' and '2022-03-31'
and bsl.msisdn = '08150499264'
order by bsl.msisdn ,bsl.create_date desc 
) a
where nin is not null  
and nin_status in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
and activationstatusenum = 'ACTIVATED'
;


--Count of Msisdn without nin.
--2.
select count(1) from (
select distinct on (bsl.msisdn) bsl.msisdn,dd.dda34 nin,dd.dda36 as nin_status ,bsl.create_date , bsl.activationstatusenum
from bfp_sync_log bsl 
join user_id ui on  ui.unique_id= bsl.unique_id
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where bfpsyncstatusenum = 'SUCCESS'
--and bsl.activationstatusenum = 'ACTIVATED'
--and dd.dda34 is not null 
--and date(bsl.create_date) between '2022-03-01' and '2022-03-31'
and bsl.msisdn = '08150499264'
order by bsl.msisdn ,bsl.create_date desc 
) a
where nin is null  
--and nin_status in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
and activationstatusenum = 'ACTIVATED'
;

--Daily breakdown of nin verified by external NIN log. 
--
select * 
from external_nin_link_log enll 
where date(create_date) = date(now)-1
;
--Count of nin verified (from the background verification).

