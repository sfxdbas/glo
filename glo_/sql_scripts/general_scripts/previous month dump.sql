select * 
from tm_basic_data tbd 
;

select * from basic_data bd where user_id_fk = 2851053419;

select bsl.msisdn , dd.dda34, bsl.unique_id , bsl.create_date,md.device_type , md.app_version, mdo.user_category, dd.dda58
,bsl.reg_type, dd.id 
from bfp_sync_log bsl, dynamic_data dd, basic_data bd, user_id ui, meta_data md, msisdn_detail mdo
where bsl.unique_id = 'GLO-HH-LAG-SHL-GWLAFAD-481T-1630068722900'
and bsl.unique_id = ui.unique_id 
and dd.basic_data_fk = bd.id 
and bd.user_id_fk = ui.id 
and md.basic_data_fk = bd.id 
and mdo.basic_data_fk = bd.id
;

select dda58 from dynamic_data dd where dda11 in ('CR') and ID = 2851053421;


select *  
from bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
--and (bsl.activationstatusenum = 'ACTIVATED')
and date(bsl.create_date) between '2021-08-01' and '2021-08-29'
--and deleted is true
;

select bsl.msisdn MSISDN,dd.dda34 NIN,tdd.dda34 TM_NIN,
case when tdd.dda34 is null then bd.firstname else tbd.firstname end as F_NAME,
case when tdd.dda34 is null then bd.surname else tbd.surname end as L_NAME,
case when tdd.dda34 is null then dd.DDA12 else tdd.dda12 end as M_MAID_NAME,
to_char(bd.birthday, 'yyyy-mm-dd') DOB,bd.gender GENDER,dd.DA8 STATE_OF_ORIGIN,bsl.create_date REG_DATE_REG_TIME,
case when bsl.activation_date is null then bsl.create_date else bsl.activation_date end as ACTV_DATE,bsl.REG_TYPE,
md.state_of_registration REG_STATE, er.name DEVICE_ID,ku.nin AGENT_NIN,ku.first_name AGENT_F_NAME,
ku.surname AGENT_L_NAME,kd."name" DEALER_NAME
from bfp_sync_log bsl 
 join user_id ui on ui.unique_id = bsl.unique_id 
 join basic_data bd on bd.user_id_fk = ui.id 
 join dynamic_data dd on dd.basic_data_fk = bd.id  
 join meta_data md on md.basic_data_fk = bd.id 
-- join msisdn_detail md2 on md2.basic_data_fk = bd.id 
left join tm_basic_data tbd on tbd.basic_data_fk = bd.id 
left join tm_dynamic_data tdd on tdd.tm_basic_data_fk = tbd.pk 
  join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
  join node n on n.enrollment_ref = er.id 
  join node_assignment na on na.node_fk = n.id 
  join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
 left  join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
 where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.activationstatusenum = 'ACTIVATED'
and date(bsl.create_date) between '2021-08-01' and '2021-08-29'
--and dd.dda12 not like '%SEAMFIX%'
--and bsl.msisdn = md2.msisdn 
--and bsl.msisdn in ('09159431255','09055493102')
;