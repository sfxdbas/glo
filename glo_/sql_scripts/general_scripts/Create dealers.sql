select * from kyc_dealer where deal_code = 'FRADA0066';

update create_dealer_14102021 set partner_phone =0||partner_phone where partner_phone is not null ;

update create_dealer_14102021 
set channel = 'FREELANCE'
where channel = 'FR'
;

update create_dealer_14102021 
set glo_state = split_part(glo_state ,' ', 1)
where glo_state != 'AKWA IBOM'
;
select * from STATE;

select  * from create_dealer_14102021 d where not exists  (select 1 from kyc_dealer kd where upper(d.partner_email)=upper(kd.email_address));


insert into kyc_dealer 
select hibernate_sequence.nextval, true, now, false, now,cd.partner_address ,cd.partner_address,cd.trade_code ,LOWER(cd.partner_email),null,cd.partner_phone,
cd.partner_name , null, s.zone_fk, 195456097, dt.pk, 50 
from create_dealer_14102021 cd 
join state s on s."name" = CD.glo_state 
join dealer_type dt on dt."name" = cd.channel 
where NOT exists 
(select 1 from kyc_dealer ku where upper(cd.partner_email)=upper(ku.email_address))
order by 1 
;
select * from km_user ku2 ;

--insert into km_user
select hibernate_sequence.nextval, true, now(), false,now(),null,
false,null,LOWER(k.partner_email) ,0,k.first_name ,'MALE',null,null,null,false
,k.partner_phone ,k.partner_nin ,hibernate_sequence.nextval,null,
'$2a$10$TITegBCKui3S6V2YTPUVx.v38YCe8HeaGi366m9ef45K0Ud0.7FSa',
k.last_name ,null,s.zone_fk,null
from create_dealer_14102021 k 
join state s on s."name" = k.glo_state 
join kyc_dealer kd on KD.deal_code =K.trade_code 
where not exists 
(select 1 from km_user ku where lower(ku.email_address) = lower(k.partner_email))
and DATE(KD.create_date)=DATE(NOW)
;


select * from create_dealer_14102021 where glo_state not in (select name from state);
select * from create_dealer_14102021 where partner_email = 'hamazofficial@gmail.com';

--select 'delete from kyc_dealer where pk = '||pk||';',* from (
select 'update kyc_dealer set km_user_pk = '||ku.pk||' where pk = '||kd.pk||' ;',
kd.pk, kd.deal_code, kd."name", kd.create_date, kd.email_address,km_user_pk, ku.pk as kupk, ku.create_date, ku.dealer_fk
,row_number()over(partition by kd.deal_code order by kd.create_date)
from kyc_dealer kd 
join km_user ku on ku.email_address = kd.email_address 
where deal_code in (select trade_code from create_dealer_14102021 cd)
--) a where row_number = 2
;
