--For Partner
--Dealer Name,Dealer Code,Address,Partner First Name,Partner Surname,Partner NIN,Partner Phone,Partner Email,REGION,GLO STATE,Channel

select  kd."name" as dealername,kd.deal_code as dealercode,kd.address,ku.first_name, ku.surname,ku.nin,kd.mobile_number,kd.email_address
--,r."name" as region, s."name" as state
, dt."name" as channel
from kyc_dealer kd , km_user ku, dealer_type dt  
where kd.email_address = ku.email_address 
--and kd.pk = na.kyc_dealer_fk 
--and na.state_fk = s.id 
--and s.region_fk = r.id 
and dt.pk = kd.dealer_type_fk 
and ku.nin is not null 
;

--For Agent
--REGION,GEO-POL STATE,SALES TERRITORY,CHANNEL,OPERATOR/PARTNER BIZ NAME,OPERATOR/PARTNER TRADE CODE,FIRST NAME,LAST NAME,
--OPERATOR STAFF NIN,OPERATOR STAFF PHONE NO,EMAIL ADDRESS,OUTLET  LOCATION/DETAILED ADDRESS,
--SIM REG DEVICE ID

select er.name as simregdeviceid, s."name" as state,dt."name" as channel, kd."name" as dealer, kd.deal_code as dealercode,
ku.first_name ,ku.surname,ku.nin,ku.mobile as phonenumber,ku.email_address,kd.address 
from km_user ku
 join enrollment_ref er on er."name" = upper(left(ku.email_address, 11))
left join node n on er.id = n.enrollment_ref 
left join node_assignment na on n.id = na.node_fk 
left join state s on s.id = na.state_fk 
left join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
left join dealer_type dt on dt.pk = kd.dealer_type_fk 
where 
ku.nin is not null 
;