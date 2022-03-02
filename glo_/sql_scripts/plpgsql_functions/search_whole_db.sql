-- FUNCTION: public.search_whole_db(text)

-- DROP FUNCTION public.search_whole_db(text);

CREATE OR REPLACE FUNCTION public.search_whole_db(
	_like_pattern text)
RETURNS TABLE(_tbl regclass, _ctid tid) 
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    ROWS 1000
    
AS $BODY$
BEGIN
   FOR _tbl IN
      SELECT c.oid::regclass
      FROM   pg_class c
      JOIN   pg_namespace n ON n.oid = relnamespace
      WHERE  c.relkind = 'r'                           -- only tables
      AND    n.nspname !~ '^(pg_|information_schema)'  -- exclude system schemas
      ORDER BY n.nspname, c.relname
   LOOP
      RETURN QUERY EXECUTE format(
         'SELECT $1, ctid FROM %s t WHERE t::text ~~ %L'
       , _tbl, '%' || _like_pattern || '%')
      USING _tbl;
   END LOOP;
END
$BODY$;

ALTER FUNCTION public.search_whole_db(text)
    OWNER TO seamfix;
