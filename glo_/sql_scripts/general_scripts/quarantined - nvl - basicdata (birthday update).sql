select
	qr.birthday,
	to_char(	qr.birthday, 'yyyy-mm-dd') newqr,
	nvl.birth_date,
to_char(	nvl.birth_date::timestamp, 'yyyy-mm-dd') newnvl,
	nvl.transaction_id,
	qr.dda23
from	quarantined_registration qr
join nimc_verification_log nvl on	nvl.transaction_id = qr.dda23
where	qr.unique_id = 'GLO-DH-268Y-1632240927380'
;

select qr.pk ,birthday,nvl.birth_date,to_char(qr.birthday, 'yyyy-mm-dd')::timestamp newqr,
to_char(	nvl.birth_date::timestamp, 'yyyy-mm-dd')::timestamp newnvl, release_status 
from quarantined_registration qr,nimc_verification_log nvl
where nvl.transaction_id = qr.dda23
and to_char(qr.birthday, 'yyyy-mm-dd') != to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') 
and date(qr.create_date)=date(now)
--and qr.pk = 2936034970 /*qr.dda23 ='79657253742-1632241263850'*/
;

drop table update_birthday_basic_data ;

update quarantined_registration qr
set qr.birthday = to_char(	nvl.birth_date::timestamp, 'yyyy-mm-dd')::timestamp
from nimc_verification_log nvl
where nvl.transaction_id = qr.dda23
and to_char(qr.birthday, 'yyyy-mm-dd') != to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') 
and date(qr.create_date)=date(now)
;


create table update_birthday_basic_data as 
select bd.id, qr.unique_id qr_ui,ui.unique_id ,bd.birthday bd_birthday,qr.birthday qr_birthday,
to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd')::timestamp nvl
from quarantined_registration qr 
join user_id ui on ui.unique_id = qr.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join nimc_verification_log nvl on nvl.transaction_id = qr.dda23
where to_char(qr.birthday, 'yyyy-mm-dd') != to_char(bd.birthday, 'yyyy-mm-dd')
and date(qr.create_date)=date(now)
;

update basic_data bd
set bd.birthday = nvl
from update_birthday_basic_data nvl
where nvl.id = bd.id
;

select bd.birthday , nvl
from update_birthday_basic_data nvl, basic_data bd 
where nvl.id = bd.id
