-- REPORTS NIN WITH MSISDN 
--Total number of Unique (ACTIVE) 
--
select count(1) -- 42,967,743
from nin_with_msisdn_14042022b nwm 
where activationstatusenum = 'ACTIVATED'
;

--most recent msisdn, total count of msisdn with linked NIN(verified NIN) and,
--
select count(1)  -- 4,556,343
from nin_with_msisdn_14042022b nwm 
where nin is not null  
and nin_status in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
and activationstatusenum = 'ACTIVATED'
;

--total number of unique NIN linked with MSISDNs
select count(distinct nin )  --2,790,506
from nin_with_msisdn_14042022b nwm 
where nin is not null  
and nin_status in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
and activationstatusenum = 'ACTIVATED'
;


------------------------------------------->>>


select *
from dynamic_data dd where exists (
select 	* 
from	external_nin_link_log en 
where	date(create_date) between '2022-04-07' and '2022-04-08'
	and verification_transaction_id is not null
	and en.dynamic_data_id = dd.id 
)
and dda34 is null 
;

--create table dynamic_data_bkup_12042022d as 
with tab as (
select distinct on (dynamic_data_id) dynamic_data_id ,create_date ,msisdn, nin ,verification_transaction_id,basic_data_id
from external_nin_link_log enll 
where date(create_date) between '2022-04-04' and '2022-04-11'
and verification_transaction_id is not null
order by dynamic_data_id, create_date desc 
) 
select dd.*
--'update dynamic_data set dda34 = '||''''||tab.nin||''''||', dda36 = ''NIN_VERIFIED'', dda23 = '||''''||tab.verification_transaction_id||''''||' where id = '||tab.dynamic_data_id||';',
--'update dynamic_data set dda34 = '||''''||qr.dda34||''''||', dda36 = ''NIN_VERIFIED'', dda23 = '||''''||tab.verification_transaction_id||''''||' where id = '||dd.id||';',
--tab.*,UI.UNIQUE_ID,/*QR.UNIQUE_ID,*/bd.bd_part_key,dd.dda11,dd.dda34,/*qr.dda34 qr_nin,*/dd.dda23/*,qr.dda23 qr_trans_id*/,dd.dda36, 
--nvl.first_name fn_nimc,bd.firstname fn_simreg ,nvl.surname ln_nimc,bd.surname ln_simreg
from tab
join dynamic_data dd on dd.id = tab.dynamic_data_id 
join basic_data bd on bd.id = tab.basic_data_id
join user_id ui on ui.id = bd.user_id_fk 
-- join quarantined_registration qr on qr.unique_id = ui.unique_id
join nimc_verification_log nvl on nvl.transaction_id =  dd.dda23 
where lower(nvl.first_name)||' '||lower(nvl.surname) != lower(bd.firstname)||' '||lower(bd.surname)
and date_part('year',bd.bd_part_key)< 2021
--and qr.dda34 = dd.dda34
and dd.dda34 is not null 
--and qr.dda23 = '38753321551-1649724295125'
--and ui.unique_id ='GLO-DH-959U-1582714521342'
--and dd.id = 490128623
--and qr.dda34 is null 
;

select distinct reg_type from bfp_sync_log ssd where unique_id in (
select unique_id from USER_ID where ID in (
select USER_ID_FK from BASIC_DATA where ID in (
select  BASIC_DATA_FK
from dynamic_data_bkup_12042022d ddbd 
where dda11 = 'SSR')))
;

select * from dynamic_data dd where dda23 = '85935101273-1649477227722';
select * 
from nimc_verification_log nvl  where transaction_id = '85935101273-1649477227722';
select * from external_nin_link_log enll where verification_transaction_id = '85935101273-1649477227722';


select transaction_id ,* from nimc_verification_log nvl where nin = '87263087651' and transaction_id = '87263087651-1640853301315' order by create_date desc ;
select id,dda34,dda36,dda23 from dynamic_data ddmd where basic_data_fk in (
select id  from basic_data bd where user_id_fk in (
select id  from user_id where unique_id ='GLO-HH-371S-1640852839529'));
select * from bfp_sync_log bsl where msisdn = '08150834407';
select dda34,dda36,dda23,* from quarantined_registration qr where unique_id ='GLO-HH-371S-1640852839529'
-- ENLL stats
/*-- unique NIN 
-- dyanmicData in enll (NIN _ verified )
* 4th entry enll*/ 

--1.
select count(distinct nin ) 
from external_nin_link_log enll 
where date(create_date) between '2022-04-07' and date(now)
;


--2.
select count(distinct dda34) 
from dynamic_data dd 
where exists (
select 1 
from external_nin_link_log enll 
where date(create_date) between '2022-04-07' and date(now) 
--and enll.dynamic_data_id = dd.id
and enll.nin = dd.dda34 
)
and dd.dda36 in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
;

-- MSISDNs with NIN (verfied) - `4,448,172`
--3.
-- create table nin_with_msisdn_04042022 as 
select count(1) from (
select distinct on (bsl.msisdn) bsl.msisdn,dd.dda34 nin,dd.dda36 as nin_status ,bsl.create_date , bsl.activationstatusenum
from bfp_sync_log bsl 
join user_id ui on  ui.unique_id= bsl.unique_id
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where bfpsyncstatusenum = 'SUCCESS'
--and bsl.activationstatusenum = 'ACTIVATED'
-- and dd.dda34 is  not null 
--and date(bsl.create_date) between '2022-03-01' and '2022-03-31'
order by bsl.msisdn ,bsl.create_date desc 
) a
where nin is not null  
and nin_status in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
and activationstatusenum = 'ACTIVATED'
;

-- Distinct NIN on SIMREG (verified) - `2,755,151`
--4.
select count(distinct dda34)
from dynamic_data dd 
where dd.dda36 in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid')
;

