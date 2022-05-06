select 
/*bsl.msisdn , */dd.dda34 nin_demo, dd.dda23 tid_demo ,  dd.dda36 ninstatus_demo, dd.id ,ui.unique_id,
qr.dda34 nin_qr,   qr.dda23 tid_qr,  qr.dda36 ninsttaus_qr
--distinct on (bsl.msisdn ) bsl.msisdn, dd.dda34 nin 
from  /*bfp_sync_log bsl 
--join customer_provide_their_nin_07022022 cptn on bsl.msisdn = cptn.msisdn  
join*/ user_id ui --using (unique_id)
join quarantined_registration qr using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id
where /*bsl.bfpsyncstatusenum = 'SUCCESS' 
and bsl.*//* unique_id = 'GLO-HH-371S-1640852839529'
--order by bsl.msisdn, create_date desc 
and*/ dd.dda36 = 'Invalid'
and qr.dda36 = 'NIN_VERIFIED'
;


SELECT 
distinct on (nvl.nin) nin, nin_demo, tid_demo, ninstatus_demo, id, unique_id, nin_qr, tid_qr, ninsttaus_qr, nvl.transaction_id
,
'update dynamic_data set dda34 = '||''''||nin_qr||''''||', dda36 = '||''''||ninsttaus_qr||''''||', dda23 = '||''''||transaction_id||''''||' where id = '||id||';'
,'update quarantined_registration set dda23 = '||''''||nvl.transaction_id ||''''||' where unique_id = '||''''||unique_id||''''||';'
FROM public.replace_demo_value_wt_qr_04052022 a 
join nimc_verification_log nvl on nvl.nin = a.nin_qr 
--where unique_id ='GLO-HH-416S-1633608502887' 
where tid_qr is null 
order by nvl.nin, nvl.create_date desc 
;


--create table dynamic_data_bkup_04052022 as 
select * 
from dynamic_data dd 
where id in 
(select id from replace_demo_value_wt_qr_04052022 rdvwq)