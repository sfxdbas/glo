update quarantined_registration qr
set qr.birthday = to_char(	nvl.birth_date::timestamp, 'yyyy-mm-dd')::timestamp
from nimc_verification_log nvl
where nvl.transaction_id = qr.dda23
and to_char(qr.birthday, 'yyyy-mm-dd') != to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') 
and date(qr.create_date) between '2022-04-01' and '2022-04-29'
and nvl.birth_date not like  '%*%'
;

select * from bfp_sync_log bsl where msisdn  in ('08057099088','09158435682');


select qr.release_status ,qmd.msisdn,qr.unique_id , qr.create_date ,qr.birthday ,
to_char(	nvl.birth_date::timestamp, 'yyyy-mm-dd')::timestamp 
from nimc_verification_log nvl, quarantined_registration qr, quarantined_msisdn_detail qmd 
where nvl.transaction_id = qr.dda23
and qmd.quarantined_reg_fk = qr.pk 
and to_char(qr.birthday, 'yyyy-mm-dd') != to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') 
and date(qr.create_date) between '2022-04-01' and '2022-04-29'
and nvl.birth_date not like  '%*%'
--and qmd.msisdn in ('08057099088','09158435682')
--order by length(to_char(qr.birthday , 'yyyy')) desc  
;

--create table update_birthday_basic_data as 
select bd.id, qr.unique_id qr_ui,ui.unique_id ,bd.birthday bd_birthday,qr.birthday qr_birthday,
to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd')::timestamp nvl, qr.create_date 
from quarantined_registration qr 
join user_id ui on ui.unique_id = qr.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join nimc_verification_log nvl on nvl.transaction_id = qr.dda23
--join quarantined_msisdn_detail qmd on qmd.quarantined_reg_fk = qr.pk 
where date(qr.create_date) between '2022-04-01' and '2022-04-29'
and to_char(qr.birthday, 'yyyy-mm-dd') != to_char(bd.birthday, 'yyyy-mm-dd')
--and nvl.birth_date not like  '%*%'
--and length(to_char(bd.birthday, 'yyyy')) = 4 
--and qmd.msisdn in ('08057099088','09158435682')
--order by length(to_char(bd.birthday , 'yyyy')) desc 
;

select * from bfp_sync_log bsl where msisdn ='08057089896';
select * from update_birthday_basic_data;

--update basic_data bd
set bd.birthday = nvl
from update_birthday_basic_data u
where u.id = bd.id
;

--
select id,birthday,user_id_fk from basic_data bd where id in (3343975297,3345938960);
--2001-02-20 00:00:00	GLO-HH-176E-1950104990284
--1984-01-23 00:00:00	GLO-FH-RIV-OBR-FRRIV20067-674E-1950295057303
--
--select qr.birthday ,unique_id,* from quarantined_registration qr where unique_id in (
select unique_id,id from user_id where id in (3336369174,3340687839)
--)
;