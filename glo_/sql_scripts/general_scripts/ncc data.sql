select * 
from extract_dump_previous_month edpm ;

select * 
from extract_dump_previous_month edpm
WHERE  reg_type not in ( 'RRI' ,'RRC', 'CR')
;
select distinct msisdn 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and date(create_date) between '2021-08-01' and '2021-08-31'
and reg_type not in ( 'RRI' ,'RRC', 'CR')
and activationstatusenum = 'ACTIVATED'
and msisdn not in 
('08055388168',
'08055388177',
'08055388185',
'08055388187',
'08055570798',
'08055571132',
'08055573613',
'08055573677',
'08055578784',
'08055578786',
'08075000000',
'08116575665',
'08116575666',
'08116575667',
'08116575671',
'08116575689',
'08117696458',
'08152093032',
'08152093051',
'08152199845',
'08152280788',
'08152280798',
'08152280813',
'08152395315',
'08152395319',
'08152395334',
'08152395605',
'08152395644',
'08152395730',
'08152395767',
'08152395821',
'08152395828',
'08152478732',
'08152478907',
'08152479083',
'08152479164',
'08152479199',
'08159434191',
'08159434882',
'08159435663',
'08159436228',
'08159437637',
'08159437669',
'08159437736',
'08159450615',
'08159450795',
'08159450882',
'08159450939',
'08159452612',
'08159452625',
'08159452859',
'08159453822',
'08159454230',
'08159455654',
'08159456954',
'08159459001',
'08159459036',
'09053236742',
'09053245033',
'09053253491',
'09053285873',
'09053959903',
'09153080120',
'09153080121',
'09153080122',
'09153080123',
'09153080124',
'09153080125',
'09153080126',
'09153080127',
'09153080128',
'09153080129',
'09153080130',
'09152705697',
'08110744684',
'08110744716',
'08110744845',
'08110744736',
'08110744726',
'08110744849',
'08110744717',
'08110744771',
'08110744839',
'08110744697',
'08110744750',
'08110744793',
'08110744883',
'08110744731',
'09152705688',
'09152705699',
'09152705687',
'09152705685',
'09152705684',
'09152705682',
'09152705694',
'09152705689',
'08156957663',
'08153288783',
'09050097797',
'09153072891',
'09157829390')
;

select  dda58 from dynamic_data dd  where basic_data_fk =2852293680;


select * from msisdn_detail md where user_category ='CHILD' and basic_data_fk =2852293680;

--create table extract_aug_16092021E as 
select  bsl.msisdn MSISDN,/*dd.dda34 NIN,*/ 
case when md2.user_category = 'CHILD' and bsl.REG_TYPE in ('NMSC','ARC','CN') then md2.nin 
 	 when md2.user_category = 'SECONDARY_TM' and bsl.REG_TYPE in ('NMSC','ARC','CN') then tdd.dda34 
else dd.dda34 end as NIN,
--case when bsl.REG_TYPE in ('NMSC','ARC','CN','ARI','MPI','VNI') then dd.dda34 else dd.dda34 end as nin,
case when bd.user_category ='SECONDARY_TM' then dd.dda34 
	 when bd.user_category ='PRIMARY_TM' then dd.dda34
	 when bsl.REG_TYPE in ('NMSC','ARC','CN') THEN dd.dda34
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
	 when bsl.REG_TYPE in ('NMSC','ARC') and upper(dd.dda19) in ('', 'NIGERIA') then 'Corporate'  	
--	 when bsl.REG_TYPE in ('NMSC','ARC','CN') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is null then (dd.dda58)  
	 when bsl.REG_TYPE in ('CN') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is not null then (md2.corporate_category)
	 when bsl.REG_TYPE in ('CN') and upper(dd.dda19) in ('', 'NIGERIA') and md2.corporate_category is null then (dd.dda58)
	 when md2.user_category = 'SECONDARY_TM' and bd.user_category != 'SECONDARY_TM' then tdd.dda58 
--	 when bsl.REG_TYPE in ('NMSC','ARC','CN') and upper(dd.dda19) in ('', 'NIGERIA') and (upper(md2.corporate_category) = 'IOT' or upper(md2.corporate_category) is null or md2.nin is null) then 'IOT'
	 when bsl.REG_TYPE in ('NMSC','ARC','CN') and upper(dd.dda19) not in ('', 'NIGERIA') then 'Corporate'	
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
left  Join node n on n.enrollment_ref = er.id 
 left  join node_assignment na on na.node_fk = n.id 
left   join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
 left  join km_user ku on lower(ku.email_address) = lower(bsl.agent_email_address)
 where bsl.bfpsyncstatusenum = 'SUCCESS'
--and bsl.activationstatusenum = 'ACTIVATED'
and date(bsl.create_date) <= '2021-07-31'
--and (bsl.reg_type like 'NM%' or bsl.reg_type like 'AR%' or bsl.reg_type in ('MPI','VNI','CN'))
and bsl.reg_type not in ('RRI','RRC','CR')
-- and dd.dda12 not like '%SEAMFIX%'
 and bsl.msisdn = md2.msisdn 
-- and bsl.msisdn in ('09159431255','09055493102'
--,'08159412548','9159793653','09150290501','09152153133','08152395767')
and ( bsl.msisdn_compliance_status not in ('BARRED','BAR_48') or BSL.msisdn_compliance_status is null )
--and bd.id =2852293680
--and bsl.msisdn ='08159412548'
;

select *  
from bfp_sync_log bsl 
where reg_type ='-------------'
--where date(create_date) < '2021-01-01'
--and reg_type not like 'NMSI';

select * from USER_ID where unique_id ='56557137'