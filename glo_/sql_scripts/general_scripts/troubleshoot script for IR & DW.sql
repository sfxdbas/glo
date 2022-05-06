with d_count as (
select bsl.msisdn_compliance_status ,bsl.msisdn,ku.email_address ,ku.dealer_fk,na.fsa_user_fk,na.kyc_dealer_fk, ku.create_date ,er."name" netbook_id, 
bsl.sim_serial sim_serial, 
		dd.DDA32 as STATUS,bsl.create_date as REGISTRATION_DATE, bsl.activationstatusenum ACTSTATUS,
	bsl.activation_date activation_date, kd."name" dealer,
	/* s."name" state ,*/ ku.first_name||' '||ku.surname agent ,--na.node_fk ,
	round((extract(epoch from bsl.activation_date)::numeric - extract(epoch from bd.bd_part_key)::numeric)/60,2) ACT_DATE_DIFF
--	,row_number
from bfp_sync_log bsl
join user_id u on u.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = u.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
join enrollment_ref er on bsl.enrollment_ref_fk = er.id 
join node n on n.enrollment_ref = er.id 
join sms_activation_request sar on sar.unique_id = bsl.unique_id 
join state s on s.id = sar.state_id 
left join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
left join node_assignment na on na.fsa_user_fk = ku.pk 
left join kyc_dealer kd on kd.pk = ku.dealer_fk 
where sar.phone_number = bsl.msisdn 
AND bsl.bfpsyncstatusenum = 'SUCCESS'
and BSL.activationstatusenum = 'ACTIVATED'
and (bsl.msisdn_compliance_status != 'BARRED' or BSL.msisdn_compliance_status is null)
and 
 	 DATE(BSL.CREATE_DATE)  = '2021-7-1' --and date(bsl.create_date) <= '2021-7-31'
 	 and ku.dealer_fk is not null 
--and  msisdn = '08071201797'
--and kd."name" like  'A2L COMMUNICATION'
--and er.name like  ?
--and s.name like ?
) 
select * --dealer, count(1) 
from d_count 
--group by 1
--order by 2 desc 
--where
;



