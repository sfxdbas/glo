
select MSISDN, create_date , check_date , (check_date - create_date) as SWAPTAT
from sim_swap_demographic ssd 
where date(create_date) = date(now)-1
and check_status = 'CHECKED'
;

select date(create_date),  
case 
	when swaptat2 between 0 and 5 then '0-5mins'
	when swaptat2 between 6 and 10 then '6-10mins'
	when swaptat2 between 11 and 30 then '11-30mins'
	when swaptat2 between 31 and 60 then '31mins-1hr'
	when swaptat2 between 61 and 1439 then 'greater_than_1hr'
	when swaptat2 > 1439 then 'greater_than_24 hrs'
	when swaptat2 is null then 'N/A'
else 'gt 24 hrs' end as duration,
count(1), round((count(1) / SUM(count(1)) OVER ())*100,2) AS "% of total"
from (
select MSISDN,ssd.create_date, check_date, asl.last_modified -- , (check_date - ssd.create_date) as SWAPTAT
,asl.last_modified -  check_date as swaptat3
,round((extract(epoch from asl.last_modified)::numeric - extract(epoch from ssd.check_date)::numeric)/60,2 ) as swaptat2
from sim_swap_demographic ssd, activation_sync_log asl 
where asl.record_id = ssd.pk
and date(ssd.create_date) = '2021-08-30'
and check_status = 'CHECKED'
and swap_status = 'SWAPPED'
) a
group by 1,2
order by 3 desc 
;

--So it'll be check date on Sim swap - last modified on ASL for the TAT right?

select * from sim_swap_demographic ssd
where  date(ssd.create_date) = '2021-08-30'
and check_status = 'CHECKED'
;


select date(create_date),  
round(avg(swaptat2) ,2) as mtts
from (
select MSISDN,ssd.create_date, check_date, asl.last_modified -- , (check_date - ssd.create_date) as SWAPTAT
,asl.last_modified -  check_date as swaptat3
,round((extract(epoch from asl.last_modified)::numeric - extract(epoch from ssd.check_date)::numeric)/60,2 ) as swaptat2
from sim_swap_demographic ssd, activation_sync_log asl 
where asl.record_id = ssd.pk
and date(ssd.create_date) = '2021-08-30'
and check_status = 'CHECKED'
and swap_status = 'SWAPPED'
) a
group by 1
--order by 3 desc 
;
