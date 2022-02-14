-- new reg
SELECT COUNT(1)
from bfp_sync_log 
where BFPSYNCSTATUSENUM = 'SUCCESS'
AND date(create_date) = date(now)-1 
and reg_type like 'NM%'
;

-- new reg breakdown
SELECT msisdn,b.device_id,ku.user_id,er.code as kit_tag,
s.name as state_of_deployment, bfpsyncstatusenum as status, 
case when rejection_reason is null and activationstatusenum is not null
then activationstatusenum
when rejection_reason is null and activationstatusenum is null
then 'PENDING ACTIVATION'
else rejection_reason end as remark
from bfp_sync_log b
 left join km_user ku on ku.email_address = b.agent_email_address
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
where --BFPSYNCSTATUSENUM = 'SUCCESS'
 date(b.create_date) = date(now)-1 
and reg_type like 'NM%'
;


-- re reg
SELECT COUNT(1)
from bfp_sync_log 
where BFPSYNCSTATUSENUM = 'SUCCESS'
AND date(create_date) = date(now)-1 
and reg_type like 'RR%'
;

--rereg list
SELECT msisdn,b.device_id,ku.user_id,er.code as kit_tag,
s.name as state_of_deployment, bfpsyncstatusenum as status, 
case when rejection_reason is null and activationstatusenum is not null
then activationstatusenum
when rejection_reason is null and activationstatusenum is null
then 'PENDING ACTIVATION'
else rejection_reason end as remark
from bfp_sync_log b
 left join km_user ku on ku.email_address = b.agent_email_address
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
where --BFPSYNCSTATUSENUM = 'SUCCESS'
 date(b.create_date) = date(now)-1 
and reg_type like 'RR%'

-- sim swap
SELECT COUNT(1)
from sim_swap_demographic 
where swap_status = 'SWAPPED'
AND date(create_date) = date(now)-1 
;


--sim swap list
-- sim swap
SELECT msisdn, s.device_id, checker_user_id as user_id, device_tag as kit_tag,
st.name as state_of_deployment, 
swap_status as status, 
approval_feedback as remark
from sim_swap_demographic s
left join enrollment_ref er on s.device_id = er.device_id
left join node n on n.enrollment_ref = er.id 
left join node_assignment na on na.node_fk = n.id 
left join state st on st.id = na.state_fk
where  date(s.create_date) = date(now)-1 
--  swap_status != 'SWAPPED'
;


-- activation
SELECT COUNT(1)
from bfp_sync_log 
where BFPSYNCSTATUSENUM = 'SUCCESS'
AND ACTIVATIONSTATUSENUM = 'ACTIVATED'
AND date(create_date) = date(now)-1 
;


-- quarantined
SELECT COUNT(1)
from bfp_sync_log 
where BFPSYNCSTATUSENUM = 'ERROR'
AND date(create_date) = date(now)-1 
;