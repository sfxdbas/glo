-- v1

select
	distinct s.phone_number, s.unique_id, s.enrollment_ref, 
	case 
		when left(enrollment_ref,6) like 'GLO-DH%' then 'DROID'
		when left(enrollment_ref,6) like 'GLO-DN%' then 'WIN'
		when left(enrollment_ref,6) like 'GLO-FH%' then 'DROID'
		when left(enrollment_ref,6) like 'GLO-FR%' then 'WIN'
		when left(enrollment_ref,6) like 'GLO-HH%' then 'DROID'
		when left(enrollment_ref,6) like 'GLO-NB%' then 'WIN'
	else enrollment_ref end device_type,
	s.registration_timestamp, 
	round(extract(hour from s.registration_timestamp)::numeric,2) reg_hour,
	s.receipt_timestamp,to_char(s.receipt_timestamp, 'MM-DD') sync_day,
	s.agility_push_timestamp confirmation_timestamp, 
	case 
		when s.confirmation_status::text = '1' then 'PUSHED'
		when s.confirmation_status::text = '0' then 'PENDING'
	else s.confirmation_status::text end, s.registration_type reg_type,
	b.file_sync_date, round(extract(hour from b.file_sync_date)::numeric,2) sync_hour,
	st.name reg_state, m.app_version,s.status,/*channel, sftp_server*/
	e.device_id,
	round((extract(epoch from b.file_sync_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60,2) capture2sync_mins,
	round((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.receipt_timestamp)::numeric)/60,2) sync2mcentric
from sms_activation_request s,bfp_sync_log b , enrollment_ref e,
	 state st ,bid_view bv, meta_data m 
where s.enrollment_ref = e.code
and b.enrollment_ref_fk = e.id
and s.unique_id = b.unique_id
and b.unique_id = bv.unique_id
and st.id = s.state_id
and bv.id = m.basic_data_fk
and b.bfpsyncstatusenum ='SUCCESS'
and date(s.receipt_timestamp) >= '2020-03-20'
and date(s.receipt_timestamp) <= '2020-03-25'
;








-- v2

select
	/*+ parallel */
	distinct S.phone_number,
	S.unique_id,
	s.enrollment_ref,
	( case
		when s.enrollment_ref like 'DR%' then 'DROID'
		else 'WINDOWS'
	end ) DEVICE_TYPE,
	S.registration_timestamp
	receipt_timestamp,
	S.receipt_timestamp as  sync_date,
	S.agility_push_timestamp as confirmation_timestamp,
	S.REGISTRATION_TYPE,
	bb.FILE_SYNC_DATE as FILE_SYNC_DATE,
	d.DDA9 as REG_CITY,
	state.NAME as REG_STATE,
	App_Version,
	( case
		when DA14 = 'UNVERIFIED' then 'OFFLINE'
		else 'ONLINE'
	end ) as STATUS,
	regexp_substr( bb.TARGET_PATH,
	'[^\]+',
	1,
	1 ) as SFTP_SERVER,
	( case
		when target_path like '\\10%' then 'LAN'
		else 'DMZ'
	end ) as CHANNEL,
	m.REALTIME_DEVICE_ID,
	round((extract(epoch from bb.FILE_SYNC_DATE)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60, 2 ) capture2sync_mins,
	round((extract(epoch from s.agility_push_timestamp)::numeric - extract(epoch from s.receipt_timestamp)::numeric)/60,2) sync2mcentric
	round((extract(epoch from s.Receipt_Timestamp)::numeric  - extract(epoch from bb.File_Sync_Date)::numeric)/60, 2 ) sync2backend_mins,
	round((extract(epoch from s.receipt_timestamp)::numeric  - extract(epoch from s.registration_timestamp)::numeric)/60, 2 )
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
	date(s.receipt_timestamp) >= '2020-03-20'
	and date(s.receipt_timestamp) <= '2020-03-25'
	and bb.FILE_SYNC_DATE is not null
	--and m.App_Version not  in ('3.0','2.10','2.5')
	and bb.BFPSYNCSTATUSENUM = 'SUCCESS'
;
























-- v3


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