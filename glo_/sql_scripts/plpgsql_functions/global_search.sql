-- FUNCTION: public.global_search(text, text[], text[], text)

-- DROP FUNCTION public.global_search(text, text[], text[], text);

CREATE OR REPLACE FUNCTION public.global_search(
	search_term text,
	param_tables text[] DEFAULT '{}'::text[],
	param_schemas text[] DEFAULT '{public}'::text[],
	progress text DEFAULT NULL::text)
RETURNS TABLE(schemaname text, tablename text, columnname text, rowctid tid) 
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    ROWS 1000
    
AS $BODY$
declare
  query text;
  hit boolean;
begin
  FOR schemaname,tablename IN
      SELECT t.table_schema, t.table_name
      FROM   information_schema.tables t
	JOIN information_schema.table_privileges p ON
	  (t.table_name=p.table_name AND t.table_schema=p.table_schema
	      AND p.privilege_type='SELECT')
	JOIN information_schema.schemata s ON
	  (s.schema_name=t.table_schema)
      WHERE (t.table_name=ANY(param_tables) OR param_tables='{}')
        AND t.table_schema=ANY(param_schemas)
        AND t.table_type='BASE TABLE'
  LOOP
    IF (progress in ('tables','all')) THEN
      raise info '%', format('Searching globally in table: %I.%I',
         schemaname, tablename);
    END IF;

    query := format('SELECT ctid FROM %I.%I AS t WHERE strpos(cast(t.* as text), %L) > 0',
	    schemaname,
	    tablename,
	    search_term);
    FOR rowctid IN EXECUTE query
    LOOP
      FOR columnname IN
	  SELECT column_name
	  FROM information_schema.columns
	  WHERE table_name=tablename
	    AND table_schema=schemaname
      LOOP
	query := format('SELECT true FROM %I.%I WHERE cast(%I as text)=%L AND ctid=%L',
	  schemaname, tablename, columnname, search_term, rowctid);
        EXECUTE query INTO hit;
	IF hit THEN
	  IF (progress in ('hits', 'all')) THEN
	    raise info '%', format('Found in %I.%I.%I at ctid %s',
		   schemaname, tablename, columnname, rowctid);
	  END IF;
	  RETURN NEXT;
	END IF;
      END LOOP; -- for columnname
    END LOOP; -- for rowctid
  END LOOP; -- for table
END;
$BODY$;

ALTER FUNCTION public.global_search(text, text[], text[], text)
    OWNER TO seamfix;
