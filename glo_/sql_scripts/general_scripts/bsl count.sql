--create table bsl_count as 
select count(bsl.pk) as rowCount, max(pk) as maxid   from 
bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
;


select rowcount, maxid
from bsl_count
;

with count_latest as (
select count(bsl.pk) as rowCount, max(pk) as maxid  
from bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.pk >
(select maxid from bsl_count)
) 
select cl.rowcount as clrowcount, cl.maxid as clmaxid,  bc.rowcount as bcrowcount, bc.maxid as bcmaxid
from count_latest cl, bsl_count bc
;


with count_latest as (
select count(bsl.pk) as rowCount, max(pk) as maxid   from 
bfp_sync_log bsl 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.pk >
(select maxid from bsl_count)
) 
update bsl_count bc
set bc.rowcount = bc.rowcount+cl.rowcount,
	bc.maxid = cl.maxid
from count_latest cl
;


