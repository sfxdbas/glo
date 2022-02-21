select
	distinct(msisdn),
	create_date,
	left(unique_id, 11) as kittag,
	unique_id,
	sim_serial,
	rejection_reason as quarantine_reason
from bfp_sync_log
where bfpsyncstatusenum = 'ERROR'
and date(create_date) = date(now())-1
order by create_date;