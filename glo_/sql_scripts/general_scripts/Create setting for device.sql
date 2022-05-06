select create_setting_v3('{BLACKBERRY-356836090469211
,TECNOMOBILELIMITED-356542114003503}') ;



--insert into device_specific_setting 
select  hibernate_sequence.nextval, true, now, false, now, 'PASSIVE-LIVENESS-USE-CASES','RR,AO', ID 
from enrollment_ref 
where device_id in 
(
'TECNOMOBILELIMITED-356200115485043'
)
ON CONFLICT (setting_name, enrollment_ref_fk) 
DO update set setting_value = excluded.setting_value, last_modified = now;
--union all 
--select hibernate_sequence.nextval, true, now, false, now, 'PILOT-AVAILABLE-USE-CASE', 'SS', ID 
--from enrollment_ref 
--where device_id in 
--('HEWLETT-PACKARD-CZC1113VVJ')
;

select * 
from device_specific_setting
where/* date(last_modified) = date(now)
and */ enrollment_ref_fk in (3361989319)
order by last_modified desc ,enrollment_ref_fk,setting_name ;

select * from enrollment_ref er where er.device_id in ('HEWLETT-PACKARD-TRF3080TXG')
;

--insert into device_specific_setting 
select HIBERNATE_SEQUENCE.NEXTVAL , active, NOW, deleted, NOW, setting_name, setting_value, 3352101681, km_user_fk 
from device_specific_setting
where /*date(last_modified) = date(now)
and*/  enrollment_ref_fk =286243091
order by last_modified desc ,enrollment_ref_fk,setting_name ;
