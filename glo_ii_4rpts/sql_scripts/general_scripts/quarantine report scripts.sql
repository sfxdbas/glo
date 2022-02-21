
-- 1 - 4
select coalesce(REJECTION_REASON, 'SUCCESS') as table_value,--coalesce(REJECTION_REASON, 'SUCCESSFUL REGISTRATIONS') -- case when rejection_reason is null then 'SUCCESS' else REJECTION_REASON END
--,
sum(case when round(extract(month from create_date)::numeric) = 2 then 1 else 0 end )as feb,
sum(case when round(extract(month from create_date)::numeric) = 3 then 1 else 0 end )as mar,
sum(case when round(extract(month from create_date)::numeric) = 4 then 1 else 0 end )as apr,
count(1) total--, sum(case when rejection_reason is null then 1 else 0 end) as success
 from bfp_sync_log
-- where bfpsyncstatusenum = 'ERROR'
-- and rejection_reason is not null
group by 1
--union all 
--select coalesce(REJECTION_REASON, 'SUCCESSFUL REGISTRATIONS') -- case when rejection_reason is null then 'SUCCESS' else REJECTION_REASON END
--,
--round(extract(month from create_date)::numeric) month_, count(1)
-- from bfp_sync_log
-- where bfpsyncstatusenum = 'SUCCESS'
--group by 1,2
--order by 2
order by 5
 ;
 
 
 
-- 5
 select -- bsl.rejection_reason,
 bfl.rejection_reason quarantine_reason,bfpsyncstatusenum,
sum(case when round(extract(month from bsl.create_date)::numeric) = 2 then 1 else 0 end )as feb,
sum(case when round(extract(month from bsl.create_date)::numeric) = 3 then 1 else 0 end )as mar,
sum(case when round(extract(month from bsl.create_date)::numeric) = 4 then 1 else 0 end )as apr,
count(1) total --distinct(bfl.msisdn), bsl.msisdn, bsl.bfpsyncstatusenum, bfl.rejection_reason, bsl.rejection_reason
 from bfp_failure_log BFL , bfp_sync_log bsl 
 where bfl.unique_id = bsl.unique_id
 and bsl.bfpsyncstatusenum = 'ERROR'
 group by 1,2 
 order by 1 
 ;
 
 
-- 6
 select -- bsl.rejection_reason,
 bfl.rejection_reason quarantine_reason,bfpsyncstatusenum,
sum(case when round(extract(month from bsl.create_date)::numeric) = 2 then 1 else 0 end )as feb,
sum(case when round(extract(month from bsl.create_date)::numeric) = 3 then 1 else 0 end )as mar,
sum(case when round(extract(month from bsl.create_date)::numeric) = 4 then 1 else 0 end )as apr,
count(1) total --distinct(bfl.msisdn), bsl.msisdn, bsl.bfpsyncstatusenum, bfl.rejection_reason, bsl.rejection_reason
 from bfp_failure_log BFL , bfp_sync_log bsl 
 where bfl.unique_id = bsl.unique_id
 and bsl.bfpsyncstatusenum = 'SUCCESS'
 group by 1,2 
 order by 1 
 ;