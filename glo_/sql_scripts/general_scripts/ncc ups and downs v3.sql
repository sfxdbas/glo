--with a as (
select a.SUBSCRINBERNIN,/*date(registrationdatetime),*/ count(1) from (
select distinct  dd.dda34 as SUBSCRINBERNIN, md.msisdn, /*er."name" as kittag,*/ui.u_part_key as registrationdatetime
/*,md2.state_of_registration as registrationstate*/,/*DDA9 as registrationlga,*/bd.surname,bd.firstname,DDA12 as MOTHERMAIDENNAME, bd.gender,
to_char(bd.birthday,'yyyy-mm-dd') as DATEOFBIRTH,DA3 as RESIDENTIALADDRESS, DDA6 as RESIDENTIALLGA,DDA5 as RESIDENTIALSTATE,
da8 as STATEOFORIGIN ,er.name
--,ku.first_name||' '||ku.surname as agentname,ku.nin as agentnin,
,dd.dda11 as registrationtype
from dynamic_data dd 
 join msisdn_detail md on md.basic_data_fk = dd.basic_data_fk 
  join basic_data bd on bd.id = dd.basic_data_fk 
  join user_id ui on ui.id = bd.user_id_fk
  join meta_data md2 on md2.basic_data_fk = bd.id
  join enrollment_ref er on er.id = md2.enrollment_ref_fk 
   where dd.dda34 
--   = '13352814735'
   in (select dda34 from nin_wt_5more_msisdns_16082021) 
and date(ui.u_part_key) > '2021-04-27' and dd.dda11 in  ('NMSI')
--order by er.name desc 
--  
order by 1,2
) a group by 1--,2 
order by 2 desc 
--order by 2 desc --) select sum(count) from a 
   ;
  
  select distinct md.msisdn,ui.unique_id from dynamic_data dd 
 join msisdn_detail md on md.basic_data_fk = dd.basic_data_fk 
  join basic_data bd on bd.id = dd.basic_data_fk 
  join user_id ui on ui.id = bd.user_id_fk 
--  join bfp_sync_log bsl on bsl.unique_id = ui.unique_id 
--   where md.msisdn = bsl.msisdn 
   and dd.dda34 = '13352814735' and date(ui.u_part_key) >= '2021-04-27' and dd.dda11 in ('NMSI')
   ;
  
   
  
  select sum(count)
  from nin_wt_5more_msisdns_16082021 where dda34 is not null;
  
 
 select * from enrollment_ref er where name = 'GLO-DH-120O';
 ;select * from meta_data md where realtime_device_id ='HEWLETT-PACKARD-TRF12703PF';
 select tag,* from heart_beat_status hbs where realtime_device_id ='HEWLETT-PACKARD-TRF12703PF'