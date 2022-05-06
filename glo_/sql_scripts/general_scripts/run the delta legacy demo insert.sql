select count(distinct demo_id) from demographics_2;

select * from demographics_2 order by 2 desc ;

select * from legacy_demographics ld where unique_id = '44267906';


select * from legacy_demographics where unique_id in (
select unique_id from user_id where id in (
select user_id_fk from basic_data bd where id in (
select demo_id from demographics_2 d 
where msisdn is null ) ));