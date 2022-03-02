-- FUNCTION: public.unblock()

-- DROP FUNCTION public.unblock();

CREATE OR REPLACE FUNCTION public.unblock(
	)
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$


	
DECLARE
  a_count integer;

begin 
	
	-- drop tables to hold the temporary records
--	drop table if exists temp_unblock_table;
--	drop table if exists temp_unblock_table2;
	
--	create table temp_unblock_table as
--	select msisdn_ as msisdns;
	
--	create table temp_unblock_table2 as 
--  	SELECT unnest(msisdns) as msisdns FROM temp_unblock_table;	
	

	--	*Update MPS with other_status of BLOCKED
	update msisdn_provision_status 
	set other_status = 'UNBLOCKED',
		last_modified =now
	where other_status = 'BLOCKED'
--	and msisdn in (
--	 -- paste msisdns here 
--		select msisdns 
--		from temp_unblock_table2
--	)
	;
	GET DIAGNOSTICS a_count = ROW_COUNT;
	RAISE NOTICE '% rows were affected on MPS', a_count ;

	
	--	*Update SSD with sim_swap_status of BLOCKED
	update sim_swap_demographic 
	set swap_status = 'UNBLOCKED',
		last_modified =now
	where swap_status = 'BLOCKED'
--	and msisdn in 
--	(
	-- paste msisdns here 
--		select msisdns 
--	 	from temp_unblock_table2
--	)
	;
	GET DIAGNOSTICS a_count = ROW_COUNT;
	RAISE NOTICE '% rows were affected on SSD', a_count ;

end;
$BODY$;

ALTER FUNCTION public.unblock()
    OWNER TO seamfix;
