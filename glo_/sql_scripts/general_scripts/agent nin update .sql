-- treat this first 
update agent_nin_update_05052022b set operator_staff_phone_no = 0||operator_staff_phone_no where LENGTH(operator_staff_phone_no) <11 ; -- is not null ;

select distinct 
--'update km_user set nin = '||''''||du.operator_staff_nin ||''''||' where pk = '||ku.pk||' ;',
--'update km_user set first_name = '||''''||du.first_name ||''''||', surname = '||''''||du.surname ||''''||', nin = '||''''||du.nin ||''''||' where pk = '||ku.pk||' ;',
'update km_user set last_modified = now(), MOBILE = '||''''||DU.operator_staff_phone_no||''''||',  FIRST_NAME = '||''''||DU.first_namename_of_operator_staff||''''||', SURNAME = '||''''||DU.last_namesurname_of_operator_staff||''''||', nin = '||''''||du.operator_staff_nin ||''''||' where pk = '||ku.pk||' ;',
pk,/* du. , ku.first_name ,du.surname,ku.surname,*/ ku.email_address, DU.operator_staff_nin, ku.nin,LENGTH(DU.operator_staff_nin)
from agent_nin_update_05052022b du
   join km_user ku 
on upper(left(replace(ku.email_address, '.',''),11))  = upper(left(du.sim_reg_device_id ,11 ))
--on upper((ku.email_address ))  = upper(du.email_addressoperator_staff )
--on  upper(ku.user_id)=upper(du.user_id)
--on ku.first_name = du.device_tag 
--where ku.nin != du.nin 
--where ku.email_address in ('anasuniversallink@gmail.com','chidphone3g@yahoo.com')
--where ku.nin is null 
--order by ku.nin desc --du.device_tag desc -- desc 
--order by 3 
order by LENGTH(DU.operator_staff_nin)
;


select distinct sim_reg_device_id from agent_nin_update_05052022b A;

select pk,first_name,surname,email_address,mobile ,nin 
from km_user ku  where upper(left(ku.email_address ,11))in ('GLO-FH-432E') --- in (select upper(du.sim_reg_device_id ) from agent_nin_update_05052022b du);

select * 
from agent_nin_update_05052022b A
--order by length(device_tag) desc 
order by length(a.sim_reg_device_id) desc 
;


--REGION
--GEO-POL STATE
--SALES TERRITORY
--CHANNEL
--OPERATOR/PARTNER BIZ NAME
--OPERATOR/PARTNER TRADE CODE
--FIRST NAME (Name of Operator staff)
--LAST NAME (Surname of Operator staff)
--OPERATOR STAFF NIN
--OPERATOR STAFF PHONE NO
--EMAIL ADDRESS (Operator staff)
--OUTLET  LOCATION/DETAILED ADDRESS
--SIM REG DEVICE ID

--with DETAILS as (
select s.name as geopol_state,dt."name" as channel, kd.name as operator_name,kd.deal_code as operator_tradecode,
ku.first_name ,ku.surname , ku.nin,ku.mobile as phoneno,ku.email_address, kd.address,
case when upper(left(ku.email_address,11 )) not like 'GLO-%' then er.code else upper(left(ku.email_address,11 )) end 
simregdeviceid
-- er.code 
--ku.pk,email_address ,nin, dealer_fk,na.kyc_dealer_fk ,na.state_fk --,upper(left(ku.email_address,11 ))
from km_user ku 
left join node_assignment na on na.fsa_user_fk = ku.pk 
left join node n on n.id = na.node_fk 
left join enrollment_ref er on er.id = n.enrollment_ref 
left join state s on s.id = na.state_fk 
left join kyc_dealer kd on kd.pk = ku.dealer_fk 
left join dealer_type dt on dt.pk = kd.dealer_type_fk 
where ku.nin is not null 
--and er.code is null 
--and ku.email_address is null 
--)
--select geopol_state, channel,operator_name,operator_tradecode,
--first_name ,surname ,nin,phoneno,email_address, address,
--case when ER.CODE is null then upper(left(ku.email_address,11 )) else ER.CODE 
--ER.CODE,upper(left(ku.email_address,11 )) E_ID
--from DETAILS 
;
