update dealer_nin_update_31012022 set partner_phone=0||partner_phone where length(partner_phone )<11;

select distinct kd.pk, kd.km_user_pk, ku.pk,ku.dealer_fk ,d.partner_nin , ku.nin,
--'update kyc_dealer set mobile_number = '||''''||d.ph ||''''||' where pk = '||kd.pk||';',
--'update km_user set mobile_number = '||''''||d.partner_phone ||''''||' where pk = '||ku.pk||';',
--'update km_user set nin = '||''''||d.partner_nin ||''''||' where pk = '||ku.pk||';',
'update km_user set  nin = '||''''||d.partner_nin||''''||' where pk = '||ku.pk||' ;',
ku.nin,d.partner_nin, kd.deal_code, d.trade_code , kd."name", /*d.partner_name  , */kd.email_address, 
kd.mobile_number , ku.first_name, ku.surname, ku.email_address, 
ku.mobile
from dealer_nin_update_31012022 d
 join kyc_dealer kd on upper(d.trade_code) = upper(kd.deal_code)
 join km_user ku on lower(ku.email_address) = lower(kd.email_address )
-- where 
--where d.email = 'realkcolb@gmail.com'
--order by kd.deal_code desc 
order by ku.nin desc 
;

select * from dealer_nin_update_31012022 dnu ;


select * from kyc_dealer kd where deal_code = 'ABK0048';
select * from kyc_dealer kd where lower(email_address) like '%elruson7273@gmail.com%' order by deal_code; 
select * from km_user ku where  lower(email_address) like '%elruson%' order by email_address ;


select distinct  upper(dealer_code), partner_first_name , partner_surname , partner_nin, dealer_name, partner_phone 
from partner_nin_mapping_10092021;

select distinct kd."name" as dealername,kd.deal_code  as dealercode,kd.address,ku.first_name, ku.surname,
ku.nin,kd.mobile_number ,kd.email_address ,dt.name as channel
from kyc_dealer kd 
 join km_user ku on  lower(kd.email_address) = lower(ku.email_address )
 join dealer_type dt on dt.pk = kd.dealer_type_fk 
-- join partner_nin_mapping_10092021 d on d.dealer_code = kd.deal_code 
where ku.nin is not null 
;