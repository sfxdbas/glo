
with days as (
select 	1   as daily_	from dual union all
select 	2	from dual union all
select 	3	from dual union all
select 	4	from dual union all
select 	5	from dual union all
select 	6	from dual union all
select 	7	from dual union all
select 	8	from dual union all
select 	9	from dual union all
select 	10	from dual union all
select 	11	from dual union all
select 	12	from dual union all
select 	13	from dual union all
select 	14	from dual union all
select 	15	from dual union all
select 	16	from dual union all
select 	17	from dual union all
select 	18	from dual union all
select 	19	from dual union all
select 	20	from dual union all
select 	21	from dual union all
select 	22	from dual union all
select 	23	from dual union all
select 	24	from dual union all
select 	25	from dual union all
select 	26	from dual union all
select 	27	from dual union all
select 	28	from dual union all
select 	29	from dual union all
select 	30	from dual union all
select 	31	from dual 
), ER as (
select u.user_id, s.checker_user_id, s.device_tag as kit_tag, count(s.pk) as count_of_swapped, Extract(day from s.create_date)  as day_in_month 
from sim_swap_demographic s 
join km_user u on u.email_address = s.agent_email 
where (s.swap_status) = 'SWAPPED' and (s.check_status) = 'CHECKED'
and extract(year from s.create_date) = extract(year from now )
and extract(month from s.create_date) = extract(month from now )
and date(s.create_date) <= date(now)-1
group by u.user_id, s.checker_user_id, s.device_tag, Extract(day from s.create_date), Extract(month from s.create_date)
), mg as (
select er.user_id, er.checker_user_id, er.kit_tag, er.count_of_swapped, d.daily_ as days_in_month
from days d 
left join er on d.daily_ = er.day_in_month)
select mg.user_id, mg.checker_user_id,mg.kit_tag as deviceid, --mg.kit_tag,
sum(case when (mg.days_in_month = 1) then count_of_swapped else 0 end) as "-01",
sum(case when (mg.days_in_month = 2) then count_of_swapped else 0 end) as "-02",
sum(case when (mg.days_in_month = 3) then count_of_swapped else 0 end) as "-03",
sum(case when (mg.days_in_month = 4) then count_of_swapped else 0 end) as "-04",
sum(case when (mg.days_in_month = 5) then count_of_swapped else 0 end) as "-05",
sum(case when (mg.days_in_month = 6) then count_of_swapped else 0 end) as "-06",
sum(case when (mg.days_in_month = 7) then count_of_swapped else 0 end) as "-07",
sum(case when (mg.days_in_month = 8) then count_of_swapped else 0 end) as "-08",
sum(case when (mg.days_in_month = 9) then count_of_swapped else 0 end) as "-09",
sum(case when (mg.days_in_month = 10) then count_of_swapped else 0 end) as "-10",
sum(case when (mg.days_in_month = 11) then count_of_swapped else 0 end) as "-11",
sum(case when (mg.days_in_month = 12) then count_of_swapped else 0 end) as "-12",
sum(case when (mg.days_in_month = 13) then count_of_swapped else 0 end) as "-13",
sum(case when (mg.days_in_month = 14) then count_of_swapped else 0 end) as "-14",
sum(case when (mg.days_in_month = 15) then count_of_swapped else 0 end) as "-15",
sum(case when (mg.days_in_month = 16) then count_of_swapped else 0 end) as "-16",
sum(case when (mg.days_in_month = 17) then count_of_swapped else 0 end) as "-17",
sum(case when (mg.days_in_month = 18) then count_of_swapped else 0 end) as "-18",
sum(case when (mg.days_in_month = 19) then count_of_swapped else 0 end) as "-19",
sum(case when (mg.days_in_month = 20) then count_of_swapped else 0 end) as "-20",
sum(case when (mg.days_in_month = 21) then count_of_swapped else 0 end) as "-21",
sum(case when (mg.days_in_month = 22) then count_of_swapped else 0 end) as "-22",
sum(case when (mg.days_in_month = 23) then count_of_swapped else 0 end) as "-23",
sum(case when (mg.days_in_month = 24) then count_of_swapped else 0 end) as "-24",
sum(case when (mg.days_in_month = 25) then count_of_swapped else 0 end) as "-25",
sum(case when (mg.days_in_month = 26) then count_of_swapped else 0 end) as "-26",
sum(case when (mg.days_in_month = 27) then count_of_swapped else 0 end) as "-27",
sum(case when (mg.days_in_month = 28) then count_of_swapped else 0 end) as "-28",
sum(case when (mg.days_in_month = 29) then count_of_swapped else 0 end) as "-29",
sum(case when (mg.days_in_month = 30) then count_of_swapped else 0 end) as "-30",
sum(case when (mg.days_in_month = 31) then count_of_swapped else 0 end) as "-31"
from mg
group by mg.user_id, mg.checker_user_id,mg.kit_tag
order by 3,1, 2;
         