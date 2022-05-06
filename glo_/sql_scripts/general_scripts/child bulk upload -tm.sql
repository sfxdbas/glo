select * from bfp_sync_log bsl where unique_id = 'GLO-DH-LAG-ETI-GWLAVI-361W-1629711980332';

insert into bfp_sync_log 
select hibernate_sequence.nextval,true,now,false,now,null,null,'SUCCESS',null,null,cm.msisdn,cm.serial_number ,null,null,
'GLO-DH-LAG-ETI-GWLAVI-361W-1629711980332', 73049, 'adebanke.kuye@gloworld.com', 'SIMROP','HEWLETT-PACKARD-USH11201AP',
'10.152.89.189','8190','CN'
from bulk_child_upload_01092021 cm
;

select * 
from enrollment_ref er 
where code = 'GLO-DH-LAG-ETI-GWLAVI-361W'
;

select * from msisdn_detail md where basic_data_fk =2850856739;

select * from basic_data bd where user_id_fk in (select id from user_id where unique_id ='GLO-DH-LAG-ETI-GWLAVI-361W-1629711980332');

insert into msisdn_detail 
select hibernate_sequence.nextval,null,null,cm.msisdn,null,true,cm.serial_number ,'PREPAID',null,null,false,2847791000,cm.msisdn_category 
,mps.platform,null,null,cm.alt_number ,cm.first_name,cm.last_name,cm.nin,null,null,'CHILD'
from bulk_child_upload_01092021 cm
join msisdn_provision_status mps on mps.msisdn = cm.msisdn 
where cm.serial_number = mps.sim_serial 
;