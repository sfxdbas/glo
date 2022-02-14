create or replace function ota(app_version numeric, device_id text[])
returns void 
language 'plpgsql'
as $body$
begin 
	
	--drop table to hold temporary device ids
	drop table if exists temp_dev_id;
	drop table if exists temp_dev_id2;

	create table temp_dev_id as
	select device_id as dev_id;
	
	create table temp_dev_id2 as 
  	SELECT unnest(dev_id) as dev_id FROM temp_dev_id;
  
  	--create entry in kit marker as OTA
  	insert into kit_marker
	select hibernate_sequence.nextval,app_version,now,e.device_id, mac_address,code,990
	from enrollment_ref  e
	where e.device_id in 
	(
		select dev_id from temp_dev_id2
	)
	;
	
end;
$body$;



SELECT public.ota(null,'{DELLINC.-59FHY32}');


select * from kit_marker km order by 3 desc ;