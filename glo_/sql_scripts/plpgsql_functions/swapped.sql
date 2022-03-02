-- FUNCTION: public.swapped(text[], text[])

-- DROP FUNCTION public.swapped(text[], text[]);

CREATE OR REPLACE FUNCTION public.swapped(
	msisdn_ text[],
	targetsimserial_ text[])
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
	drop table if exists temp_swapped_table;
	drop table if exists temp_swapped_table2;
	
	create table temp_swapped_table as
	select msisdn_ as msisdns, targetsimserial_ as targetsimserials;
	
	create table temp_swapped_table2 as 
  	SELECT unnest(msisdns) as msisdns, unnest(targetsimserials) as targetsimserials FROM temp_swapped_table;

update sim_swap_demographic ssd
set ssd.swap_status='SWAPPED', 
	ssd.registration_status='SENT_TO_SIEBEL',
	ssd.reg_status_description= 'Success',
	ssd.last_modified = now 
where ssd.msisdn in (select msisdns from temp_swapped_table2)
and ssd.target_sim_serial in (select targetsimserials from temp_swapped_table2)
;
GET DIAGNOSTICS a_count = ROW_COUNT;

RAISE NOTICE '% rows were affected', a_count ;

end;
$BODY$;

ALTER FUNCTION public.swapped(text[], text[])
    OWNER TO seamfix;
