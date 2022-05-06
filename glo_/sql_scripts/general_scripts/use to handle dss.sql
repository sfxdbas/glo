--create table setting_bkup_07092021 as 
select * from (
select *
,row_number() over(partition by name order by id)
from setting s 
--where name like '%JWT_KEY%'
order by name, id 
)  a   --where row_number >1 
;


select name,count(1)
from setting s group by 1 order by 2 desc 
;

--create table device_specific_setting_bkup_07092021 as 
select * 
from device_specific_setting 
where enrollment_ref_fk =73101
;


--create table noton143_133_10092021 as 
--
--insert into device_specific_setting 
select  t.* --    distinct kd.name as dealer, hbs.app_version,er.code,er.device_id,  hbs.os_name
from device_specific_setting_bkup_07092021 T
join enrollment_ref er on er.id = t.enrollment_ref_fk 
join node n on n.enrollment_ref = er.id 
join node_assignment na on n.id = na.node_fk 
join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
join heart_beat_status hbs on hbs.realtime_device_id = er.device_id 
where not exists  (select 1 from device_specific_se.tting dss where /*DSS.PK = T.PK and*/ dss.enrollment_ref_fk = t.enrollment_ref_fk
and dss.setting_name = t.setting_name)
and app_version      in  ('1.43','1.33')
--and round(n.last_installed_update::numeric ,2)      in  ('1.43','1.33')
--ON CONFLICT (setting_name, enrollment_ref_fk) 
--dO update set setting_value = excluded.setting_value, last_modified = now;
--and kd.name not in ('SEAMFIXQA SUPPORT')
--order by app_version desc   
;
--with tab as (
--create table dss_pk_07092021_V2 as 
select dss.pk , hbs.app_version, dss.setting_name,dss.setting_value,er.device_id, hbs.os_version ,hbs.os_name 
from device_specific_setting dss 
join enrollment_ref er on er.id = dss.enrollment_ref_fk 
join heart_beat_status hbs on hbs.tag = er.code 
where setting_value  like '%SS%'
and hbs.app_version != '1.43'
--and lower(os_name) not like '%windows%'
union all 
select dss.pk , hbs.app_version, dss.setting_name,dss.setting_value,er.device_id, hbs.os_version ,hbs.os_name 
from device_specific_setting dss 
join enrollment_ref er on er.id = dss.enrollment_ref_fk 
join heart_beat_status hbs on hbs.tag = er.code 
where setting_value  like '%SS%'
and hbs.app_version != '1.33'
--and lower(os_name) not like '%windows%'
--order by hbs.app_version desc
union all 
select dss.pk , hbs.app_version, dss.setting_name,dss.setting_value,er.device_id, hbs.os_version ,hbs.os_name 
from device_specific_setting dss 
join enrollment_ref er on er.id = dss.enrollment_ref_fk 
join heart_beat_status hbs on hbs.tag = er.code 
where setting_value  like '%SEARCH%'
and hbs.app_version != '1.43'
--and lower(os_name) not like '%windows%'
union all 
select dss.pk , hbs.app_version, dss.setting_name,dss.setting_value,er.device_id, hbs.os_version ,hbs.os_name 
from device_specific_setting dss 
join enrollment_ref er on er.id = dss.enrollment_ref_fk 
join heart_beat_status hbs on hbs.tag = er.code 
where setting_value  like '%SEARCH%'
and hbs.app_version != '1.33'
--and lower(os_name) not like '%windows%'
;
) ;

select APP_VERSION from heart_beat_status hbs where TAG = 'GLO-NB-LAG-ETI-IS-GLOWORLD-909Q';

select 'DELETE FROM device_specific_setting WHERE PK = '||DSS2.PK||';'
from device_specific_setting dss2 
where not exists (
select 1 
from dss_pk_07092021_V2 tab 
where tab.pk = dss2.pk 
)
and  dss2.setting_VALUE like '%SS%'
--and  dss2.setting_VALUE like '%SEARCH%'
union all 
select 'DELETE FROM device_specific_setting WHERE PK = '||DSS2.PK||';' 
from device_specific_setting dss2 
where not exists (
select 1 
from dss_pk_07092021_V2 tab 
where tab.pk = dss2.pk 
)
--and  dss2.setting_VALUE like '%SS%'
and  dss2.setting_VALUE like '%SEARCH%'
--order by length(setting_value )   DESC
;