-->> quarantined and successsful report scripts  <<--

--> Failed registration

select rejection_reason,
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (0,1,2) then true else false end ) as "12 - 2 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (3,4,5) then true else false end ) as "3 - 5 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (6,7,8) then true else false end ) as "6 - 8 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (9,10,11) then true else false end ) as "9 - 11 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (12,13,14) then true else false end ) as "12 - 2 PM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (15,16,17) then true else false end ) as "3 - 5 PM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (18,19,20) then true else false end ) as "6 - 8 PM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (21,22,23) then true else false end ) as "9 - 11 PM"
 	, count(1) total
from bfp_sync_log
where bfpsyncstatusenum = 'ERROR'
and rejection_reason is not null
and DATE(CREATE_DATE) = DATE(NOW())
group by 1
--union all
--select 'TOTAL',2.0, COUNT(1)
--from bfp_sync_log
--where bfpsyncstatusenum = 'ERROR'
--and rejection_reason is not null
order by 1
;


--> Successful registration

select case when rejection_reason is null then 'SUCCESSFUL REGISTRATION' else REJECTION_REASON end as Type,
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (0,1,2) then true else false end ) as "12 - 2 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (3,4,5) then true else false end ) as "3 - 5 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (6,7,8) then true else false end ) as "6 - 8 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (9,10,11) then true else false end ) as "9 - 11 AM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (12,13,14) then true else false end ) as "12 - 2 PM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (15,16,17) then true else false end ) as "3 - 5 PM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (18,19,20) then true else false end ) as "6 - 8 PM",
 	SUM(case when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) in (21,22,23) then true else false end ) as "9 - 11 PM"
 	, count(1) total
from bfp_sync_log
where bfpsyncstatusenum = 'SUCCESS'
and DATE(CREATE_DATE) = DATE(NOW())
group by 1


--> Quarantined records details

-- schedule report at :59 
select rejection_reason, msisdn, e.device_id, e.code as kittag ,create_date
from bfp_sync_log b, enrollment_ref e
where b.enrollment_ref_fk = e.id
and bfpsyncstatusenum = 'ERROR'
and rejection_reason is not null
and date(create_date) = date(now())
--and case 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 0 and 2 then true 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 3 and 5 then true 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 6 and 8 then true 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 9 and 11 then true 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 12 and 14 then true 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 15 and 17 then true 
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 18 and 20 then true
--		when ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) between 21 and 23 then true 
----(ROUND(EXTRACT(hour from now()-69)::numeric,2)-2, ROUND(EXTRACT(hour from now()-69)::numeric,2)-1, ROUND(EXTRACT(hour from now()-69)::numeric,2))  
----then true 
--	else false end
and ROUND(EXTRACT(hour from CREATE_DATE)::numeric,2) = ROUND(EXTRACT(hour from now())::numeric,2)
order by create_date;


