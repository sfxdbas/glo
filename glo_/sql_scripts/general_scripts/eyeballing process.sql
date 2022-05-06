select bfp_sync_log_fk , count(1) from eyeballing where DATE(create_date) = DATE(NOW) group by 1 order by 2 desc limit 100 ;

select * from EYEBALLING where bfp_sync_log_fk =2818182177;
select eyeballing_fk, count(1) from eyeballing_log el group by 1 order by 2 desc  ;

select * from infraction i ; 


drop table insert_into_eyeball;

create table insert_into_eyeball as 
select qr.release_status as qr_status,bsl.bfpsyncstatusenum as bslstatus, qr.unique_id as qr_uniqueid, bsl.unique_id as bsluniqueid, 
	   qr.create_date as qr_date, bsl.create_date as bsl_date, bsl.msisdn,bsl.pk as bfp_sync_logfk,bd.id as basicdatafk,
	   qr.eye_balling_km_user_fk 
from quarantined_registration qr, bfp_sync_log bsl, basic_data bd, user_id ui 
where qr.unique_id = bsl.unique_id 
and bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and qr.release_status = 'RELEASED'
and bsl.bfpsyncstatusenum = 'SUCCESS'
and date(qr.create_date) = date(now()) 
--order by bsl.unique_id 
;


select qr.release_status ,bsl.bfpsyncstatusenum, qr.unique_id, bsl.unique_id,
	   qr.create_date as qr_date, bsl.create_date as bsl_date, bsl.msisdn,bsl.pk
from quarantined_registration qr, bfp_sync_log bsl
where qr.unique_id = bsl.unique_id 
and qr.release_status = 'RELEASED'
and bsl.bfpsyncstatusenum = 'SUCCESS'
and date(qr.create_date) = date(now()) 
;

select release_status,unique_id,* 
from quarantined_registration qr, quarantined_msisdn_detail qmd 
where qr.pk = qmd.quarantined_reg_fk 
and date(qr.create_date) = date(now())
and release_status = 'RELEASED'
order by qr.unique_id 
;

--insert into eyeballing 
select hibernate_sequence.nextval, true, now(), false, now(),eye_balling_km_user_fk,'Valid',
	   basicdatafk,372318774 as infractionfk,bfp_sync_logfk
from insert_into_eyeball ie
where not exists 
(select 1 from eyeballing e where e.bfp_sync_log_fk = ie.bfp_sync_logfk)
;

--insert into eyeballing_log
select hibernate_sequence.nextval, true, now(), false, now(), status, pk, 372318774 
from eyeballing e 
where e.pk > (select max(eyeballing_fk) from eyeballing_log)
;

select * from eyeballing_log order by 3 desc ;