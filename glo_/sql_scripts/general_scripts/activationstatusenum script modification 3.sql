--select sum(dealerwise) dealerwise, sum(incentive) incentive, 
--	         sum(difference) difference from (
select * , dealerwise-incentive as difference
-- sum(dealerwise) dealerwise, sum(incentive) incentive, 
--	         sum(difference) difference 
from (
with diff as (
select kd."name" as dealer,date(bsl.create_date),msisdn_compliance_status,activationstatusenum /* count( msisdn) as dealerwise, 
sum( case when bsl.msisdn_compliance_status not in ('BARRED','BAR_48','NCC_BAR') or BSL.msisdn_compliance_status is null then 1 else 0 end) as incentive*/
	,row_number()over(partition by bsl.msisdn order by bsl.create_date desc )
from bfp_sync_log bsl
join user_id u on u.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = u.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
join enrollment_ref er on bsl.enrollment_ref_fk = er.id 
join node n on n.enrollment_ref = er.id 
join node_assignment na on na.node_fk = n.id
--join sms_activation_request sar on sar.unique_id = bsl.unique_id 
--join state s on s.id = sar.state_id 
left join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
--left  
 join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
where --sar.phone_number = bsl.msisdn 
--and (bsl.msisdn_compliance_status not in ('BARRED','BAR_48','NCC_BAR') or BSL.msisdn_compliance_status is null)
/*AND*/ bsl.bfpsyncstatusenum = 'SUCCESS'
--and (activationstatusenum is null or activationstatusenum = 'ACTIVATED')
and (bsl.reg_type like 'NM%' or bsl.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN','CAR'))
--and (bsl.reg_type like 'RR%' or reg_type in ('CR'))
and date(bsl.create_date) >= '2021-11-01'
and date(bsl.create_date) <= '2021-11-13'
and kd."name" like  'AREWA MULTI-LINKS ENTERPRISES'
--group by kd.name,date(bsl.create_date)
)
select dealer,date, count(1) as dealerwise, 
sum( case when (msisdn_compliance_status not in ('BARRED','BAR_48','NCC_BAR') or msisdn_compliance_status is null) and (activationstatusenum is null or activationstatusenum = 'ACTIVATED') then 1 else 0 end) as incentive
--* --, dealerwise-incentive as difference
from diff
where row_number = 1 
group by dealer,date
) A 
--) b