-- total regs & re-regs [CHANNEL] **uncomment dt.name and code**
select  
	dt."name" as channel, er.code as kittag,
	sum(case when bfpsyncstatusenum = 'SUCCESS' then true else false end) as total_registrations,
	sum(case when bfpsyncstatusenum = 'SUCCESS' and reg_type like 'RR%' then true else false end) as total_RE_registrations
from bfp_sync_log bsl, enrollment_ref er, node n, node_assignment na, kyc_dealer kd, dealer_type dt 
where bsl.enrollment_ref_fk = er.id 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.kyc_dealer_fk = kd.pk 
and kd.dealer_type_fk = dt.pk 
and bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2020-10-01' and '2020-10-31'
--and dt."name" = 'insert_dealer_type_here'
--and er.code = 'insert_kit_tag_here'
group by dt."name",er.code 
;

-- total swapped [CHANNEL]
select dt."name" as channel, device_tag as kittag, count(1) total_swapped
from sim_swap_demographic ssd, enrollment_ref er, node n, node_assignment na, kyc_dealer kd, dealer_type dt 
where ssd.device_tag = er.code 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.kyc_dealer_fk = kd.pk 
and kd.dealer_type_fk = dt.pk 
and swap_status = 'SWAPPED'
and date(ssd.create_date) between '2020-10-01' and '2020-10-31'
--and dt."name" = 'insert_dealer_type_here'
--and er.code = 'insert_kit_tag_here'
group by dt."name",device_tag
;


-- total regs & re-regs [DEALER] **uncomment dealer**
select  
	kd."name" as dealer, er.code as kittag,
	sum(case when bfpsyncstatusenum = 'SUCCESS' then true else false end) as total_registrations,
	sum(case when bfpsyncstatusenum = 'SUCCESS' and reg_type like 'RR%' then true else false end) as total_RE_registrations
from bfp_sync_log bsl, enrollment_ref er, node n, node_assignment na, kyc_dealer kd
where bsl.enrollment_ref_fk = er.id 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.kyc_dealer_fk = kd.pk 
and bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2020-10-01' and '2020-10-31'
--and kd."name" = 'insert_dealer_type_here'
--and er.code = 'insert_kit_tag_here'
group by kd."name",er.code 
;

-- total swapped [DEALER]
select kd."name" as dealer, device_tag as kittag, count(1) total_swapped
from sim_swap_demographic ssd, enrollment_ref er, node n, node_assignment na, kyc_dealer kd
where ssd.device_tag = er.code 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.kyc_dealer_fk = kd.pk 
and swap_status = 'SWAPPED'
and date(ssd.create_date) between '2020-10-01' and '2020-10-31'
--and er.code = 'insert_kit_tag_here'
--and kd."name" = 'insert_dealer_type_here'
group by kd."name",device_tag
;


-- total regs & re-regs [LGA] **uncomment dda9 and code**
select DDA9 as lga, er.code as kittag, 
	sum(case when bfpsyncstatusenum = 'SUCCESS' then true else false end) as total_registrations,
	sum(case when bfpsyncstatusenum = 'SUCCESS' and reg_type like 'RR%' then true else false end) as total_RE_registrations
from dynamic_data dd
join basic_data bd on bd.id = dd.basic_data_fk 
join user_id ui on ui.id = bd.user_id_fk 
join bfp_sync_log bsl on bsl.unique_id = ui.unique_id 
join enrollment_ref er on bsl.enrollment_ref_fk = er.id 
--left join lga l on upper(dda9) = upper(l."name")
where bsl.bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2020-10-01' and '2020-10-31'
--and upper(dda9) = 'AMUWO-ODOFIN'
--and er.code = 'GLO-DH-LAG-ETI-GWLAOLUWOLE-428W'
group by dda9, er.code 
;

-- total swapped [LGA]
select L.NAME as lga, device_tag as kittag, count(1) total_swapped
from sim_swap_demographic ssd, enrollment_ref er, node n, node_assignment na, lga l
where ssd.device_tag = er.code 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.lga_fk = l.id
and swap_status = 'SWAPPED'
and date(ssd.create_date) between '2020-10-01' and '2020-10-31'
--and er.code = 'insert_kit_tag_here'
--and upper(l."name") = 'insert_lga_here'
group by l.name, device_tag
;


