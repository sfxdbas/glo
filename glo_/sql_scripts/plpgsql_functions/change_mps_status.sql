-- FUNCTION: public.change_mps_status(character varying, text[])

-- DROP FUNCTION public.change_mps_status(character varying, text[]);

CREATE OR REPLACE FUNCTION public.change_mps_status(
	status_ character varying,
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
	drop table if exists temp_mps_hold_msisdn;
	drop table if exists temp_mps_hold_msisdn2;
	
	create table temp_mps_hold_msisdn as
	select msisdn as msisdns;
	
	create table temp_mps_hold_msisdn2 as 
  	SELECT unnest(msisdns) as msisdns FROM temp_mps_hold_msisdn;
  	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were inserted', a_count ;
	
	-- create logs
	insert into msisdn_provision_status_log
	select hibernate_sequence.nextval pk, true active, now create_date,false deleted,now last_modified,mps.imsi,mps.msisdn,
	'MANUAL-MSISDN-OPERATION' operaion_channel, 'MANUAL-MSISDN-OPERATION' operation_name,mps.sim_serial,mps.status,mps.status_reason,
	mps.pk msisdn_provision_status_fk,mps.platform,mps.unique_id,mps.delta_imsi,mps.delta_sim_serial,mps.msisdn_hierarchy,mps.sim_swap_status
	from msisdn_provision_status mps 
	where mps.msisdn in 
	(select msisdns from temp_mps_hold_msisdn2)
	;
  
  	-- update mps
	update msisdn_provision_status mps
	set status = status_,  last_modified = now
	where mps.msisdn in 
	(select msisdns from temp_mps_hold_msisdn2)
	;
	GET DIAGNOSTICS a_count = ROW_COUNT;

	RAISE NOTICE '% rows were affected', a_count ;

	            
end;
$BODY$;

ALTER FUNCTION public.change_mps_status(character varying, text[])
    OWNER TO seamfix;
