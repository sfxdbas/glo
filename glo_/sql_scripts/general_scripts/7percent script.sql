with t1 as (
select
	msisdn,
    netbook,
    activationdate,
    registrationdate,
    act_date_diff,
    pct_rank
FROM (
    SELECT
       er.code as netbook, 
       msisdn,
       bsl.activation_date as activationdate,
       sar.registration_timestamp as registrationdate, 
        coalesce(abs(round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from sar.registration_timestamp)::numeric), 2)),0) ACT_DATE_DIFF,
        percent_rank() over (partition by enrollment_ref_fk order by  create_date ) as pct_rank
	from sms_activation_request sar, bfp_sync_log bsl, enrollment_ref er 
where sar.unique_id = bsl.unique_id
and bsl.msisdn = sar.phone_number
and bsl.enrollment_ref_fk = er.id 
and bfpsyncstatusenum = 'SUCCESS'
and date(create_date) = '2020-01-01'
and bfpsyncstatusenum = 'SUCCESS'
    ) t
WHERE pct_rank <= 0.07
) 
select msisdn,netbook,activationdate,registrationdate,act_date_diff
from t1 
;



with t1 as (
select
	msisdn,
    netbook,
    activationdate,
    registrationdate,
    act_date_diff,
    pct_rank
FROM (
    SELECT
       er.code as netbook, 
       msisdn,
       bsl.activation_date as activationdate,
       sar.registration_timestamp as registrationdate, 
        coalesce(abs(round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from sar.registration_timestamp)::numeric), 2)),0) ACT_DATE_DIFF,
        percent_rank() over (partition by enrollment_ref_fk order by  create_date ) as pct_rank
	from sms_activation_request sar, bfp_sync_log bsl, enrollment_ref er 
where sar.unique_id = bsl.unique_id
and bsl.msisdn = sar.phone_number
and bsl.enrollment_ref_fk = er.id 
and bfpsyncstatusenum = 'SUCCESS'
and extract(year from create_date) = extract(year from now) 
and extract(week from create_date) = extract(week from now - interval '1 week')
    ) t
WHERE pct_rank <= 0.07
) 
select msisdn,netbook,activationdate,registrationdate,act_date_diff
from t1 
;
