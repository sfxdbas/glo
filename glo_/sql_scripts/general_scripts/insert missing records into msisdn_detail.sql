select id, msisdn, firstname, lastname, other_name, gender, mothers_maiden_name, birthday, state_of_origin, lga_of_origin, country, 
occupation, registration_state, registration_lga, postal_code, residential_area, residential_lga, residential_state, residential_address,
company_name, company_address, company_state,
company_lga, company_postal_code from legacy_demographics where unique_id in (
select unique_id from user_id where id in (
select user_id_fk from basic_data bd where id in (
select demo_id from demographics_2 d 
where msisdn is null ) ));

select * from basic_data bd where id = 812188281 ;
select * from bfp_sync_log bsl where msisdn = '8157178475';

select * from legacy_demographics ld where unique_id = '46678616';

select * from msisdn_detail md; where basic_data_fk = 812697360;

select * from demographics_2 d 
where msisdn is not null;

select 'select '''||column_name || ''', count(*) from '||table_name||' where '||column_name ||' is not null;'
from information_schema."columns" c where table_name = 'demographics_2';

select 2175263+46070793;

--insert into msisdn_detail
select hibernate_sequence.nextval, null, null, ld.msisdn,null,true, ld.sim_serial,'PREPAID',null,null,false,BD.ID,null,null,null,NULL
from legacy_demographics ld 
join user_id ui on ui.unique_id = ld.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
where exists ( 
select 1 from demographics_2 d2 where d2.demo_id = bd.id and msisdn is null)
;
