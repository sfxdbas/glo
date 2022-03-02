-- FUNCTION: public.create_setting_v4(text[])

-- DROP FUNCTION public.create_setting_v4(text[]);

CREATE OR REPLACE FUNCTION public.create_setting_v4(
	device_id text[])
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$

DECLARE
  a_count integer;

begin 
	
	-- drop tables to hold the temporary records
	drop table if exists temp_setting_table;
	drop table if exists temp_setting_table2;
	
	create table temp_setting_table as
	select device_id as device_ids;
	
	create table temp_setting_table2 as 
  	SELECT unnest(device_ids) as device_ids FROM temp_setting_table;
  	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were inserted', a_count ;

  
  	-- create setting to devices
	INSERT INTO public.device_specific_setting
	(pk, active, create_date, deleted, last_modified, setting_name, setting_value, enrollment_ref_fk)
	select hibernate_sequence.nextval, true, now, false, now, 'IMPROVED_NIN_VERIFICATION_USE_CASES', 'NMS,RR,SS,CN,CR,AR', id 
	from enrollment_ref er
	where er.device_id in 
	(select device_ids from temp_setting_table2)
	ON CONFLICT (setting_name, enrollment_ref_fk) 
	DO update set setting_value = excluded.setting_value, last_modified = now;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	INSERT INTO public.device_specific_setting
	(pk, active, create_date, deleted, last_modified, setting_name, setting_value, enrollment_ref_fk)
	select hibernate_sequence.nextval, true, now, false, now, 'PILOT-NIN-VERIFICATION-TYPES', 'SEARCH_BY_NIN,NIN_AND_FINGERPRINT', id
	from enrollment_ref er
	where er.device_id in 
	(select device_ids from temp_setting_table2)
	ON CONFLICT (setting_name, enrollment_ref_fk) 
	DO update set setting_value = excluded.setting_value, last_modified = now;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	INSERT INTO public.device_specific_setting
	(pk, active, create_date, deleted, last_modified, setting_name, setting_value, enrollment_ref_fk)
	select hibernate_sequence.nextval, true, now, false, now, 'PILOT-AVAILABLE-USE-CASE', 'NMS,RR,SS,CN,CR,AR', id 
	from enrollment_ref er
	where er.device_id in 
	(select device_ids from temp_setting_table2)
	ON CONFLICT (setting_name, enrollment_ref_fk) 
	DO update set setting_value = excluded.setting_value, last_modified = now;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	INSERT INTO public.device_specific_setting
	(pk, active, create_date, deleted, last_modified, setting_name, setting_value, enrollment_ref_fk)
	select hibernate_sequence.nextval, true, now, false, now, 'PILOT-IMPROVED-NIN-VERIFICATION-USE-CASES', 'NMS,RR,SS,CN,CR,AR', id
	from enrollment_ref er
	where er.device_id in 
	(select device_ids from temp_setting_table2)
	ON CONFLICT (setting_name, enrollment_ref_fk) 
	DO update set setting_value = excluded.setting_value, last_modified = now;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	INSERT INTO public.device_specific_setting
	(pk, active, create_date, deleted, last_modified, setting_name, setting_value, enrollment_ref_fk)
	select hibernate_sequence.nextval, true, now, false, now, 'PILOT-NIN-VERIFICATION-USE-CASES', 'NMS,RR,SS,CN,CR,AR', id 
	from enrollment_ref er
	where er.device_id in 
	(select device_ids from temp_setting_table2)
	ON CONFLICT (setting_name, enrollment_ref_fk) 
	DO update set setting_value = excluded.setting_value, last_modified = now; 
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;


	            
end;
$BODY$;

ALTER FUNCTION public.create_setting_v4(text[])
    OWNER TO seamfix;
