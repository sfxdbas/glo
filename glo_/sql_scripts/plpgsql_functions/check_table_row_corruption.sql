-- FUNCTION: public.check_table_row_corruption(text, text)

-- DROP FUNCTION public.check_table_row_corruption(text, text);

CREATE OR REPLACE FUNCTION public.check_table_row_corruption(
	schemaname text,
	tablename text)
RETURNS void
    LANGUAGE 'plpgsql'
    VOLATILE 
    COST 100
    
AS $BODY$
 DECLARE
  rec RECORD;
  tmp RECORD;
  tmp_text TEXT;
 BEGIN
  FOR rec IN EXECUTE format($q$
   SELECT '(' || b || ','|| generate_series(0,292) || ')' AS generated_tid
    FROM generate_series(0, pg_relation_size('%I.%I')/current_setting('block_size')::integer) b
  $q$, schemaname, tablename)
  LOOP
  BEGIN
   BEGIN
    EXECUTE 'SELECT * FROM '
      || quote_ident(schemaname) || '.' || quote_ident(tablename)
      || ' WHERE ctid = ''' || rec.generated_tid || '''::tid'
     INTO tmp;
 
    tmp_text := tmp::text;
   EXCEPTION WHEN OTHERS THEN
   BEGIN
    INSERT INTO edb_corrupted_rows VALUES(schemaname, tablename, rec.generated_tid::tid, SQLSTATE::text, SQLERRM::text);
   END;
   END;
  END;
  END LOOP;
 END;
 $BODY$;

ALTER FUNCTION public.check_table_row_corruption(text, text)
    OWNER TO seamfix;
