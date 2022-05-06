--SELECT msisdn, nin, tm_nin, f_name, l_name, m_maid_name, dob, gender, state_of_origin, reg_date, reg_time, actv_date, reg_type, reg_state, 
--device_id, agent_nin, agent_f_name, agent_l_name, dealer_name, nin_verification_status, create_date, msisdn_compliance_status, 
--activationstatusenum, "row_number"
--FROM public.finalpush_extract_inceptiontilljuly31st_19092021
--where nin is not null 
;

--select nin_verification_status ,count(1) from (
select 
msisdn, nin, tm_nin, f_name, l_name, m_maid_name, dob, gender, state_of_origin, reg_date, reg_time, actv_date, reg_type, reg_state, 
device_id, agent_nin, agent_f_name, agent_l_name, dealer_name, 
case when nin_verification_status is null and  nin != '' then 'NIN UNVERIFIED'
	 when nin_verification_status in ('NIN_VERIFICATION_ERROR','Invalid','Missing fingerprint','Error','BIOMETRIC_VERIFIED') then 'NIN VERIFICATION ERROR'
	 when nin_verification_status in ('NIN Unverified', 'NIN Pending','NIN_UNVERIFIED') then 'NIN UNVERIFIED'
	 when nin_verification_status in ('NIN_VERIFIED', 'Valid') then 'NIN VERIFIED'
else nin_verification_status end as nin_verification_status 
from finalpush_extract_inceptiontilljuly31st_19092021 feis 
--) a group by 1 order by 2 desc 
;



--create table extract_inceptiontilljuly31st_28092021 as 
SELECT a.msisdn, nin, tm_nin, f_name, l_name, m_maid_name, dob, gender, state_of_origin, reg_date, reg_time, actv_date, reg_type, reg_state, 
case when a.device_id = 'MIGRATION_TAG' then b.device_id else a.device_id end as device_id, agent_nin, agent_f_name, agent_l_name,
dealer_name, 
case when nin_verification_status is null and  nin != '' then 'NIN UNVERIFIED'
	 when nin_verification_status in ('NIN_VERIFICATION_ERROR','Invalid','Missing fingerprint','Error','BIOMETRIC_VERIFIED') then 'NIN VERIFICATION ERROR'
	 when nin_verification_status in ('NIN Unverified', 'NIN Pending','NIN_UNVERIFIED') then 'NIN UNVERIFIED'
	 when nin_verification_status in ('NIN_VERIFIED', 'Valid') then 'NIN VERIFIED'
else nin_verification_status end as nin_verification_status,
, create_date, msisdn_compliance_status, activationstatusenum, "row_number"
FROM public.finalpush_extract_inceptiontilljuly31st_19092021 A
left join extractfromld_21092021 B on a.msisdn = b.msisdn 
--where a.msisdn in ('09053432068')
;


select * from exclude_num_ncc_bar_28092021;

select msisdn, nin, tm_nin, f_name, l_name, m_maid_name, dob, gender, state_of_origin, reg_date, reg_time, actv_date, reg_type, reg_state,
device_id, agent_nin, agent_f_name, agent_l_name, dealer_name, nin_verification_status 
from extract_inceptiontilljuly31st_28092021 eis 
where not exists 
(select 1 from exclude_num_ncc_bar_28092021 em where eis.msisdn=em.msisdn)
and not exists 
(select 1 
from extract_inceptiontilljuly31st_28092021 es 
where agent_nin is  null 
and date(create_date)>'2020-12-31' 
and es.msisdn=eis.msisdn)
--order by 1 
;