-- total regs & re-regs [REGION] **uncomment r.name and code**
select r."name" as region, er.code as kittag, 
	   sum(case when bfpsyncstatusenum = 'SUCCESS' then true else false end) as total_registrations,
	   sum(case when bfpsyncstatusenum = 'SUCCESS' and reg_type like 'RR%' then true else false end) as total_RE_registrations
from state s, region r, bfp_sync_log bsl, enrollment_ref er, node n, node_assignment na, lga l
where bsl.enrollment_ref_fk = er.id 
and er.id = n.enrollment_ref 
and na.node_fk = n.id 
and na.lga_fk = l.id 
and l.state_fk = s.id 
and r.id = s.region_fk 
and bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2020-10-01' and '2020-10-31'
--and r."name" = 'insert_region_here'
--and er.code = 'insert_kit_tag_here'
group by r."name", er.code 
;

-- total swapped [REGION]
select r.name as region, device_tag as kittag, count(1) total_swapped
from sim_swap_demographic ssd, enrollment_ref er, node n, node_assignment na, lga l, region r, state s
where ssd.device_tag = er.code 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.lga_fk = l.id
and s.id = l.state_fk 
and s.region_fk = r.id 
and swap_status = 'SWAPPED'
and date(ssd.create_date) between '2020-10-01' and '2020-10-31'
--and r."name" = 'insert_region_here'
--and er.code = 'insert_kit_tag_here'
group by r.name, device_tag
;


-- total regs & re-regs [ZONE] **uncomment z.name and code**
select z."name" as zone, er.code as kittag, 
	   sum(case when bfpsyncstatusenum = 'SUCCESS' then true else false end) as total_registrations,
	   sum(case when bfpsyncstatusenum = 'SUCCESS' and reg_type like 'RR%' then true else false end) as total_RE_registrations
from state s, zone z, bfp_sync_log bsl, enrollment_ref er, node n, node_assignment na, lga l
where bsl.enrollment_ref_fk = er.id 
and er.id = n.enrollment_ref 
and na.node_fk = n.id 
and na.lga_fk = l.id 
and l.state_fk = s.id 
and z.id = s.zone_fk 
and bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2020-10-01' and '2020-10-31'
--and er.code = 'insert_kit_tag_here'
--and z."name" = 'insert_zone_here'
group by z."name", er.code 
;


-- total swapped [ZONE] 
select z.name as zone, device_tag as kittag, count(1) total_swapped
from sim_swap_demographic ssd, enrollment_ref er, node n, node_assignment na, lga l, zone z, state s
where ssd.device_tag = er.code 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.lga_fk = l.id
and s.id = l.state_fk 
and s.zone_fk = z.id 
and swap_status = 'SWAPPED'
and date(ssd.create_date) between '2020-10-01' and '2020-10-31'
--and er.code = 'insert_kit_tag_here'
--and upper(r."name") = 'insert_region_here'
group by z.name, device_tag
;


-- total regs & re-regs [TERRITORY] **uncomment t.name and code**
select t."name" as territory, er.code as kittag, 
	   sum(case when bfpsyncstatusenum = 'SUCCESS' then true else false end) as total_registrations,
	   sum(case when bfpsyncstatusenum = 'SUCCESS' and reg_type like 'RR%' then true else false end) as total_RE_registrations
from  bfp_sync_log bsl, enrollment_ref er, node n, node_assignment na, lga l, territory t
where bsl.enrollment_ref_fk = er.id 
and er.id = n.enrollment_ref 
and na.node_fk = n.id 
and na.lga_fk = l.id 
and l.territory_fk = t.id 
and bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2020-10-01' and '2020-10-31'
--and er.code = 'insert_kit_tag_here'
--and t.name = 'insert_territory_here'
group by t."name", er.code 
;


-- total swapped [TERRITORY]
select t.name as TERRITORY, device_tag as kittag, count(1) total_swapped
from sim_swap_demographic ssd, enrollment_ref er, node n, node_assignment na, lga l, territory t 
where ssd.device_tag = er.code 
and er.id = n.enrollment_ref 
and n.id = na.node_fk 
and na.lga_fk = l.id
and t.id = l.state_fk 
and swap_status = 'SWAPPED'
and date(ssd.create_date) between '2020-10-01' and '2020-10-31'
--and er.code = 'insert_kit_tag_here'
--and upper(r."name") = 'insert_region_here'
group by t.name, device_tag
;




