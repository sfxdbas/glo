-- Fetch from nin db
with t1 as (
SELECT REPLACE(MSISDN, '234', '0') AS MSISDN, NIN,FIRSTNAME,LASTNAME
FROM NIN_DATA nd 
where length(REPLACE(MSISDN, '234', '0')) = 11
AND FIRSTNAME IS NOT NULL 
AND LASTNAME IS NOT null
ORDER BY  DATEIN DESC
)
select * 
from t1 
where rownum <= 200000
;


-- Migrate to seamfix db
 Use the DBeaver migration tool
 

--  Create dummy table to hold records to be inserted into the nin_link_log table
create table nin_data_06012021_v2 as
select
nextval('hibernate_sequence') pk,true as active,now() create_d,false deleted,now() l_m,bd.id b_id,null dob
,dd.id d_id,nd.firstname,null linked,
nd.msisdn,nd.nin,nd.lastname,'PENDING_VALIDATION',null v_l
from
	sms_activation_request sar, basic_data bd,
	user_id ui ,
	dynamic_data dd, nin_data_06012021 nd
where
	sar.unique_id = ui.unique_id
	and bd.user_id_fk = ui.id
	and dd.basic_data_fk = bd.id
	and  nd.msisdn = sar.phone_number 
	;
 
 
-- Populate the nin_link_log ensuring no duplicate in NIN and MSISDNs
insert into nin_link_log
with t2 as (
with t1 as 
(
select *, rank() over (partition by nin order by pk desc)
from nin_data_06012021_v2
)
select * , rank() over (partition by msisdn order by pk desc) as rank2
from t1 
 where rank = 1
limit 110000
)
select pk, active, create_d, deleted, l_m, b_id, dob, d_id, firstname, null, msisdn, nin, lastname, "?column?", v_l 
from t2 
where rank2 = 1
and not exists 
(select 1 from nin_link_log nll where nll.msisdn = t2.msisdn)
limit 100000
;


-- Verification status query 
select verification_status ,count(*) 
from nin_link_log nll 
where date(create_date) = date(now)
-- or nin in (select nin from nin_data_06012021_v2)
group by 1
order by 2 desc
;


-- Fetch images from NIMC to be shared with the operations team
select loread( lo_open( nc.photo, 262144 ), 1000000 ) as passport_data ,n.msisdn as unique_id
from nin_link_log n, nimc_verification_log nc 
where n.nin = nc.nin
and n.verification_transaction_id = nc.transaction_id 
and n.nin  in (select nin from nin_data_06012021_v2)
and n.verification_status = 'VALID'
;


-- Fetch images from Seamfix DB to be shared with the operations team
with t2 as (
with t1 as 
(
select *, rank() over (partition by nin order by pk desc)
from nin_data_06012021_v2
)
select * , rank() over (partition by msisdn order by pk desc) as rank2
from t1 
 where rank = 1
limit 100000
)
select loread( lo_open( p.passport_data, 262144 ), 1000000 ) as passport_data ,sar.phone_number as unique_id 
from
	sms_activation_request sar ,basic_data bd,	user_id ui,	passport p,	T2 nd
where
	sar.unique_id = ui.unique_id
	and bd.user_id_fk = ui.id
	and bd.id = p.basic_data_fk
	and nd.msisdn = sar.phone_number 
	and RANK2 = 1
	;
	
	
--insert single record 

insert into nin_link_log
select
nextval('hibernate_sequence') pk,true as active,now() create_d,false deleted,now() l_m,
bd.id, '1953-09-17',dd.id, 'JUSTINA', false, '08053612229','29705647239', 'OZOIGBO',
'PENDING_VALIDATION',null,null
from
	sms_activation_request sar, basic_data bd,
	user_id ui ,
	dynamic_data dd--, nin_data_06012021 nd
where
	sar.unique_id = ui.unique_id
	and bd.user_id_fk = ui.id
	and dd.basic_data_fk = bd.id
-- 	and  nd.msisdn = sar.phone_number 
	and sar.phone_number = '08053612229'