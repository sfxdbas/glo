create table inception_to_july31_v3_26082021 as 
select  bsl.msisdn MSISDN,dd.dda34 NIN,/*TM_NIN,*/ bd.firstname F_NAME, bd.surname L_NAME,dd.DDA12 M_MAID_NAME,
to_char(bd.birthday, 'yyyy-mm-dd') DOB,bd.gender GENDER,dd.DA8 STATE_OF_ORIGIN,bsl.create_date REG_DATE_REG_TIME,
case when bsl.activation_date is null then bsl.create_date else bsl.activation_date end as ACTV_DATE,bsl.REG_TYPE,
md.state_of_registration REG_STATE, er.name DEVICE_ID,ku.nin AGENT_NIN,ku.first_name AGENT_F_NAME,
ku.surname AGENT_L_NAME,kd."name" DEALER_NAME
from bfp_sync_log bsl 
 join user_id ui on ui.unique_id = bsl.unique_id 
 join basic_data bd on bd.user_id_fk = ui.id 
 join dynamic_data dd on dd.basic_data_fk = bd.id  
 join meta_data md on md.basic_data_fk = bd.id 
  join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
left  join node n on n.enrollment_ref = er.id 
 left join node_assignment na on na.node_fk = n.id 
 left join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
 left join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
where bsl.bfpsyncstatusenum = 'SUCCESS'
and BSL.msisdn ~ '^[0-9.]+$' 
and DATE(BSL.create_date) <= '2021-07-31'
and exists (
select  1
from msisdn_provision_status mps 
where MPS.msisdn = BSL.msisdn 
and MPS.sim_serial = BSL.sim_serial
and STATUS IN ('ACTIVE','Active')
)
-- and bsl.msisdn in ('09153042034', '08055573677')
;