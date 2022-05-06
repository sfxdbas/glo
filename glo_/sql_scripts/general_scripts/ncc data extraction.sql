--create table ncc_extract_11042022 as 
-- new latest 
select MSISDN, NIN, TM_NIN, F_NAME, L_NAME,M_MAID_NAME, DOB,GENDER, STATE_OF_ORIGIN, REG_DATE, REG_TIME, ACTV_DATE,
reg_type ,REG_STATE, DEVICE_ID,AGENT_NIN, AGENT_F_NAME, AGENT_L_NAME, DEALER_NAME --,NIN_VERIFICATION_STATUS
from (
select activationstatusenum, bsl.msisdn MSISDN,/*dd.dda34 NIN,*/ 
case when md2.user_category = 'CHILD' and bsl.REG_TYPE in ('NMSC','ARC','CN','CAR') then md2.nin 
 	 when md2.user_category = 'SECONDARY_TM' and bsl.REG_TYPE in ('NMSC','ARC','CN','CAR') then tdd.dda34 
else dd.dda34 end as NIN,
--case when bsl.REG_TYPE in ('NMSC','ARC','CN','ARI','MPI','VNI') then dd.dda34 else dd.dda34 end as nin,
case when bd.user_category ='SECONDARY_TM' then dd.dda34 
	 when bd.user_category ='PRIMARY_TM' then dd.dda34
	 when bsl.REG_TYPE in ('NMSC','ARC','CN','CAR') THEN dd.dda34
else null  end as  TM_NIN,
/*tdd.dda34 as tm_nin,*/
replace(bd.firstname, ',',' ')  F_NAME,
replace(bd.surname , ',',' ')  L_NAME,
replace(dd.dda12 , ',',' ') M_MAID_NAME,
to_char(bd.birthday, 'dd/mm/yy') DOB,bd.gender GENDER,dd.DA8 STATE_OF_ORIGIN,
To_char(bsl.create_date, 'dd/mm/yyyy') REG_DATE,To_char(bsl.create_date, 'hh24/mi/ss') REG_TIME,
case when To_char(bsl.activation_date, 'dd/mm/yyyy') is null then To_char(bsl.create_date, 'dd/mm/yyyy') else To_char(bsl.create_date, 'dd/mm/yyyy') end as ACTV_DATE,
case when bsl.REG_TYPE in ('MPI','New','NMI','VNI','NMSI','Add SIM','ARI','Add','NMS','-------------') and upper(dd.dda19) in ('', 'NIGERIA') then 'Individual'
	 when bsl.REG_TYPE in ('MPI','New','NMI','VNI','NMSI','Add SIM','ARI','Add','NMS','-------------') and upper(dd.dda19) not in ('', 'NIGERIA') then 'Foreigner'
--	 when bsl.REG_TYPE in ('NMSC','ARC','CN') and upper(dd.dda19) in ('', 'NIGERIA') and (upper(md2.corporate_category) = 'CORPORATE' or upper(md2.corporate_category) is null or md2.nin is not null) then 'Corporate'
	 when bsl.REG_TYPE in ('NMSC','ARC') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is null then 'Corporate'  	
	 when bsl.REG_TYPE in ('NMSC','ARC') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is not null then md2.corporate_category  
--	 when bsl.REG_TYPE in ('NMSC','ARC','CN') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is null then (dd.dda58)  
	 when bsl.REG_TYPE in ('CN','CAR') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is not null then (md2.corporate_category)
	 when bsl.REG_TYPE in ('CN','CAR') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is null then (dd.dda58)
	 when md2.user_category = 'SECONDARY_TM' and bd.user_category != 'SECONDARY_TM' then tdd.dda58 
--	 when bsl.REG_TYPE in ('NMSC','ARC','CN') and upper(dd.dda19) in ('', 'NIGERIA') and (upper(md2.corporate_category) = 'IOT' or upper(md2.corporate_category) is null or md2.nin is null) then 'IOT'
	 when bsl.REG_TYPE in ('NMSC','ARC','CN','CAR') and upper(dd.dda19) not in ('', 'NIGERIA') then 'Corporate'	
else bsl.reg_type end as reg_type,
md.state_of_registration REG_STATE, er.name DEVICE_ID,ku.nin AGENT_NIN,ku.first_name AGENT_F_NAME,
ku.surname AGENT_L_NAME,kd."name" DEALER_NAME,DD.DDA36 NIN_VERIFICATION_STATUS
,row_number() over (partition by BSL.msisdn order by BSL.create_date desc )
from bfp_sync_log bsl 
 join user_id ui on ui.unique_id = bsl.unique_id 
 join basic_data bd on bd.user_id_fk = ui.id 
 join dynamic_data dd on dd.basic_data_fk = bd.id  
 join meta_data md on md.basic_data_fk = bd.id 
 join msisdn_detail md2 on md2.basic_data_fk = bd.id 
left join tm_basic_data tbd on tbd.basic_data_fk = bd.id 
left join tm_dynamic_data tdd on tdd.tm_basic_data_fk = tbd.pk 
  join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
  join node n on n.enrollment_ref = er.id 
  join node_assignment na on na.node_fk = n.id 
  join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
 left  join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
 where bsl.bfpsyncstatusenum = 'SUCCESS'
 and bsl.msisdn = md2.msisdn 
and date(bsl.create_date) between '2022-03-01' and '2022-03-31'
and (bsl.reg_type like 'NM%' or bsl.reg_type like 'AR%' or bsl.reg_type in ('MPI','VNI','CN','CAR'))
and ( bsl.msisdn_compliance_status not in ('BARRED','BAR_48','NCC_BAR') or BSL.msisdn_compliance_status is null )
--and BSL.msisdn ='09152491501'
and ku.email_address not like '%seam%'
) a where row_number = 1 
and activationstatusenum = 'ACTIVATED'
--and AGENT_NIN is null 
order by tm_nin,nin
;

select * 
from ncc_extract_11042022
--where agent_nin is null 
--where (nin is null or nin = '')
--and upper(reg_type) != 'FOREIGNER'
;