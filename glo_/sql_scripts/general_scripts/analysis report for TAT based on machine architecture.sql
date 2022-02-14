
-- create table analysis14042020_ii as 
select s.enrollment_ref, n.machine_architecture,S.registration_timestamp,
	receipt_timestamp,
	S.agility_push_timestamp as confirmation_timestamp,
	bb.FILE_SYNC_DATE as FILE_SYNC_DATE,
round((extract(epoch from bb.FILE_SYNC_DATE) ::numeric - extract(epoch from s.registration_timestamp)::numeric)/60, 2 ) capture2sync_mins,
	round((extract(epoch from receipt_timestamp)::numeric  - extract(epoch from bb.FILE_SYNC_DATE)::numeric)/60, 2 ) sync2backend_mins,
	round((extract(epoch from receipt_timestamp)::numeric  - extract(epoch from S.registration_timestamp)::numeric)/60, 2 ) capture2backend_mins,
	round((extract(epoch from S.agility_push_timestamp) ::numeric - extract(epoch from receipt_timestamp)::numeric)/60,2) backend2mcentric,
	round((extract(epoch from S.agility_push_timestamp) ::numeric - extract(epoch from S.registration_timestamp)::numeric)/60,2) capture2mcentric,
	round((extract(epoch from S.agility_push_timestamp) ::numeric - extract(epoch from bb.FILE_SYNC_DATE)::numeric)/60,2) sync2mcentric
from sms_activation_request s, node n, bfp_sync_log bb
where s.unique_id = bb.unique_id
and bb.enrollment_ref_fk = n.enrollment_ref
and date(receipt_timestamp) = date(now())-1 
 group by 1,2,3,4,5,6