-- FUNCTION: public.set_swap_status(timestamp without time zone, text[])

-- DROP FUNCTION public.set_swap_status(timestamp without time zone, text[]);

CREATE OR REPLACE FUNCTION public.set_swap_status(
	date_ timestamp without time zone,
	msisdn_1 text[])
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$

DECLARE
  a_count integer; 

begin 
	
	-- drop tables to hold the temporary records
	drop table if exists temp_hold_msisdn_table;
	drop table if exists temp_hold_msisdn_table2;
	
	create table temp_hold_msisdn_table as
	select msisdn_1 as device_ids;
	
	create table temp_hold_msisdn_table2 as 
  	SELECT unnest(msisdn_1) as msisdn_1 FROM temp_hold_msisdn_table t;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were inserted', a_count ;

	update sim_swap_demographic ssd 
	set ssd.swap_status = 'SWAPPED', registration_status = 'SENT_TO_SIEBEL', reg_status_description = 'Success', last_modified = now
	where msisdn in 
	(select t.msisdn_1 from temp_hold_msisdn_table2 t)
	and date(create_date) = date_;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

            
end;
$BODY$;

ALTER FUNCTION public.set_swap_status(timestamp without time zone, text[])
    OWNER TO seamfix;
