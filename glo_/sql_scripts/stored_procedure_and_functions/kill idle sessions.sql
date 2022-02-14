



cREATE OR REPLACE PROCEDURE public.terminate_sessions(
	)
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 

BEGIN

truncate terminate_sessions;


insert into terminate_sessions
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
where  lower(state) like '%idle%'
order by query_start;

commit;
END terminate_sessions$BODY$;



