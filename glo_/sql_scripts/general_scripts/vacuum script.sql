
select 'vacuum analyze ' ||table_name ||';'
from information_schema.tables 
where table_schema = 'public'
and table_type like '%TABLE%'
and table_name like '%zz%'
order by table_name 
;

