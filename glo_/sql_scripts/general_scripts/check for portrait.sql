SELECT 0||right(msisdn ,10) ,msisdn FROM public.dump_dump_csv_05052022;

--update dump_dump_csv_05052022 set msisdn = 0||right(msisdn ,10) where msisdn is not null ;

-- 1,036,659

create table check_for_portrait_SIMREG_05052022 as 
select  distinct on (bsl.msisdn ) bsl.msisdn, bd.id,
case when dd.passport_data is null then 'NO PORTRAIT' else 'PORTRAIT' end portrait, dd.passport_data 
from bfp_sync_log bsl 
join dump_dump_csv_05052022 cptn on bsl.msisdn = cptn.msisdn  
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join passport dd on dd.basic_data_fk = bd.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
order by bsl.msisdn, create_date desc 
;


select portrait,count(1)  from check_for_portrait_simreg_05052022 group by 1 ;

-- portrait retruned from NIMC
create table check_for_portrait_NIMC_05052022B as 
select  distinct on (bsl.msisdn ) bsl.msisdn --,nvl.photo  
from bfp_sync_log bsl 
join dump_dump_csv_05052022 cptn on bsl.msisdn = cptn.msisdn  
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
join nimc_verification_log nvl on nvl.transaction_id = dd.dda23 
--join nimc_verification_log nvl on nvl.nin = dd.dda34 
where bsl.bfpsyncstatusenum = 'SUCCESS'
--and bsl.msisdn ='08150533443'
order by bsl.msisdn, bsl.create_date desc , nvl.create_date desc 
;

select portrait,count(1) from check_for_portrait_NIMC_05052022 ;

select msisdn,portrait
from check_for_portrait_SIMREG_05052022 A
where portrait = 'NO PORTRAIT'
and exists 
(select 1 from check_for_portrait_nimc_05052022 B where A.msisdn=B.msisdn and (b.photo is null or b.photo::varchar = '') )
;

select msisdn--,portrait
from check_for_portrait_SIMREG_05052022 A
where portrait = 'NO PORTRAIT'
and exists 
(select 1 from check_for_portrait_nimc_05052022 B where A.msisdn=B.msisdn and  b.photo::varchar != '') 
;

select msisdn,portrait
from check_for_portrait_SIMREG_05052022 A
where portrait = 'NO PORTRAIT'
and not exists 
(select 1 from check_for_portrait_nimc_05052022 B where A.msisdn=B.msisdn ) 
;

select photo ,* from nimc_verification_log b where (b.photo is null or b.photo::varchar = '') ;



select
'insert into passport select hibernate_sequence.nextval, null,'|| photo||','|| id ||' from check_for_portrait_nimc_05052022 where msisdn = '||''''||msisdn||''''||';'--,
--*--,loread(lo_open(photo, 262144), 1000000) --msisdn--,portrait
--loread( lo_open( p.passport_data , 262144 ), 1000000 )  as photo 
from check_for_portrait_SIMREG_05052022 A 
join check_for_portrait_nimc_05052022 B using (msisdn )
where portrait = 'NO PORTRAIT'
and not exists 
(select 1 from passport p where A.id=p.basic_data_fk ) 
;


create table check_for_portrait_SIMREG_05052022 as 
select  distinct on (bsl.msisdn ) bsl.msisdn, bd.id,
case when dd.passport_data is null then 'NO PORTRAIT' else 'PORTRAIT' end portrait, dd.passport_data 
from bfp_sync_log bsl 
join dump_dump_csv_05052022 cptn on bsl.msisdn = cptn.msisdn  
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join passport dd on dd.basic_data_fk = bd.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
order by bsl.msisdn, create_date desc 
;

select portrait,count(1) from check_for_portrait_SIMREG_05052022 group by 1 ;

select * from check_for_portrait_SIMREG_05052022 where portrait = 'NO PORTRAIT';


select msisdn 
--'insert into passport select hibernate_sequence.nextval, null,'|| photo||','|| id ||' from check_for_portrait_nimc_05052022 where msisdn = '||''''||msisdn||''''||';'--,
--*--,loread(lo_open(photo, 262144), 1000000) --msisdn--,portrait
--loread( lo_open( p.passport_data , 262144 ), 1000000 )  as photo 
from check_for_portrait_SIMREG_05052022 A 
join check_for_portrait_nimc_05052022 B using (msisdn )
where portrait = 'NO PORTRAIT'
and  exists 
(select 1 from passport p where A.id=p.basic_data_fk ) 
;


create table check_for_portrait_SIMREG_05052022 as 
select  distinct on (bsl.msisdn ) bsl.msisdn, bd.id,
case when dd.passport_data is null then 'NO PORTRAIT' else 'PORTRAIT' end portrait, dd.passport_data 
from bfp_sync_log bsl 
join dump_dump_csv_05052022 cptn on bsl.msisdn = cptn.msisdn  
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join passport dd on dd.basic_data_fk = bd.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
order by bsl.msisdn, create_date desc 
;

select portrait,count(1) from check_for_portrait_SIMREG_05052022 group by 1 ;

select * from check_for_portrait_SIMREG_05052022 where portrait = 'NO PORTRAIT';

