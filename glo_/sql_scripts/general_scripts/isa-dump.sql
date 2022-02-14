
create table isa_dump_02092021 as 
select hibernate_sequence.nextval as SEQUENCE_ID,er."name" as AGENTID,bsl.create_date as RECEIVEDDATE,BSL.sim_serial as SIM_SERIAL_NUMBER,
BSL.msisdn as MSISDN,er.date_installed as ENROLLDATE,s."name" as LOCATIONSTATE,
case when dda9 ~ '^[0-9.]+$' then null else dda9 end as LOCATIONLGA,null as REGISTRATIONCENTER,BSL.reg_type as REGISTRATIONTYPE,
BD.surname as SURNAME,BD.firstname as FIRSTNAME,BD.othername as MIDDLENAME,to_char(BD.birthday,'YYYY-MM-DD') as DATEOFBIRTH,
BD.gender as GENDER,DDA12 as MOTHERMAIDENNAME,replace(da3, ',',' ') as RESIDENTIALADDRESS,
replace(DDA6, ',',' ') as RESIDENTIALLGA,DDA5 as RESIDENTIALSTATE,
DDA7 as RESIDENTIALPOSTALCODE,DDA19 as NATIONALITY,DA8 as STATEOFORIGIN,DA2 as OCCUPATION,null as RESIDENT,
pd.issue_country as ISSUINGCOUNTRY,pd.passport_number as PASSPORTNUMBER,pd.expiry_date as EXPIRYDATE,
DA10 as SECONDARYNUMBER1,null as SECONDARYNUMBER2,null as SUBSCRIBERTYPE,DDA8 as COMPANYNAME,DDA14 as COMPANYREGNUMBER,
replace(DDA15, ',',' ') as COMPANYADDRESS,DDA17 as COMPANYADDRESSLGA,DDA16 as COMPANYADDRESSSTATE,DDA18 as COMPANYADDRESSPOSTALCODE,
DA9 as LGAORIGIN,null as MONTHLYINCOMEBAND,null as EDUCATION,null as FAMILYSIZE,null as HOBBIES,null as FOOTBALLLEAGUE
from bfp_sync_log bsl
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on ui.id = bd.user_id_fk 
join dynamic_data dd on bd.id = dd.basic_data_fk 
join state s on s.id = bd.state_of_registration_fk 
left join signature on bd.id = signature.basic_data_fk 
left join passport_detail pd on signature.id = pd.signature_fk 
where bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn ~ '^[0-9.]+$' 
and date(bsl.create_date) <= '2021-09-02'
;