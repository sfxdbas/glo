select * from (
select '234'||right(bsl.msisdn,10) MSISDN,to_char(bsl.create_date, 'yyyymmddhh24miss') registration_date,
to_char(bsl.create_date, 'yyyymmddhh24miss') simreg_processing_date,
case when upper(bd.gender) = 'FEMALE' then 'F' else 'M' end GENDER,to_char(bd.birthday , 'yyyymmdd') date_of_birth,
case when upper(dd.dda19) in ('', 'NIGERIA') then 'NIGERIA' else upper(dd.dda19) end nationality,
case when dd.DDA9 ~ '^[0-9.]+$' then s."name" else dd.dda9 end locationlga,s."name" locationstate,
dd.DDA6 residentiallga, dd.DDA5 residentialstate, dd.DDA7 residentialpostalcode,dd.DA8 STATEOFORIGIN,
case when bsl.REG_TYPE in ('MPI','New','NMI','VNI','NMSI','Add SIM','ARI','Add','NMS','-------------','RRI') and upper(dd.dda19) in ('', 'NIGERIA') then 'Individual'
	 when bsl.REG_TYPE in ('MPI','New','NMI','VNI','NMSI','Add SIM','ARI','Add','NMS','-------------','RRI') and upper(dd.dda19) not in ('', 'NIGERIA') then 'Individual'
	 when bsl.REG_TYPE in ('NMSC','ARC','RRC') and upper(dd.dda19) in ('', 'NIGERIA') then 'CORPORATE'  	
	 when bsl.REG_TYPE in ('CN','CR') and upper(dd.dda19) in ('', 'NIGERIA') and md2.CORPORATE_category is not null then (md2.CORPORATE_category)
	 when bsl.REG_TYPE in ('CN','CR') and upper(dd.dda19) in ('', 'NIGERIA') and md2.CORPORATE_category is null then (dd.dda58)
	 when md2.user_category = 'SECONDARY_TM' and bd.user_category != 'SECONDARY_TM' then tdd.dda58 
	 when bsl.REG_TYPE in ('NMSC','ARC','CN','RRC') and upper(dd.dda19) not in ('', 'NIGERIA') then 'CORPORATE'	
else bsl.reg_type end subscribertype,dd.DDA17 CompanyAddressLGA,dd.DDA16 CompanyAddressState,dd.DDA18 CompanyAddressPostalcode,
mps.imsi,bsl.sim_serial simserial,
case 
	when bsl.msisdn_compliance_status in ('BARRED','BAR_48') then 'BAR_48'
	when (bsl.msisdn_compliance_status not in ('BARRED','BAR_48') or BSL.msisdn_compliance_status is null) then 'ACTIVE'
else BSL.msisdn_compliance_status end STATUS,replace(bd.firstname, ',',' ') FirstNAME,replace(bd.othername, ',',' ') middlename
,replace(bd.surname , ',',' ')  surname,ku.first_name||' '||ku.surname AGENTNAME
,row_number() over (partition by BSL.msisdn order by BSL.create_date desc )
from bfp_sync_log bsl 
 join user_id ui on ui.unique_id = bsl.unique_id 
 join basic_data bd on bd.user_id_fk = ui.id 
 join dynamic_data dd on dd.basic_data_fk = bd.id  
 join meta_data md on md.basic_data_fk = bd.id 
 join msisdn_detail md2 on md2.basic_data_fk = bd.id 
 join state s on s.id = bd.state_of_registration_fk 
 left join tm_basic_data tbd on tbd.basic_data_fk = bd.id 
left join tm_dynamic_data tdd on tdd.tm_basic_data_fk = tbd.pk 
left join msisdn_provision_status mps on bsl.msisdn = mps.msisdn 
  join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
  join node n on n.enrollment_ref = er.id 
  join node_assignment na on na.node_fk = n.id 
  join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
 left  join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
 where bsl.bfpsyncstatusenum = 'SUCCESS'
 and bsl.msisdn = md2.msisdn 
-- and bsl.msisdn in ('07055665136','09157754397','08072484269','09154392750','09058594208','09154190000','09055492840','08079309931','08077840567')
and date(bsl.create_date) = date(now)-1
) a where row_number = 1 --group by 1 order by 2 desc 
;