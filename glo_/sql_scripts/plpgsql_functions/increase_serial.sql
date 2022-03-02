-- FUNCTION: public.increase_serial(text[], integer)

-- DROP FUNCTION public.increase_serial(text[], integer);

CREATE OR REPLACE FUNCTION public.increase_serial(
	deal_code text[],
	increase_serial integer)
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$

DECLARE
  a_count integer;

begin 
	
	-- drop tables to hold the temporary records
	drop table if exists temp_increment_table;
	drop table if exists temp_increment_table2;
	
	create table temp_increment_table as
	select deal_code as deal_codes;
	
	create table temp_increment_table2 as 
  	SELECT unnest(deal_codes) as deal_codes FROM temp_increment_table;
  	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were inserted', a_count ;
	
	-- update kyc_dealer
	UPDATE kyc_dealer kd
	SET latest_user_id_serial=coalesce(latest_user_id_serial,0) +increase_serial ,
		      last_modified=now()
	WHERE kd.deal_code in 
	(select deal_codes from temp_increment_table2)	;
	
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	            
end;
$BODY$;

ALTER FUNCTION public.increase_serial(text[], integer)
    OWNER TO seamfix;
