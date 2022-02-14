select distinct(msisdn), 
--	left(b.unique_id, 11) TAG, 
	e.code tag,
	b.unique_id,
	sim_serial,
	bfpsyncstatusenum,
	case when rejection_reason is null then 'N/A' else rejection_reason end as reason,
	case 
		when s.confirmation_status::text = '0' then 'PENDING'
		when s.confirmation_status::text = '1' then 'PUSHED'
	else 'N/A' end as mCentric_status,
	case when s.agility_push_timestamp::text is null then 'N/A' else s.agility_push_timestamp::text end as mCentric_time,
	coalesce(s.registration_timestamp::TEXT, 'N/A') registration_timestamp,
	coalesce(b.file_sync_date::text, 'N/A') file_sync_date
from bfp_sync_log b
left join sms_activation_request s on b.unique_id = s.unique_id
left join enrollment_ref e on b.enrollment_ref_fk = e.id
where msisdn like ?
order by bfpsyncstatusenum
;