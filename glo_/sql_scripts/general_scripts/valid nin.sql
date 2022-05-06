with validnin as (
select bsl.create_date,activationstatusenum ,BSL.reg_type,dd.dda11,DD.DDA34 nin, dda23,msisdn,bsl.unique_id ,
/*LOREAD(LO_OPEN(PASSPORT_DATA, 262144),1000000),*/
DD.ID ddId,DDA8 companyName,DD.DDA36 ninStatus,bd.id bdId, bd.birthday ,
 bd.firstname,bd.surname,dda9 regLga,DDA19 countryOfOrigin,da8 stateOfOrigin,DA36 nationality, DDA19 countryoforigin
,row_number () over (partition by BSL.msisdn order by create_date desc )
from bfp_sync_log bsl , basic_data bd, user_id ui , dynamic_data dd --,PASSPORT 
where bsl.unique_id = ui.unique_id 
and bd.user_id_fk = ui.id 
and bd.id = dd.basic_data_fk 
--and PASSPORT.basic_data_fk = BD.ID 
and bfpsyncstatusenum ='SUCCESS'
--and activationstatusenum = 'ACTIVATED'
--and dda36 = 'Valid'
--and dda34 = '91790923100' 
--and bsl.msisdn in ('09154625924')
and DD.ID in (488615486,489552135)
--and bd.id = 855155185
--and bsl.unique_id in ('GLO-DH-KWA-ILO-GWILLORIN-382W-1645111880741',  'GLO-DH-KWA-ILO-GWILLORIN-382W-1645111131762')
--and bsl.msisdn in ( '09051812870','09053322403')
--and dd.dda36 = 'NIN_VERIFIED'
--and DATE(BSL.create_date)=DATE(NOW)-1
) 
select *-- msisdn, f_name, l_name, nin, reg_date
from validnin
--where row_number =1
--group by 1 
--order by 2 desc 
;

--dd_id =2921791336 with the nin=42820017182



select ID,DDA34,dda11,dda36,dda23 from dynamic_data dd 
where ID in (533594758) 
;


select transaction_id ,* from nimc_verification_log nvl where nin = '42820017182' order by create_date desc ;