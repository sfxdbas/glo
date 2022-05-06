--truncate store_new_details;
--truncate update_subscriber_basic_demo;
--truncate load_msisdns;


--create table store_new_details as 
insert into store_new_details
with tbl_ as (
select ssd.msisdn ,rank() over (partition by ssd.msisdn order by ssd.create_date desc) as rank_,
nvl.first_name, nvl.surname, to_char(nvl.birth_date::date, 'YYYY-MM-DD')||' 00:00:00' as birth_date, now() as date_saved
from nimc_verification_log nvl, sim_swap_demographic ssd 
where ssd.transaction_id = nvl.transaction_id 
and ssd.msisdn in (select msisdn from load_msisdns)
) 
select msisdn, first_name, surname, birth_date, date_saved
from tbl_
where rank_ = 1
;

--create table store_existing_details as 
insert into store_existing_details
with tbl_2 as (
select sar.phone_number, bd.firstname, bd.surname, bd.birthday, bd.id as id_metric, 
rank() over (partition by sar.phone_number order by sar.receipt_timestamp desc) as rank_,now() as date_saved
from basic_data bd, user_id ui, sms_activation_request sar 
where bd.user_id_fk = ui.id 
and sar.unique_id = ui.unique_id 
and exists (select 1 from store_new_details snd where snd.msisdn = sar.phone_number)
) 
select phone_number, firstname, surname, birthday,  id_metric,date_saved
from tbl_2 
where rank_ = 1
;


--create table update_subscriber_basic_demo  as 
insert into update_subscriber_basic_demo 
select snd.*, sed.id_metric 
from store_new_details snd
join store_existing_details sed on snd.msisdn = sed.phone_number
;

/*select bd.firstname, bd.surname,bd.birthday, bd.id, sed.*
from basic_data bd, store_existing_details sed 
where bd.id = sed.id_metric
;*/


update basic_data bd 
set bd.firstname = sbd.first_name, 
	bd.surname = sbd.surname,
	bd.birthday = sbd.birth_date::date
from update_subscriber_basic_demo sbd
where bd.id = sbd.id_metric
;