with hour__ as (
select	1 as hour_	union all
select	2	union all
select	3	union all
select	4	union all
select	5	union all
select	6	union all
select	7	union all
select	8	union all
select	9	union all
select	10	union all
select	11	union all
select	12	union all
select	13	union all
select	14	union all
select	15	union all
select	16	union all
select	17	union all
select	18	union all
select	19	union all
select	20	union all
select	21	union all
select	22	union all
select	23	union all
select	24	
),date__ as (
select '2022-03-21' as date_ union all 
select '2022-03-22' as date_ 
union all 
select '2022-03-23' as date_ union all 
select '2022-03-24' as date_ union all 
select '2022-03-25' as date_ 
),
tab1 as (
select date(create_date) dt, date_part('hour',create_date) hr, count(1)
from sim_swap_demographic ssd 
where date(create_date) between '2022-03-21' and '2022-03-25'
group by 1,2
order by 1,2
),
combo_ as (select * 
from  hour__, date__)
,tab2 as (
select date(create_date) dt,date_part('hour', create_date) hr, count(*)
from agility_integration_log_ 
where request_type = 'ODS_ACCOUNT_QUERY_INFO' 
and date(create_date) between '2022-03-21' and '2022-03-25'
group by 1,2
order by 1,2
)
select date_,hour_,coalesce(tab1.count, 0) as ssd_count, coalesce(tab2.count, 0) as ail_count 
from combo_
left join tab1 on (tab1.dt = combo_.date_ and tab1.hr = combo_.hour_)
left join tab2 on (tab2.dt = combo_.date_ and tab2.hr = combo_.hour_)
order by date_,hour_
;
