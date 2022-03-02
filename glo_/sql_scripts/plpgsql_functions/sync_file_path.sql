-- FUNCTION: public.sync_file_path(character varying, character varying)

-- DROP FUNCTION public.sync_file_path(character varying, character varying);

CREATE OR REPLACE FUNCTION public.sync_file_path(
	uniqueid_ character varying,
	number_ character varying)
RETURNS TABLE(phone_number character varying, uniqueid character varying, status character varying, quarantine_reason character varying, targetpath character varying, filename character varying) 
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    ROWS 1000
    
AS $BODY$ begin return QUERY
select
	msisdn, unique_id, bfpsyncstatusenum, rejection_reason, target_path, file_name
 FROM BFP_SYNC_LOG 
WHERE UNIQUE_ID  = $1 and msisdn  like $2;
end;
$BODY$;

ALTER FUNCTION public.sync_file_path(character varying, character varying)
    OWNER TO seamfix;
