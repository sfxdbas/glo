-- FUNCTION: public.change_status_unique_id(character varying, character varying, character varying)

-- DROP FUNCTION public.change_status_unique_id(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.change_status_unique_id(
	status_1 character varying,
	unique_id_1 character varying,
	msisdn_1 character varying)
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$

DECLARE
  a_count integer;
--  b_count integer;

begin 

with tbl as (
select rank() over (partition by msisdn order by pk desc ), * 
from msisdn_provision_status mps 
where msisdn = msisdn_1
order by 3 desc 
) 
update msisdn_provision_status mps
set status = status_1, unique_id = unique_id_1, last_modified = now()
from tbl 
where tbl.pk = mps.pk 
and rank = 1
;
GET DIAGNOSTICS a_count = ROW_COUNT;

RAISE NOTICE '% rows were affected', a_count ;

end;
$BODY$;

ALTER FUNCTION public.change_status_unique_id(character varying, character varying, character varying)
    OWNER TO seamfix;
