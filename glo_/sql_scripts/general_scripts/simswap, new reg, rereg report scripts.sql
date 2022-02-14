-- SN
-- Channel
-- Dealer
-- Date
-- Agent Email
-- User ID
-- Device ID
-- MSISDN
-- Sim Serial
-- Subscriber Type
-- Target MSISDN
-- Target Sim Serial
-- Swap Status




CReate birt report for all sim swap request using state and end date, category and swap status as search parameters --

sELECT dt.name as channel, kd.name as dealer, s.create_date as date,s.agent_email,
checker_user_id as user_id, s.device_id,msisdn,s.sim_serial,s.subscriber_type, s.target_msisdn,
s.target_sim_serial,s.swap_status
from sim_swap_demographic s
left join enrollment_ref er on s.device_id = er.device_id
left join node n on n.enrollment_ref = er.id 
left join node_assignment na on na.node_fk = n.id 
left join state st on st.id = na.state_fk
left join kyc_dealer kd on kd.pk = na.kyc_dealer_fk
left join dealer_type dt on dt.pk = kd.dealer_type_fk
--left join km_user ku on ku.email_address = s.agent_email
where  date(s.create_date) between ? and ?
and dt."name" like ?
and s.swap_status like ?
;


CReate birt report for all new registration using state and end date, category and msisdn as search parameters

SELECT dt.name as channel, kd.name as dealer,b.create_date as date,
b.agent_email_address as agent_email,ku.user_id,b.device_id,b.msisdn,
b.sim_serial
from bfp_sync_log b
 left join km_user ku on ku.email_address = b.agent_email_address
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
 left join kyc_dealer kd on kd.pk = na.kyc_dealer_fk
 left join dealer_type dt on dt.pk = kd.dealer_type_fk
where --BFPSYNCSTATUSENUM = 'SUCCESS'
 date(b.create_date) between '2021-05-05' and '2021-05-05' -- between ? and ?
and (dt."name" is null or dt."name" like '%%' /*?*/) 
and (b.msisdn is null or b.msisdn like '%%'/*?*/)  
and reg_type like 'NM%'
;

CReate birt report for all re-registration using state and end date, category and msisdn as search parameters


SELECT dt.name as channel, kd.name as dealer,b.create_date as date,
b.agent_email_address as agent_email,ku.user_id,b.device_id,b.msisdn,
b.sim_serial
from bfp_sync_log b
 left join km_user ku on ku.email_address = b.agent_email_address
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
 left join kyc_dealer kd on kd.pk = na.kyc_dealer_fk
 left join dealer_type dt on dt.pk = kd.dealer_type_fk
where --BFPSYNCSTATUSENUM = 'SUCCESS'
 date(b.create_date) between '2021-05-05' and '2021-05-05' -- between ? and ?
and (dt."name" is null or dt."name" like '%%' /*?*/) 
and (b.msisdn is null or b.msisdn like '%%'/*?*/)  
and reg_type like 'RR%'
;