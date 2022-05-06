

--insert into kit_marker
select hibernate_sequence.nextval,1.38,now,er.device_id,er.mac_address,er.code,990,null
from enrollment_ref er  
where code like 'GLO-DN-LAG-ETI-SFX001-212121'
and not exists 
(select 1 from kit_marker km where km.device_id = er.device_id)
;

--insert into kit_marker
--select hibernate_sequence.nextval,1.38,now,er.device_id,er.mac_address,er.code,990,null
select er.device_id ,er.code , kd.name dealer ,
round(n.last_installed_update::numeric, 2) appversion
from enrollment_ref er 
join node n on n.enrollment_ref = er.id 
join heart_beat_status hbs on er.device_id = hbs.realtime_device_id 
join node_assignment na on na.node_fk = n.id 
join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
where lower(os_name) not like '%wind%'
and round(n.last_installed_update::numeric, 2)  != 1.38 
and er.code = 'GLO-HH-514C'
and  exists 
(select 1 from kit_marker km where km.device_id = er.device_id)
--union
;

-- check for upgraded devices 
select km.date_added ,er.device_id, km.app_version expected_version, round(n.last_installed_update::numeric ,2) current_version
from enrollment_ref er 
join node n on n.enrollment_ref = er.id 
join kit_marker km using (device_id)
where er.code in ('GLO-HH-LAG-IBL-SFX001-189918','GLO-DN-LAG-ETI-SFX001-212121')
--order by 4 
;