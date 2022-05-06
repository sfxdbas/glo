--get average response time for successful request when request type is ODS_ACCOUNT_QUERY_INFO.
--get least response time for successful request when request type is ODS_ACCOUNT_QUERY_INFO.
--get max response time for successful request when request type is ODS_ACCOUNT_QUERY_INFO.

--get average response time for failed request when request type is ODS_ACCOUNT_QUERY_INFO.
--get least response time for failed request when request type is ODS_ACCOUNT_QUERY_INFO.
--get max response time for failed request when request type is ODS_ACCOUNT_QUERY_INFO.
--please help fetech data using the above parameters
--let's work with last 14days
select create_setting_v3('{HEWLETT-PACKARD-CZC005BMB9}');

-- success
select max(diff), min(diff), avg(diff) from (
select response_time,request_time, response_time - request_time as diff
from agility_integration_log_ ail 
where request_type = 'ODS_ACCOUNT_QUERY_INFO'
and response_code != '-1'
and date(create_date) between '2021-09-14' and '2021-09-28'
) a
;

-- failed
select response_code,max(diff), min(diff), avg(diff) from (
select response_code, response_time,request_time, response_time - request_time as diff
from agility_integration_log_ ail 
where request_type = 'ODS_ACCOUNT_QUERY_INFO'
and response_code = '-1'
and date(create_date) between '2021-09-14' and '2021-09-28'
) a
group by 1
;
select * from pg_catalog.pg_stat_get_activity(674239);
SELECT relname   AS objectname
     , relkind   AS objecttype
     , reltuples AS entries
     , pg_size_pretty(pg_table_size(oid)) AS size
FROM   pg_class
WHERE  relkind = 'r' --IN ('r', 'i', 'm')
ORDER  BY pg_table_size(oid) DESC LIMIT 5;

                                                               
 SELECT psut.relname,
     to_char(psut.last_vacuum, 'YYYY-MM-DD HH24:MI') as last_vacuum,
     to_char(psut.last_autovacuum, 'YYYY-MM-DD HH24:MI') as last_autovacuum,
     to_char(pg_class.reltuples, '9G999G999G999') AS n_tup,
     to_char(psut.n_dead_tup, '9G999G999G999') AS dead_tup,
     to_char(CAST(current_setting('autovacuum_vacuum_threshold') AS bigint)
         + (CAST(current_setting('autovacuum_vacuum_scale_factor') AS numeric)
            * pg_class.reltuples), '9G999G999G999') AS av_threshold,
     CASE
         WHEN CAST(current_setting('autovacuum_vacuum_threshold') AS bigint)
             + (CAST(current_setting('autovacuum_vacuum_scale_factor') AS numeric)
                * pg_class.reltuples) < psut.n_dead_tup
         THEN '*'
         ELSE ''
     END AS expect_av
 FROM pg_stat_user_tables psut
     JOIN pg_class on psut.relid = pg_class.oid
--     where psut.relname ='rtn_1_nin_data_20092021'
 ORDER BY psut.n_dead_tup desc 
;
SELECT 
	datname as database ,usename as user ,client_addr,state, count(*) as total_connections,query
FROM pg_stat_activity
WHERE pid<>pg_backend_pid()
GROUP BY usename,client_addr,datname,state,query order by 5 desc ;

SELECT                                 
        datname as database ,usename as user ,client_addr,state,
        now() - backend_start as duration, count(*) as total_connections,query
FROM pg_stat_activity
WHERE state <> 'idle' 
AND pid<>pg_backend_pid()
GROUP BY usename,client_addr,datname,state, now() - backend_start, query
order by 5;


SELECT 
	datname as database ,usename as user ,client_addr,state, count(*) as total_connections
FROM pg_stat_activity
WHERE pid<>pg_backend_pid()
GROUP BY usename,client_addr,datname,state
order by 5 desc 
;
SELECT 
	datname as database ,usename as user ,client_addr,state, count(*) as total_connections,query
FROM pg_stat_activity
WHERE state <> 'idle' 
AND pid<>pg_backend_pid()
GROUP BY usename,client_addr,datname,state,query;

SELECT pid, 
       usename, 
       pg_blocking_pids(pid) AS blocked_by, 
       query AS blocked_query
FROM pg_stat_activity
WHERE cardinality(pg_blocking_pids(pid)) > 0;
SELECT usename as user, application_name, client_addr, client_port, state, sent_lsn, write_lsn, flush_lsn, replay_lsn
FROM pg_stat_replication;
SELECT r.rolname, r.rolsuper, r.rolinherit,
  r.rolcreaterole, r.rolcreatedb, r.rolcanlogin,
  r.rolconnlimit, r.rolvaliduntil,
  ARRAY(SELECT b.rolname
        FROM pg_catalog.pg_auth_members m
        JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
        WHERE m.member = r.oid) as memberof
, r.rolreplication
, r.rolbypassrls
FROM pg_catalog.pg_roles r
WHERE r.rolname !~ '^pg_'
ORDER BY 1;

SELECT relowner as userid,
pg_get_userbyid(relowner) as username,
CASE 
WHEN relkind in ('r','t' ,'f','p') THEN 'table'
WHEN relkind in ('m', 'v') THEN 'view'
WHEN relkind='S' THEN 'sequence'
WHEN relkind='i' THEN 'index'
WHEN relkind='c' THEN 'composite_type'
END as type,
array_agg(relname) as owned_objs
FROM pg_class
WHERE relnamespace IN (
    SELECT oid
    FROM pg_namespace
    WHERE nspname NOT LIKE 'pg_%'
    AND nspname != 'information_schema'
)
GROUP BY 1,2,3
ORDER BY 2;

SELECT count(*)
  FROM pg_stat_activity
 WHERE xact_start < now() - '24 hours'::interval;

-- returns the top 5 tables vacuumed least recently
  SELECT schemaname || '.' || relname, now()-last_vacuum
    FROM pg_stat_all_tables
ORDER BY last_vacuum ASC NULLS LAST LIMIT 5;

-- returns all tables that have not been vacuumed in the last 7 days
  SELECT schemaname || '.' || relname, now()-last_vacuum
    FROM pg_stat_all_tables
   WHERE last_vacuum < now() - '7 days'::interval;
  
  SELECT pid, now() - query_start as "runtime", usename, datname, state, query
  FROM  pg_stat_activity
  WHERE now() - query_start > '1 minutes'::interval
 ORDER BY runtime DESC;

select 'vacuum '||relname||';' schemaname ,relname,n_tup_ins,n_tup_upd,n_live_tup,n_dead_tup ,last_vacuum ,vacuum_count 
from pg_stat_all_tables where n_dead_tup > 5000 order by n_dead_tup desc ;
