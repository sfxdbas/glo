insert into node_assignment
 select
	hibernate_sequence.nextval , -- pk
	true , -- active
	now() , -- create_date
	false, -- deleted
	now(), -- last_modified
	null , --  area_fk
	364077, -- kyc_dealer_fk
	12, --  state_fk
	10, --  zone_fk
	null, --  dm_user_fk
	k.pk, -- fsa_user_fk
	230, -- lga_fk
	null, --  outlet_fk
	n.pk, -- node_fk
	32 -- territory_fk
from km_user k , node n
;



--insert into node_assignment
 select
	hibernate_sequence.nextval , -- pk
	true , -- active
	now() , -- create_date
	false, -- deleted
	now(), -- last_modified
	null , --  area_fk
	110829, -- kyc_dealer_fk
	6, --  state_fk
	9, --  zone_fk
	null, --  dm_user_fk
	k.pk, -- fsa_user_fk
	111, -- lga_fk
	null, --  outlet_fk
	n.id, -- node_fk
	9 -- territory_fk
from km_user k , node n, enrollment_ref e --, kyc_dealer kd 
where lower(k.first_name) = lower(e.code)
and e.id = n.enrollment_ref
--and k.dealer_fk = kd.pk
and  k.first_name in (select  device_id from temp_agent t where device_id in (
select code from enrollment_ref where id in (
select enrollment_ref from node where id not in (
select node_fk from node_assignment) and  black_listed is false
)
)and t.code = 'SEYNG050')
;





