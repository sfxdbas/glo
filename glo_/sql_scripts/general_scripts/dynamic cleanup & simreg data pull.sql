--create table dynamic_data_bkup_05052022 as
select * --id,dda34,dda36,dda23
from dynamic_data dd 
where dda36 = 'Invalid'
and dda34 != ''
and left(dda23,11) = dda34
--and ID in (2847791001,402898966,402894009,391578748)
;


select 'update dynamic_data set dda36 = ''NIN_VERIFIED'' where id = '||id||';' --, id,dda34,dda36,dda23 
from dynamic_data_bkup_05052022
--where left(dda23,11) = dda34
;

--update dynamic_data set dda36 = 'NIN_VERIFIED' where id = 511652513;

--  create table SIMREG_DUMP_22042022 as 
select distinct on (bsl.msisdn) bsl.msisdn,bsl.create_date registration_date,bd.firstname, bd.surname lastname,
bd.birthday as dob, dd.dda34 nin,dd.dda36 as nimc_verification_status , bsl.activationstatusenum,BSL.REG_TYPE
from bfp_sync_log bsl 
join user_id ui on  ui.unique_id= bsl.unique_id
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where bfpsyncstatusenum = 'SUCCESS'
--and bsl.activationstatusenum = 'ACTIVATED'
-- and dd.dda34 is  not null 
--and date(bsl.create_date) between '2022-03-01' and '2022-03-31'
-- and bsl.msisdn ='07050661319'
order by bsl.msisdn ,bsl.create_date desc 
;


-- 48,136,458
-- 48,152,293
select msisdn, registration_date, firstname, lastname, dob, nin, nimc_verification_status from SIMREG_DUMP_22042022 ;