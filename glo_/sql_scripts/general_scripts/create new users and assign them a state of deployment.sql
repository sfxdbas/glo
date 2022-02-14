create user that dont exait 


create table new_kmu 
as select
	hibernate_sequence.nextval nextval_,
	true active,
	now() create_date,
	false,
	now(),
	null a,
	false deleted,
	null b,
	lower( e."name" )|| '@gloworld.ng' k,
	0 j,
	e."name" z,
	'MALE',
	null c,
	null d ,
	null e,
	false locked_out,
	09050000000 l,
	null f,
	hibernate_sequence.nextval m,
	null _h,
	'$2a$10$TITegBCKui3S6V2YTPUVx.v38YCe8HeaGi366m9ef45K0Ud0.7FSa' _i,
	e."name",
	k.pk,
	k.zone_fk,
	null g
from
	enrollment_ref e
left join temp_agent t on
	lower( e."name" ) = lower( t.device_id )
left join kyc_dealer k on
	lower( t.code ) = lower( k.deal_code )
where
	lower( e.code ) not in (
	select
		lower( left( email_address, strpos( email_address, '@' ) -1 ))
	from
		km_user )
order by
	9;




insert into node_assignment
 select
	hibernate_sequence.nextval ,
	true ,
	now() ,
	false,
	now(),
	null ,
	37824112,
	25,
	2,
	null,
	38518481,
	519,
	null,
	37769816,
	20;
	
	
	
--insert into node_assignment
 select
	hibernate_sequence.nextval , --pk
	true , --active
	now() , --create_date
	false, --deleted
	now(), --last_modified
	null , -- area_fk
	37824112, --kyc_dealer_fk
	25, -- state_fk
	2, -- zone_fk
	null, -- dm_user_fk
	38518481, --fsa_user_fk
	519, --lga_fk
	null, -- outlet_fk
	37769816, --node_fk
	20 --territory_fk
 from 	
	;
	
	
	






select upper(left(t.email, strpos(t.email, '@') -1)) "Device ID",  d."name" "Channel", k."name" "Channel Partner Name"
, k.deal_code "Dealer Code"
from temp_agent t left join   kyc_dealer k on  lower(t.code) = lower(k.deal_code)
left join dealer_type d on k.dealer_type_fk = d.pk
where t.email in (
select email_address from km_user where lower(left(email_address, strpos(email_address, '@') -1))  in (
select lower("name") from enrollment_ref where id in (
select enrollment_ref from node
where black_listed is false
)
)
)
--and upper(t.email) like '%GLO-FR-829H%'
; 
