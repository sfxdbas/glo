
select distinct dda11,bsl.reg_type ,device_id, BSL.unique_id ,dda34,qmd.msisdn,bsl.create_date,qr.release_status, qr.eye_balling_km_user_fk,ku.email_address, erh.reason , erh.id 
,bsl.instance_ip , bsl.instance_port 
from quarantined_registration qr
left join  eyeballing_rejection_history  erh on erh.quarantined_registration_fk = qr.pk
,quarantined_msisdn_detail qmd , km_user ku, bfp_sync_log bsl
where qr.pk = qmd.quarantined_reg_fk 
and ku.pk = qr.eye_balling_km_user_fk 
and bsl.unique_id = qr.unique_id 
--and QR.release_status = 'RELEASED'
and dda34 in ('38743384947',
'73066732065',
'62598312189',
'14068208666',
'32915181081',
'35762270585',
'46158213168',
'49718189723',
'56249162538',
'56266818385',
'57305253838',
'58488453629',
'59315262849',
'60053576400',
'62834017914',
'73596542814',
'84853824420',
'86033912144',
'90826378616',
'91639787279',
'16378954228',
'17719161436',
'21232581271')
--order by 3 desc 
;

select * from bfp_failure_log bfl where unique_id = 'GLO-HH-836M-1628864008610';

with validnin as (
select dda34 as nin, count(1)
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
and bsl.reg_type = 'NMSI'
--and dda36 = 'Valid'
--and dda34 != '' 
and bsl.bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) >= date(now) - interval '2 weeks '
group by 1 
having count(1)>4
order by 2 desc 
) 
select *
from validnin
--group by 1 
--order by 2 desc 
;