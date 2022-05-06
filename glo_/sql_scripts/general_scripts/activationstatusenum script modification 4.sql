with t1 as (
select bsl.msisdn, bsl.sim_serial, bsl.create_date, bsl.msisdn_compliance_status status,BSL.activationstatusenum, msisdn_compliance_timestamp as dateofbarring
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
where /*sar.phone_number = bsl.msisdn 
and*/ (bsl.msisdn_compliance_status in ('BARRED','BAR_48','NCC_BAR') or bsl.activationstatusenum != 'ACTIVATED' )
AND bsl.bfpsyncstatusenum = 'SUCCESS'
and (bsl.reg_type like 'NM%' or bsl.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN','CAR'))
and date(bsl.create_da
and date(bsl.create_date) <= '2021-11-13'
and kd."name" like  'AREWA MULTI-LINKS ENTERPRISES'
) 
select * 
from t1 
where row_number = 1
;




