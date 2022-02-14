with ty as (
select /*date(create_date ),er."code" ,*/ count(1)
from bfp_sync_log bsl, enrollment_ref er 
where bsl.enrollment_ref_fk = er.id 
and bfpsyncstatusenum = 'SUCCESS'
--and er.name = 'GLO-DH-023J'
and date(create_date) between '2021-07-1' and '2021-07-31'
group by 1 ,2
--order by 3 desc 
) 
select * , 
sum(count) over (partition by code order by date ),
percent_rank() over (partition by code order by date ) as pct_rank
from ty
--where code = 'GLO-DH-006A'
;

with t1 as (
select
 msisdn,netbook,activationdate,/*registrationdate,act_date_diff,*/pct_rank
FROM (
select er.name as netbook,msisdn,bsl.create_date as activationdate
--,sar.registration_timestamp as registrationdate
--,coalesce(abs(round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from sar.registration_timestamp)::numeric), 2)),0) ACT_DATE_DIFF
,percent_rank() over (partition by enrollment_ref_fk order by  create_date ) as pct_rank
from /*sms_activation_request sar,*/ bfp_sync_log bsl, enrollment_ref er 
where /*sar.unique_id = bsl.unique_id
and bsl.msisdn = sar.phone_number
and*/ bsl.enrollment_ref_fk = er.id 
and bfpsyncstatusenum = 'SUCCESS'
--and  code = 'GLO-DH-023J'
and extract(year from create_date) = extract(year from now) 
and date(create_date) between '2021-07-1' and '2021-07-31'
--and extract(week from create_date) = extract(week from now - interval '1 week')
    ) t
WHERE pct_rank <= 0.07
) 
select msisdn,netbook,activationdate--,pct_rank /*,registrationdate,act_date_diff*/
from t1 
order by 2,3 desc
;
