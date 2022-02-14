create table pop_08_11_042020 as
SELECT msisdn, rejection_reason as quarantine_reason, left(unique_id,11) as kittag, b.device_id, e.code,max(s.name) as state, max(l.name) as lga
, b.create_date,file_sync_date
FROM BFP_SYNC_LOG b, enrollment_ref e , node n, node_assignment na, state s, lga l
where left(b.unique_id,11) = e.code
and n.enrollment_ref = e.id
and n.id = na.node_fk
and na.state_fk = s.id
and na.lga_fk = l.id
and REJECTION_REASON = 'PICTURE OF PICTURE'
 and date(b.create_date) >= '2020-04-08'
 and date(b.create_date) <= '2020-04-10'
group by msisdn, rejection_reason, left(unique_id,11) , b.device_id, e.code ,b.create_date,file_sync_date
--  LIMIT 10





 SELECT msisdn, rejection_reason as quarantine_reason, left(unique_id,11) as kittag, b.device_id, e.code,max(s.name) as state, max(l.name) as lga
 , b.create_date,file_sync_date
 FROM BFP_SYNC_LOG b, enrollment_ref e , node n, node_assignment na, state s, lga l
 where left(b.unique_id,11) = e.code
 and n.enrollment_ref = e.id
 and n.id = na.node_fk
 and na.state_fk = s.id
 and na.lga_fk = l.id
 and REJECTION_REASON = 'PICTURE OF PICTURE'
  and date(b.create_date) >= '2020-04-08'
  and date(b.create_date) <= '2020-04-10'
 group by msisdn, rejection_reason, left(unique_id,11) , b.device_id, e.code ,b.create_date,file_sync_date