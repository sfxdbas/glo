create table nindata_migrate_08012021_v2_passport2 as 
select hibernate_sequence.nextval as record_number, nm.nin, bd.firstname, bd.othername as middlename, bd.surname as lastname, 
	   sar.phone_number, dd.dda9 as registrationlga, p.passport_data as photo, bd.id as basic_data_id
from nindata_migrate_08012021 nm, sms_activation_request sar, basic_data bd, user_id ui, passport p, dynamic_data dd
where nm.msisdn = sar.phone_number 
and sar.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and bd.id = p.basic_data_fk 
and bd.id = dd.basic_data_fk 
;

create table nindata_migrate_08012021_v2_fingerprint2 as
select hibernate_sequence.nextval as record_number, nm.nin, bd.firstname, bd.othername as middlename, bd.surname as lastname, 
	   sar.phone_number, wi.finger as finger_posititon, wi.wsq_data as fingerprint, bd.id as basic_data_id
from nindata_migrate_08012021 nm, sms_activation_request sar, basic_data bd, user_id ui, wsq_image wi
where nm.msisdn = sar.phone_number 
and sar.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and bd.id = wi.basic_data_fk 
;

create table storeid_fp_pp_01022021 as 
with t1 as (
select  basic_data_id, count(1) from nindata_migrate_08012021_v2_fingerprint2
group by 1 
having count(1) = 4 
) 
select * from t1 
limit 1000000
;


create table nimc_nin_sim_reg_table as 
select nmp.*, nmf.finger_posititon, nmf.fingerprint
from nindata_migrate_08012021_v2_passport2 nmp, nindata_migrate_08012021_v2_fingerprint2 nmf
where nmp.basic_data_id = nmf.basic_data_id
and nmp.basic_data_id in 
(select basic_data_id from storeid_fp_pp_01022021)
;


select * from nimc_nin_sim_reg_table;
select * from sms_activation_request sar ;
