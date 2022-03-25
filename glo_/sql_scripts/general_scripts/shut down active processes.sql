select * --pg_terminate_backend(pid) 
from pg_catalog.pg_stat_activity 
where state = 'active'
and application_name != 'walreceiver'
;