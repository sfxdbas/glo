-- file name
select file_name
from incremental_dump_log idl 
where date("date") = '2021-10-14'
limit 1 
;

-- date dumped
select date_dumped 
from incremental_dump_log idl 
where date("date") = '2021-10-14'
limit 1 
;

-- date processed
select date_processed 
from incremental_dump_log idl 
where date("date") = '2021-10-14'
limit 1 
;

-- total records 
select count(1) 
from incremental_dump_log idl 
where date("date") = '2021-10-14'
limit 1 
;

-- Trend of dumped & processed records 
select "date", 'date_dumped' as metric,count(1)
from incremental_dump_log idl 
where date("date") >= date(now) - interval '30 days'
group by "date" 
union all 
select "date", 'date_processed' as metric,count(1)
from incremental_dump_log idl 
where date("date") >= date(now) - interval '30 days'
group by "date" 
order by "date",2
;

={{day_}}