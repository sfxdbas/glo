create table latest_june_july_v3_18082021 as 
with t1 as (
select DDA1, DDA8,reg_type, bsl.unique_id, dd.id ,dda34,dda9,'update dynamic_data set dda34 = '||''''||dda9||''''||' where id = '||dd.id||';'
,bsl.source_path,bsl.target_path ,bsl.file_name, bsl.instance_ip, bsl.instance_port, md.app_version, er."name" ,er.device_id ,dd.dda34 as nin, bsl.msisdn,bsl.reg_type as registrationtype,bsl.create_date as registrationdatetime, er."name" as kittag
,s.name as registrationstate,DDA9 as registrationlga,
bd.surname,bd.firstname,DDA12 as MOTHERMAIDENNAME, bd.gender,
to_char(bd.birthday,'yyyy-mm-dd') as DATEOFBIRTH,DA3 as RESIDENTIALADDRESS, DDA6 as RESIDENTIALLGA,DDA5 as RESIDENTIALSTATE,
DDA19 as countryoforigin,da8 as STATEOFORIGIN,er."name" as REGISTRATIONDEVICEID
,ku.first_name||' '||ku.surname as agentname,ku.nin as agentnin
,row_number() over(partition by sar.phone_number order by sar.receipt_timestamp desc ) as rank_
from bfp_sync_log bsl 
join user_id ui on bsl.unique_id = ui.unique_id
join basic_data bd on bd.user_id_fk = ui.id
join dynamic_data dd on dd.basic_data_fk = bd.id 
join meta_data md on md.basic_data_fk = bd.id
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join sms_activation_request sar on bsl.unique_id = sar.unique_id  
join state s  on s.id = sar.state_id 
left join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
where  bsl.msisdn = sar.phone_number 
and bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn ~ '^[0-9.]+$'
--and er.device_id != 'HEWLETT-PACKARD-USH11201AP'
and date(bsl.create_date) between '2021-06-01' and  '2021-07-31'
--and (dda34 is null or dda34 = '')
--and dda34 != ''
--and bsl.unique_id = 'GLO-HH-EDO-ORD-GWBEN-286T-1626707621310'
--and dd.dda34 = '73317468882'
) select  nin,msisdn,registrationtype,registrationdatetime,stateoforigin,countryoforigin,registrationstate 
from t1 
where rank_ =1
;

select nin,count(1) from latest_june_july_17082021 where /*date(registrationdatetime)>'2021-07-12' 
and*/ nin != '' and registrationtype = 'NMSI' group by 1 having COUNT(1)>4 order by 2 desc ;
select nin,msisdn,registrationtype,registrationdatetime,stateoforigin,countryoforigin,registrationstate
from latest_june_july_v2_17082021 ljj  ;
select nin,msisdn,registrationtype,registrationdatetime,stateoforigin,countryoforigin,registrationstate
from latest_june_july_v3_18082021
where nin != ''
;



select * from latest_june_july_17082021 ljj where nin is null ;


select distinct subscrinbernin nin,msisdn,registrationtype,registrationdatetime,stateoforigin,country_of_origin
from ncc_audit_june_july_v3 najjv 
where subscrinbernin != ''
--where subscrinbernin = '73317468882'
;