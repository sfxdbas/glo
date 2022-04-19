-- reworked queries

select coalesce(count(na.pk), 0) as rowcount
from node n 
join node_assignment na on n.id = na.node_fk
where not exists  (
select 1
from DEALER_EXCLUSION_LIST del 
where del.dealer_fk=na.kyc_dealer_fk)
and exists (
select 1
from simrop_registration_trend srt
where srt.node_id = na.node_fk
and date(sync_date) >= '2022-04-18')
and n.deleted is false
;
