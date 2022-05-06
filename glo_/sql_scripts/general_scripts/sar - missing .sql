select * 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS' 
and not exists 
(select 1 from sms_activation_request sar where sar.unique_id = bsl.unique_id and  SAR.phone_number = BSL.msisdn)
and date(bsl.create_date) >= '2021-08-01'
order by BSL.create_date 
;

select * from phone_number_status pns;
select * from sms_activation_request order by id desc ;

--insert into phone_number_status 
select hibernate_sequence.nextval,null,null,null /*updateWithRT*/,bsl.msisdn /*USEMSISDN*/,'ACTIVATION_PENDING',null
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS' 
and not exists 
(select 1 from sms_activation_request sar where sar.unique_id = bsl.unique_id and  SAR.phone_number = BSL.msisdnn)
and date(bsl.create_date) >= '2021-08-01' 
;

--insert into sms_activation_request 
select hibernate_sequence.nextval,bsl.activation_date,null,null,null,bd.bd_part_key,null,bd.surname||' '||bd.firstname,er.code,
null as is_init,null,null,bsl.msisdn,dda1,bd.bd_part_key,bsl.create_date,bsl.reg_type, 'BIOMETRICS',BSL.sim_serial,BD.state_of_registration_fk,
case when UI.description is null then 'UNACTIVATED' else UI.description end,bsl.unique_id,null,null
from bfp_sync_log bsl
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on ui.id = bd.user_id_fk 
join dynamic_data dd on bd.id = dd.basic_data_fk 
--join phone_number_status pns on pns.remarks = bsl.msisdn 
where bfpsyncstatusenum = 'SUCCESS' 
and not exists 
(select 1 from sms_activation_request sar where sar.unique_id = bsl.unique_id and  SAR.phone_number = BSL.msisdn)
and date(bsl.create_date) >= '2021-08-01' 
;

insert into phone_number_status 
with T1 as (
select hibernate_sequence.nextval,null A ,null B,receipt_timestamp /*updateWithRT*/,phone_number /*USEMSISDN*/ C,unique_id /*'ACTIVATION_PENDING' */D ,SAR.ID E
from sms_activation_request sar 
WHERE phone_number_status_fk is null 
) 
select NEXTVAL,A::TIMESTAMP,B::TIMESTAMP,receipt_timestamp,C,
'UPDATE SMS_ACTIVATION_REQUEST SET PHONE_NUMBER_STATUS_FK = '||NEXTVAL||' WHERE PHONE_NUMBER = '||''''||C||''''||' AND UNIQUE_ID = '||''''||D||''''||' AND ID = '||E||';',E
from T1 
order by C
;

select *
,'update phone_number_status set remarks='''',status=''ACTIVATION_PENDING'',TABSFILENUMBER=NULL WHERE ID = '||ID||';'
from phone_number_status pns where remarks != '';

select * from phone_number_status pns ;

