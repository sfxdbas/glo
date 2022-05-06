--create table mps_update_05042021 as 
with t1 as (
select mps.pk, bsl.create_date, bsl.msisdn, bsl.unique_id as bsl_unique_id, rank() over (partition by bsl.msisdn order by bsl.create_date desc ), 
mps.unique_id as mps_unique_id, MPS.status as MPS_STATUS, BSL.activationstatusenum  
from bfp_sync_log bsl, msisdn_provision_status mps 
where bsl.msisdn = mps.msisdn 
and bfpsyncstatusenum = 'SUCCESS'
and BSL.MSISDN = '08078170240'
) 
select * 
from t1
--where rank = 1
;


--select * from msisdn_provision_status mps where PK = 710063139;

select *  from mps_update_05042021 --where PK =  881405814;
--where --upper(mps_status) = 'ACTIVE' and activationstatusenum = 'ACTIVATED' and
-- rank = 1
--order by create_date desc 
;

select PK, COUNT(1)
from mps_update_05042021 
group by 1
HAVING COUNT(1) > 1
order by 2 desc 
;


--update msisdn_provision_status s
set unique_id = (select bsl_unique_id from mps_update_05042021 u where s.PK = u.PK )
where s.PK in (select PK from mps_update_05042021)
;