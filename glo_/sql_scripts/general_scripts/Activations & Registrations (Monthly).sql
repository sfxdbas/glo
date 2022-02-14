select msisdn, create_date as syncdate, coalesce(activation_date::text, 'NA') as activationdate
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and extract(year from create_date) = extract(year from now)
and extract(month from create_date) = extract(month from now - interval '1 month')
;