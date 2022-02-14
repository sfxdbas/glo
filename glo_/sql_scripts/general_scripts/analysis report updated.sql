select
	/*+ parallel */
	distinct S.phone_number,
	S.unique_id,
	s.enrollment_ref,
	( case
		when m.app_version = '1.00' then 'DROID'
		else 'WIN'
	end ) DEVICE_TYPE,
	S.registration_timestamp,
	receipt_timestamp,
	round(extract(day from receipt_timestamp)::numeric) ||'-'|| left(initcap(to_char(receipt_timestamp, 'month')),3) as sync_day,
	round(extract(hour from receipt_timestamp)::numeric) as  sync_hour,
	S.agility_push_timestamp as confirmation_timestamp,
	S.REGISTRATION_TYPE,
	bb.FILE_SYNC_DATE as FILE_SYNC_DATE,
	d.DDA9 as REG_CITY,
	state.NAME as REG_STATE,
	App_Version,
	( case
		when m.registration_network_status  = 'OFF' then 'OFFLINE'
		else 'ONLINE'
	end ) as STATUS,
	( case
		when target_path like '\\10%' then 'LAN'
		else 'DMZ'
	end ) as CHANNEL,
	m.REALTIME_DEVICE_ID,
	round((extract(epoch from bb.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60, 2 ) capture2sync_mins,
	round((extract(epoch from s.Receipt_Timestamp)::numeric  - extract(epoch from bb.File_Sync_Date)::numeric)/60, 2 ) sync2backend_mins,
	round((extract(epoch from s.receipt_timestamp)::numeric  - extract(epoch from s.registration_timestamp)::numeric)/60, 2 ) capture2backend_mins,
	round((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.receipt_timestamp)::numeric)/60,2) backend2mcentric,
	round((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60,2) capture2mcentric,
	round((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from bb.File_Sync_Date)::numeric)/60,2) sync2mcentric
from
	meta_data m
join basic_data b on
	m.basic_data_fk = b.id
join dynamic_data d on
	d.basic_data_fk = m.basic_data_fk
join user_id u on
	b.user_id_fk = u.id
join sms_activation_request s on
	s.unique_id = u.unique_id
join bfp_sync_log bb on
	s.unique_id = bb.unique_id
join state on
	state.id = s.sTate_id
where
	date(s.receipt_timestamp) >= ?
	and date(s.receipt_timestamp) <= ?
and 
	bb.FILE_SYNC_DATE is not null
	--and m.App_Version not  in ('3.0','2.10','2.5')
	and bb.BFPSYNCSTATUSENUM = 'SUCCESS'
;