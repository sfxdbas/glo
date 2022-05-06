create table nin_gt_four_16082021 as 
SELECT  distinct nin 
FROM public.ncc_audit_june_and_julyv2
where "row_number" > 4
;

select * from ncc_audit_june_july_v3 order by registrationdatetime ;

select dda19,* from dynamic_data dd where dda19 != 'NIGERIA';

--create table ncc_audit_june_july_v3 as 
select  bsl.msisdn, er."name" as kittag,bsl.create_date as registrationdatetime
,s.name as registrationstate,DDA9 as registrationlga,bd.surname,bd.firstname,DDA12 as MOTHERMAIDENNAME, bd.gender,
to_char(bd.birthday,'yyyy-mm-dd') as DATEOFBIRTH,DA3 as RESIDENTIALADDRESS, DDA6 as RESIDENTIALLGA,DDA5 as RESIDENTIALSTATE,
dda19 as  country_of_origin,da8 as STATEOFORIGIN,dd.dda34 as SUBSCRINBERNIN,er."name" as REGISTRATIONDEVICEID
,ku.first_name||' '||ku.surname as agentname,ku.nin as agentnin,bsl.reg_type as registrationtype
,row_number() over(partition by sar.phone_number order by sar.receipt_timestamp desc ) as rank_
from bfp_sync_log bsl 
join user_id ui on bsl.unique_id = ui.unique_id
join basic_data bd on bd.user_id_fk = ui.id
join dynamic_data dd on dd.basic_data_fk = bd.id 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join sms_activation_request sar on bsl.unique_id = sar.unique_id  
join state s  on s.id = sar.state_id 
left join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
where  bsl.msisdn = sar.phone_number 
and bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn ~ '^[0-9.]+$'
and date(bsl.create_date) --= '2021-07-31'
between '2021-06-01' and  '2021-07-31'
order by bsl.create_date
;