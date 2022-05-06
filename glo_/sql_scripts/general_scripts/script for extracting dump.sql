--create table extract_dump_06072021 as  
with extract_dump as (
select sar.phone_number as msisdn, bd.firstname ||' '||bd.surname as name, bd.birthday as dateofbirth, sar.enrollment_ref as netbookid,
	sar.receipt_timestamp as registrationdate, da3 as address, da8 as state, bd.gender, mps.imsi ,
	row_number() over(partition by sar.phone_number order by sar.receipt_timestamp desc ) as rank_
from sms_activation_request sar 
join user_id ui on ui.unique_id = sar.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
left join msisdn_provision_status mps on mps.msisdn = sar.phone_number 
where phone_number = '00079049618'
)
select msisdn, name, dateofbirth,netbookid, registrationdate, address, state, gender , imsi
from extract_dump
where rank_ = 1
;

select phone_number, count(1)
from sms_activation_request sar 
group by 1 having count(1) > 1
;

select * from extract_dump_06072021
where msisdn ~ '^[0-9.]+$' 
--GLO-DH-942H,Philip Abraham,1987-10-04 00:00:00,GLO-DH-942H,2020-10-19 15:15:14,"7 Gbadamosi LAGOS",
;


with extract_dump as (
select sar.phone_number as msisdn, bd.firstname,bd.surname as lastname, 
to_char(bd.birthday, 'DD/MM/YYYY') as dateofbirth, sar.enrollment_ref as netbookid,
to_char(sar.receipt_timestamp, 'DD/MM/YYYY HH:MM:SS') as registrationdate, da3 as address, 
DDA6 as lga,  da8 as state,	bd.gender, mps.imsi, sar.serial_number as sim_serial,
sar.registration_type
,row_number() over(partition by sar.phone_number order by sar.receipt_timestamp desc ) as rank_
from sms_activation_request sar 
join user_id ui on ui.unique_id = sar.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
left join msisdn_provision_status mps on mps.msisdn = sar.phone_number 
where phone_number ~ '^[0-9.]+$'
--and phone_number = '0;'
)
select msisdn, firstname, lastname, dateofbirth, netbookid,
registrationdate, address,  lga, state,	gender, imsi, sim_serial, registration_type
from extract_dump
where rank_ = 1
;







with extract_dump as (
select sar.phone_number as msisdn, bd.firstname,bd.surname as lastname, 
to_char(bd.birthday, 'DD/MM/YYYY') as dateofbirth, sar.enrollment_ref as netbookid,
to_char(sar.receipt_timestamp, 'DD/MM/YYYY HH:MM:SS') as registrationdate, replace(da3, ',',' ') as address, 
replace(DDA6, ',',' ') as lga,  da8 as state,	bd.gender, mps.imsi, sar.serial_number as sim_serial,
sar.registration_type
,row_number() over(partition by sar.phone_number order by sar.receipt_timestamp desc ) as rank_
from sms_activation_request sar 
join user_id ui on ui.unique_id = sar.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
left join msisdn_provision_status mps on mps.msisdn = sar.phone_number 
where phone_number ~ '^[0-9.]+$'
and date(receipt_timestamp) between '2021-06-01' and '2021-06-30'
--and phone_number = '0'
)
select msisdn, firstname, lastname, dateofbirth, netbookid,
registrationdate,  lga, state,	gender, imsi, sim_serial, registration_type, address
from extract_dump
where rank_ = 1
;
