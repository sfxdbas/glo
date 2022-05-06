with extract_dump_48hrs as (
select sar.msisdn as msisdn, er.name as device_name,
to_char(sar.activation_date , 'DD/MM/YYYY HH:MM:SS') as registrationdate
,row_number() over(partition by sar.msisdn order by sar.create_date desc ) as rank_
from bfp_sync_log sar 
join enrollment_ref er on sar.enrollment_ref_fk = er.id
where sar.msisdn ~ '^[0-9.]+$'
and date(sar.create_date) between '2021-04-01' and '2021-06-30'
and sar.msisdn_compliance_status is   null 
and sar.bfpsyncstatusenum = 'SUCCESS'
--and phone_number = '0'
)
select  device_name, msisdn , registrationdate 
from extract_dump_48hrs
where rank_ = 1
order by 3 desc 
;