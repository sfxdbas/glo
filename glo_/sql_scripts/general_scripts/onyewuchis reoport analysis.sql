create table from_dup_26102021 as 
select distinct a.msisdn,app_version,registrationdate, b.reg_type,a.platform
from number_5_12102021b a, bfp_sync_log b 
where a.msisdn =b.msisdn 
and a.sim_serial =b.sim_serial 
;


select msisdn, distinct app_version, registrationdate, reg_type, platform 
from from_dup_26102021 
--order by 1,2,3
;

--select * from bfp_sync_log bsl where msisdn ='09054608043';
select * from sms_activation_request sar where phone_number ='08054219057';
--select * from msisdn_provision_status mps where msisdn = '09054608043' order by create_date ;

select app_version,count(distinct msisdn) 
from number_5_12102021b 
group by 1
order by 1 
;

select * -- msisdn ,count(1)
from number_5_12102021b nb 
--where
--msisdn ='09056577991'
--app_version ='1.00' --and platform like 'ICC%' 
 order by registrationdate desc 
--group by 1 
--having count(1) >1
--order by 2 desc 
;

select * from msisdn_provision_status_log mpsl where msisdn in ('08059605966','08157104435','09056577991' ) order by msisdn,create_date ;

select count(1),operation_name  from msisdn_provision_status_log mpsl where exists (
select 1 -- msisdn ,count(1)
from number_5_12102021b nb 
where nb.msisdn = mpsl.msisdn 
and 
--msisdn ='09056577991' and 
app_version ='1.43' and platform like 'ICC%'
) 
--and mpsl.operation_name like 'MANUAL_B%'
group by 2 order by 1 desc 
;



select count(distinct bsl.msisdn) /*,qrr.description,bsl.unique_id*/ from quarantined_registration qr 
join bfp_sync_log bsl on bsl.unique_id =qr.unique_id 
join quarantined_rejection_reason qrr on qrr.quarantined_reg_fk = qr.pk
where exists (
select 1 -- msisdn ,count(1)
from number_5_12102021b nb 
where nb.msisdn = bsl.msisdn 
and 
--msisdn ='09056577991' and 
app_version ='1.43' and platform like 'ICC%'
) 
and qrr.description in ('MSISDN AND SIM SERIAL VERIFICATION EXCEPTION','NULL MSISDN AND SERIAL NUMBER',
'INVALID MSISDN DETAIL','INVALID VISITOR SIM ID')
--and mpsl.operation_name like 'MANUAL_B%'
;