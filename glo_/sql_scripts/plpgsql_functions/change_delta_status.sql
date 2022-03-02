-- FUNCTION: public.change_delta_status(text[])

-- DROP FUNCTION public.change_delta_status(text[]);

CREATE OR REPLACE FUNCTION public.change_delta_status(
	msisdn text[])
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$

DECLARE
  a_count integer;

begin 
	
	-- drop tables to hold the temporary records
	drop table if exists temp_hold_msisdn;
	drop table if exists temp_hold_msisdn2;
	
	create table temp_hold_msisdn as
	select msisdn as msisdns;
	
	create table temp_hold_msisdn2 as 
  	SELECT unnest(msisdns) as msisdns FROM temp_hold_msisdn;
  	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were inserted', a_count ;
  
  	-- update mps
	update msisdn_provision_status mps
	set delta_imsi = null, delta_sim_serial = null, last_modified = now
	where mps.msisdn in 
	(select msisdns from temp_hold_msisdn2)
	;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	            
end;
$BODY$;

ALTER FUNCTION public.change_delta_status(text[])
    OWNER TO seamfix;
