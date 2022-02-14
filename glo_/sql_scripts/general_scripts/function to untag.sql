-- FUNCTION: public.untag(text[])

-- DROP FUNCTION public.untag(text[]);

CREATE OR REPLACE FUNCTION public.untag(
	val text[])
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$
begin 
	
	-- drop tables to hold the temporary records
	drop table if exists temp_table;
	drop table if exists temp_table2;
	
	create table temp_table as
	select val as kit;
	
	create table temp_table2 as 
  	SELECT unnest(kit) as kit FROM temp_table;	
	
	--Back up tag devices from enrollment_ref
	insert into untagging_history
	select hibernate_sequence.nextval pk, device_id, code, date(now())
	from enrollment_ref
	where code in 
	(
	 -- paste kittags here 
	 select kit 
	 from temp_table2
	);
	
	--	*Untag devices from enrollment_ref
	update enrollment_ref 
	set device_id = null 
	where code in (
	 -- paste kittags here 
		select kit 
		from temp_table2
	); 
	
	--	*Untag devices from device_tag_request
	update device_tag_request 
	set requested_device_id = null
	where kit_tag in 
	(
	 -- paste kittags here 
		select kit 
		from temp_table2
	);

end;
$BODY$;

ALTER FUNCTION public.untag(text[])
    OWNER TO seamfix;
	
	
	
	




