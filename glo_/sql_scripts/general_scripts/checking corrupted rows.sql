
select * from edb_corrupted_rows ;

--Also you can check ,when last vacuuming was done using below query.
select schemaname,relname,n_live_tup,n_dead_tup,last_vacuum,last_autovacuum,last_analyze,last_autoanalyze
from pg_stat_all_tables
order by last_analyze -- n_live_tup desc 
;

SELECT public.check_table_row_corruption('public','biodata_demographics');

