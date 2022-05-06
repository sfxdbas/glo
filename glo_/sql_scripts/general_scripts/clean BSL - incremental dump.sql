with elem as (
select tablename ,right(tablename,9),NULLIF(regexp_replace(tablename, '\D','','g'), ''),
right(NULLIF(regexp_replace(tablename, '\D','','g'), ''),4),
substr(NULLIF(regexp_replace(tablename, '\D','','g'), ''),3,2),
substr(NULLIF(regexp_replace(tablename, '\D','','g'), ''),1,2),
right(NULLIF(regexp_replace(tablename, '\D','','g'), ''),4)||'-'||
substr(NULLIF(regexp_replace(tablename, '\D','','g'), ''),3,2)||'-'||
substr(NULLIF(regexp_replace(tablename, '\D','','g'), ''),1,2)
,schemaname
from pg_tables
where schemaname = 'public'
and tablename like 'bfp_sync_log_incrementaldump_%'
--order by length(tablename)    
order by 
right(NULLIF(regexp_replace(tablename, '\D','','g'), ''),4)||'-'||
substr(NULLIF(regexp_replace(tablename, '\D','','g'), ''),3,2)||'-'||
substr(NULLIF(regexp_replace(tablename, '\D','','g'), ''),1,2)  
)
select 
'drop table '||tablename ||';' dd,
left(tablename,31),substr(tablename,32,2),right(tablename,5),
--ALTER TABLE public.cug_primarytm_23122021 RENAME TO cug_primarytm_24122021;
--left(tablename,31)||'12'||right(tablename,5) mmm,
--'alter table '||tablename||' rename to '||left(tablename,31)||'12'||right(tablename,5)||';' mmm2,
* 
from elem 
where "?column?" <= '2022-03-14'
--and tablename = 'bfp_sync_log_incrementaldump_1722021'
order by "?column?"
;
;