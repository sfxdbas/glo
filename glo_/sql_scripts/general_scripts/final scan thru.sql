select table_schema, table_name, column_name, data_type -- column_name,data_type 
from information_schema.columns 
where table_schema  = 'public'
and data_type = 'oid'
order by table_schema, table_name, column_name , data_type 
;