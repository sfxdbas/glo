select distinct(sar.phone_number) msisdn, sar.enrollment_ref netbook_id,  sar.serial_number sim_serial, 
		( case
		when m.registration_network_status  = 'OFF' then 'OFFLINE'
		else 'ONLINE'
	end  ) as STATUS,SAR.registration_timestamp as REGISTRATION_DATE, bsl.activationstatusenum ACTSTATUS,
	sar.activation_timestamp activation_date, kd."name" dealer, s."name" state , ku.first_name agent ,
	round((extract(epoch from sar.activation_timestamp)::numeric - extract(epoch from sar.registration_timestamp)::numeric)/60,2) ACT_DATE_DIFF
from sms_activation_request sar, user_id u, state s, node n, node_assignment na,
	meta_data m, basic_data bd ,bfp_sync_log bsl, enrollment_ref er, kyc_dealer kd , km_user KU 
	--**index STAGING && PROD
where u.unique_id = sar.unique_id
and m.basic_data_fk = bd.id
and bd.user_id_fk = u.id
and sar.unique_id = bsl.unique_id
and sar.state_id = s.id
and sar.enrollment_ref = er.code
and er.id = n.enrollment_ref
and n.id = na.node_fk
and na.kyc_dealer_fk = kd.pk
and kd.pk = ku.dealer_fk
and left(ku.email_address, strpos(ku.email_address, '@') -1) = lower(er.code)
and bsl.bfpsyncstatusenum = 'SUCCESS'
and date(sar.registration_timestamp) >= ?
and date(sar.registration_timestamp) <= ?
and kd."name" like  ?
--and sar.enrollment_ref =  ?
and ku.first_name like ?
and s."name" like ?
--order by sar.enrollment_ref
;