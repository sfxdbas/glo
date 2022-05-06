select distinct lower(agent_email_address), max(create_date) lastsyncdate from bfp_sync_log bsl where lower(agent_email_address) in (
select
lower(ku.email_address)
--er."name",ku.email_address,ku.nin,DT.NAME as CHANNEL,DSS.setting_name 
from km_user ku 
--left join enrollment_ref er on upper(er."name") = upper(left(ku.email_address,11))
--left join node n on n.enrollment_ref = er.id 
--left join node_assignment na on na.node_fk = n.id 
--left join kyc_dealer kd on na.kyc_dealer_fk = kd.pk 
--left join dealer_type dt on kd.dealer_type_fk = dt.pk 
--left join device_specific_setting dss on dss.enrollment_ref_fk = er.id
where nin is null 
--and dss.setting_name = 'PILOT-AVAILABLE-USE-CASE'
--and ku.email_address ='glo-hh-974n@gloworld.ng'
) and date(create_date) > '2021-07-1'
group by 1 
;