with extract_dump_48hrs as (
select sar.msisdn as msisdn, er.name as deviceid,
to_char(sar.create_date , 'DD-MM-YYYY HH:MM:SS') as registrationdate
,bd.firstname,case when bd.othername = '' or bd.othername is null then 'NA' else bd.othername end as middlename, 
bd.surname,to_char(bd.birthday, 'YYYY-MM-DD') as dateofbirth
,row_number() over(partition by sar.msisdn order by sar.create_date desc ) as rank_
from bfp_sync_log sar 
join enrollment_ref er on sar.enrollment_ref_fk = er.id
join user_id ui on ui.unique_id = sar.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where sar.msisdn ~ '^[0-9.]+$'
and date(sar.create_date) between '2021-07-01' and '2021-07-31'
and sar.msisdn_compliance_status is   null 
and sar.bfpsyncstatusenum = 'SUCCESS'
--and phone_number = '0'
)
select  deviceid, msisdn, registrationdate, 
 registrationdate,firstname, middlename,surname,  dateofbirth
from extract_dump_48hrs
where rank_ = 1
;