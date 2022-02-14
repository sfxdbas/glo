select distinct(address), address,code,max(email),phone_number,partner_name
from new_kd_2
group by 1,2,3,5,6
order by 1
;
--update new_kd_2 set state = 'AKWA-IBOM' where state = 'AKWA IBOM';

select * from enrollment_ref where date(date_installed) = date(now());
select * from node;
select * from kyc_dealer;
select * from new_kd_2;

select * from km_user;


--1
insert into kyc_dealer (address, contact_address, deal_code, email_address,
mobile_number,name,zone_fk, dealer_division_fk,dealer_type_fk,pk,active,
create_date,deleted,last_modified)
select 
	distinct(address), address,n.code,max(email),phone_number,partner_name,
		s.zone_fk, 195456097, 6,
		hibernate_sequence.nextval, true, now(), false,now()
from new_kd_2 n  join  state s 
on lower(n.state) = lower(s."name")
group by 1,2,3,5,6,7,8,11
;


--2
insert into km_user 
select hibernate_sequence.nextval, true, now(), false,now(),null,
false,null,k.email_address,0,k."name",'MALE',null,null,null,false
,k.mobile_number,null,hibernate_sequence.nextval,k."name",
'$2a$10$gpNx63dkb684JaoZxqHQgOiLzcG7m6lHl9MsjpFs4Q.I/7mI65ON.',
k."name",k.pk,k.zone_fk,null
from kyc_dealer k 
where date(create_date) = date(now())
;


--3
update kyc_dealer a set a.km_user_pk = (select b.pk from km_user b 
where b.email_address = a.email_address) 
where a.email_address in (select email_address from km_user)
and date(a.create_date) = date(now());



--4
 insert into enrollment_ref
select hibernate_sequence.nextval, device_id, false,
'1.0', null,
null,
sysdate,
'GLO Smart Client', null,'support@seamfix.com',
null,
device_id
, null 
from new_kd_2
;




--5
insert into node
select hibernate_sequence.nextval, true, sysdate, false, sysdate, null, null,
false, null, false, null, null, null, null, null, null, sysdate, 'support@seamfix.com',
'1.0', null, null, null, null, null, null, null,
null, null, null, null, null, null, null, null, null,
null, null, null, null, 173214133, id, null 
from enrollment_ref where date(date_installed) = date(now()); 
;



--6
insert into km_user
select hibernate_sequence.nextval, true, now(), false,now(),null,
false,null,lower(device_id||'@gloworld.ng'),0,device_id,'MALE',null,null,null,false
,mobile_number,null,hibernate_sequence.nextval,device_id,
'$2a$10$gpNx63dkb684JaoZxqHQgOiLzcG7m6lHl9MsjpFs4Q.I/7mI65ON.',
device_id,k.pk,k.zone_fk,null
from new_kd_2 n, kyc_dealer k 
where n.code = k.deal_code
;



--7
insert into user_role
select pk, 1066
from km_user
where date(create_date) = date(now())
;



--8
insert into node_assignment (pk, active, create_date, deleted, last_modified, kyc_dealer_fk, state_fk, zone_fk, fsa_user_fk, lga_fk, node_fk, territory_fk)
select hibernate_sequence.nextval, true, sysdate, false, sysdate, pk, 
state_fk, zone_fk, fsa_user,lga_fk, node_fk, territory_fk from
(
select distinct k.pk, k.zone_fk, state.id as state_fk,
km.pk as fsa_user,
n.id as node_fk,
(select max(l.id) from lga l where l.state_fk = state.id) as lga_fk,
(select max(t.id) from territory t where t.state_fk = state.id) as territory_fk
from new_kd_2 ts left join state on
state.name = ts.state, kyc_dealer k
,enrollment_ref e ,
node n ,km_user km
where ts.code = deal_code
and ts.device_id = e.name
and e.id = n.enrollment_ref
and lower(ts.device_id||'@gloworld.ng') = km.email_address
) a
;









