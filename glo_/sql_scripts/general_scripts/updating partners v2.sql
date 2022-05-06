with cte as (
select distinct up.partner_name, kd."name", up.deal_code, kd.deal_code, --up.contact_address as up_ca, kd.contact_address as kd_ca, 
	   up.email_address up_email, kd.email_address kd_email,ku.email_address as ku_email, up.mobile_number as up_mobile, 
	   kd.mobile_number as kd_mobile, up.partner_first_name, up.partner_surname, ku.first_name, ku.surname, 
	   kd.km_user_pk, ku.pk as kupk, kd.pk as kdpk, ku.dealer_fk 
--up.*, kd.deal_code , kd.email_address, kd."name", kd.km_user_pk 
from update_partner_07072021 up
left join kyc_dealer kd on up.deal_code = kd.deal_code 
left join km_user ku on ku.pk = kd.km_user_pk 
--where up.email_address like '%ofutlyd%'
order by kd.deal_code -- desc 
)
select * --kd_email, k.email_address,ku_email, k.pk as kpk,kdpk,km_user_pk, kupk||',',cte.* 
--,'update km_user set dealer_fk = '||kdpk||' where pk = '||kupk||';'
--, 'update kyc_dealer set km_user_pk = '||k.pk||' where pk = '||kdpk||';'
from CTE 
--from cte, km_user k
--where kd_email != ku_email 
--and cte.kd_email = k.email_address 
--and ku_email like 'glo%'
--and kdpk != dealer_fk
--and up_email = 'ofutlyd@yahoo.com'
--and dealer_fk = 367641
order by 2 desc
;

select pk,first_name , surname , email_address ,dealer_fk  from km_user where  pk in (830118630,860275513	, 318547993); -- email_address ='nkirucamara3@gmail.com';
select * from kyc_dealer kd where  email_address = 'Lafe-akure.shop@gloworld.com'; 
select pk,first_name , surname , email_address ,dealer_fk from km_user kd where  email_address = 'Lafe-akure.shop@gloworld.com'; 


select ku.dealer_fk ,up.pk, up.email_address , km_user_pk, ku.pk, ku.email_address , 
--'update kyc_dealer set km_user_pk = '||ku.pk||' where up.pk = '||up.pk||';'
from kyc_dealer up , km_user ku 
where up.email_address = ku.email_address 
and up.email_address in 
('foraleafs@yahoo.com',
'adekiitanoluseunabiodun@gmail.com',
'ugospecial2000@yahoo.com'
);

--update kyc_dealer set km_user_pk = 2820964565 where pk = 367357;
--update kyc_dealer set km_user_pk = 2820964577 where pk = 367411;
--update kyc_dealer set km_user_pk = 2820964544 where pk = 368611;


select pk, email_address, dealer_fk from km_user 
where email_address in 
('foraleafs@yahoo.com',
'adekiitanoluseunabiodun@gmail.com',
'ugospecial2000@yahoo.com');
select * from enrol

select create_setting('{}')