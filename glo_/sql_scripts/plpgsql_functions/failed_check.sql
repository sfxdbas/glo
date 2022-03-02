-- FUNCTION: public.failed_check(text[])

-- DROP FUNCTION public.failed_check(text[]);

CREATE OR REPLACE FUNCTION public.failed_check(
	msisdn_ text[])
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$

DECLARE
  a_count integer;
--  b_count integer;

begin 
	
	-- drop tables to hold the temporary records
	drop table if exists temp_failedcheck_table;
	drop table if exists temp_failedcheck_table2;
	
	create table temp_failedcheck_table as
	select msisdn_ as msisdns;
	
	create table temp_failedcheck_table2 as 
  	SELECT unnest(msisdns) as msisdns FROM temp_failedcheck_table;

update sim_swap_demographic ssd
set ssd.check_status = 'FAILED_CHECK',
	ssd.last_modified = now 
where ssd.msisdn in (select msisdns from temp_failedcheck_table2)
;
GET DIAGNOSTICS a_count = ROW_COUNT;

RAISE NOTICE '% rows were affected', a_count ;

end;
$BODY$;

ALTER FUNCTION public.failed_check(text[])
    OWNER TO seamfix;
