--> license devices latest 

select * from new_kd_11;

update new_kd_11
set email = nextval('hibernate_sequence')||email||'@gmail.com'
where email = 'N/A';

select distinct state 
from new_kd_11 where state not in (select name from  state);

update new_kd_11 
set state = 'ONDO'
where state in ('ONDO 2','ONDO 1');

update new_kd_11 
set state = 'ANAMBRA'
where state in ('ANAMBRA 2');
;

update new_kd_11
set partner_name = 'DIVINE LINKS GLOBAL NETWORK'
where partner_name = 'Divine Links'
;


select distinct(code), max(email) email, upper(partner_name)
from new_kd_11
group by 1,3
order by 1
;

insert into kyc_dealer (deal_code, email_address,name,zone_fk, dealer_division_fk,dealer_type_fk,pk,active,create_date,deleted,last_modified)
select 
	distinct(n.code), max(email) email, upper(partner_name),
		s.zone_fk, 195456097, 6,
		hibernate_sequence.nextval, true, now(), false,now()
from new_kd_11 n  join  state s 
on lower(n.state) = lower(s."name")
and not exists (
select deal_code from kyc_dealer k where n.code = k.deal_code
)
group by 1,3,4
;


insert into km_user 
select hibernate_sequence.nextval, true, now(), false,now(),null,
false,null,k.email_address,0,k."name",'MALE',null,null,null,false
,k.mobile_number,null,hibernate_sequence.nextval,k."name",
'$2a$10$TITegBCKui3S6V2YTPUVx.v38YCe8HeaGi366m9ef45K0Ud0.7FSa',
k."name",k.pk,k.zone_fk,null
from kyc_dealer k 
where date(create_date) = date(now())
;

update kyc_dealer a set a.km_user_pk = (select b.pk from km_user b 
where b.email_address = a.email_address) 
where a.email_address in (select email_address from km_user)
and date(a.create_date) = date(now());


 insert into enrollment_ref
select hibernate_sequence.nextval, device_id, false,
'1.0', null,
null,
sysdate,
'GLO Smart Client', null,'support@seamfix.com',
null,
device_id
, null 
from new_kd_11 n 
where not exists 
(select code from enrollment_ref e where e.code = n.device_id)
;


insert into node
select hibernate_sequence.nextval, true, sysdate, false, sysdate, null, null,
false, null, false, null, null, null, null, null, null, sysdate, 'support@seamfix.com',
'1.0', null, null, null, null, null, null, null,
null, null, null, null, null, null, null, null, null,
null, null, null, null, 173214133, id, null 
from enrollment_ref where date(date_installed) = date(now()); 
;


insert into km_user
select hibernate_sequence.nextval, true, now(), false,now(),null,
false,null,lower(device_id||'@gloworld.ng'),0,device_id,'MALE',null,null,null,false
,mobile_number,null,hibernate_sequence.nextval,device_id,
'$2a$10$TITegBCKui3S6V2YTPUVx.v38YCe8HeaGi366m9ef45K0Ud0.7FSa',
device_id,k.pk,k.zone_fk,null
from new_kd_11 n, kyc_dealer k 
where n.code = k.deal_code
and not exists (
select first_name from km_user k where k.first_name = n.device_id)
;


insert into user_role
select pk, 1066
from km_user
where date(create_date) = date(now())
--and date_part('hour', create_date) > 14
;


insert into node_assignment (pk, active, create_date, deleted, last_modified, kyc_dealer_fk, state_fk, zone_fk, fsa_user_fk, lga_fk, node_fk, territory_fk)
select hibernate_sequence.nextval, true, sysdate, false, sysdate, pk, 
state_fk, zone_fk, fsa_user,lga_fk, node_fk, territory_fk from
(
select distinct k.pk, k.zone_fk, state.id as state_fk,
km.pk as fsa_user,
n.id as node_fk,
(select max(l.id) from lga l where l.state_fk = state.id) as lga_fk,
(select max(t.id) from territory t where t.state_fk = state.id) as territory_fk
from new_kd_11 ts left join state on
state.name = ts.state, kyc_dealer k
,enrollment_ref e ,
node n ,km_user km
where ts.code = deal_code
and ts.device_id = e.name
and e.id = n.enrollment_ref
and lower(ts.device_id||'@gloworld.ng') = km.email_address
and date(n.create_date) = date(now())
) a;



select * from kyc_dealer where date(create_date) = date(now());  --address, contactAddress, mobile_number;

select max(code) code, max(upper(n.address)) address, max(phone_number) phone_number,  k.*
from kyc_dealer k, new_kd_11 n
where code = deal_code
and date(create_date) = date(now())
group by 4
order by 1
;

update kyc_dealer a 
set
	a.address = (select max(b.address) from new_kd_11 b where b.code = a.deal_code),
	a.contact_address = (select max(b.address) from new_kd_11 b where b.code = a.deal_code), 
	a.mobile_number = (select max(b.phone_number) from new_kd_11 b where b.code = a.deal_code)
where a.email_address in (select email from new_kd_11)
and date(a.create_date) = date(now());
