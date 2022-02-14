** for eyeballing previous month 

-- 1
SELECT 'Total Eyeballed' as eyeballing, count(1) 
FROM EYEBALLING
where extract(month from create_date) = extract(month from now()-1)
union all
SELECT case
		when status = 'Invalid' then 'Total Invalid'
		when status = 'Valid' then 'Total Valid'
		when status = 'Unreg' then 'Total Unregistered'
		else status end as status,
	  count(1)
FROM EYEBALLING
where extract(month from create_date) = extract(month from now()-1)
group by status 
;



-- 2
SELECT i.description as invalid_eyeballing_breakdown, count(1) 
FROM EYEBALLING e, infraction i 
where e.infraction_fk = i.pk
and extract(month from e.create_date) = extract(month from now()-1)
and status = 'Invalid'
group by 1
;



-- 3 **put in another report
SELECT -- k.email_address,
b.agent_email_address,
count(1)
FROM EYEBALLING e, -- km_user k 
 bfp_sync_log b
where --e.kmuser_pk = k.pk 
e.bfp_sync_log_fk = b.pk 
and extract(month from e.create_date) = extract(month from now()-1)
group by 1 
order by 2 desc 
;


-- 4
select	case 
			when release_status = 'QUARANTINED' then 'Total Quarantined'
			when release_status = 'RELEASED' then 'Total Released'
			when release_status = 'PENDING' then 'Total Pending'
		else release_status  end as status 
	,	count(1)
from	quarantined_registration
where	extract(month from create_date) = extract(month from now()-1)
group by 1
;