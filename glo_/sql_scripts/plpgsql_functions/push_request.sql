-- FUNCTION: public.push_request(text[])

-- DROP FUNCTION public.push_request(text[]);

CREATE OR REPLACE FUNCTION public.push_request(
	num text[])
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$
begin

	drop table if exists temp_push;
	drop table if exists temp_push2;
	
	create table temp_push as 
	select num as phone_number;
	
	create table temp_push2 as
	select unnest(phone_number) as phone_number from temp_push;
	
	-->insert into the consolidated repush table 
	insert into repush_request
	select
		hibernate_sequence.nextval pk, current_timestamp date_time_of_repush,	b.id basic_data_fk, m.msisdn,	m.serial, u.unique_id 
	from
		basic_data b, user_id u, msisdn_detail m, sms_activation_request s
	where
		s.unique_id = u.unique_id
		and m.basic_data_fk = b.id
		and b.user_id_fk = u.id
		and right( s.phone_number, 10 ) = right( m.msisdn, 10 )
		and right( phone_number, 10 ) in 
	(
		select right(phone_number, 10)
		from temp_push2
	);
	
	---> push to mCentric
	insert into agility_push_status
	 (pk, active,create_date, deleted, last_modified, basic_data_fk,msisdn, serial,status, unique_id)
	with t1 as (
	select
		hibernate_sequence.nextval, true, current_timestamp, false as _, current_timestamp,	b.id, m.msisdn,	m.serial, 'PENDING', u.unique_id ,
		receipt_timestamp, rank() over ( partition by msisdn order by receipt_timestamp desc ),	s.customer_name
	from
		basic_data b, user_id u, msisdn_detail m, sms_activation_request s
	where
		s.unique_id = u.unique_id
		and m.basic_data_fk = b.id
		and b.user_id_fk = u.id
		and right( s.phone_number, 10 ) = right( m.msisdn, 10 )
		and right( phone_number, 10 ) in 
	(
		select right(phone_number, 10)
		from temp_push2
	)
	) 
	select nextval, bool, current_timestamp, _, current_timestamp, id, msisdn, serial, "?column?", unique_id
	from t1
	where rank = 1
	;

end;
$BODY$;

ALTER FUNCTION public.push_request(text[])
    OWNER TO seamfix;
