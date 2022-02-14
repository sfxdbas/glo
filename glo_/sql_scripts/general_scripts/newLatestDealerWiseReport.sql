-- newRegSummary
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select D."name" ,
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by 1 
order by 1  
;



-- newRegGLOWORLD
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and D."name" = 'GLOWORLD' 
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
;


-- newRegGLOZONE
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and D."name" = 'GLOZONE' 
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code 
;


-- newRegOTHERS
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and D."name" not in ('GLOWORLD', 'GLOZONE' )
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code 
;




-- reRegSummary
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select D."name" ,
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by 1 
order by 1  
;

-- reRegGLOWORLD
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and D."name" = 'GLOWORLD'
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
  
;


-- reRegGLOZONE
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and D."name" = 'GLOZONE'
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code 
;


-- reRegOTHERS
with t1 as (
        select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and extract(month from B.create_date) = extract(month from now)
 and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) <= DATE(now) - 1
    )
	select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
	COUNT(DISTINCT case when date(b.create_date) ='2021-09-01' then b.msisdn end) as "-01",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-02' then b.msisdn end) as "-02",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-03' then b.msisdn end) as "-03",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-04' then b.msisdn end) as "-04",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-05' then b.msisdn end) as "-05",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-06' then b.msisdn end) as "-06",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-07' then b.msisdn end) as "-07",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-08' then b.msisdn end) as "-08",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-09' then b.msisdn end) as "-09",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-10' then b.msisdn end) as "-10",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-11' then b.msisdn end) as "-11",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-12' then b.msisdn end) as "-12",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-13' then b.msisdn end) as "-13",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-14' then b.msisdn end) as "-14",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-15' then b.msisdn end) as "-15",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-16' then b.msisdn end) as "-16",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-17' then b.msisdn end) as "-17",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-18' then b.msisdn end) as "-18",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-19' then b.msisdn end) as "-19",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-20' then b.msisdn end) as "-20",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-21' then b.msisdn end) as "-21",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-22' then b.msisdn end) as "-22",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-23' then b.msisdn end) as "-23",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-24' then b.msisdn end) as "-24",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-25' then b.msisdn end) as "-25",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-26' then b.msisdn end) as "-26",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-27' then b.msisdn end) as "-27",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-28' then b.msisdn end) as "-28",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-29' then b.msisdn end) as "-29",
    COUNT(DISTINCT case when date(b.create_date) ='2021-09-30' then b.msisdn end) as "-30",
--    COUNT(DISTINCT case when date(b.create_date) ='2021-09-31' then b.msisdn end)+
	0 as "-31",
--	  count(distinct case when entryId > 0 then tag end) as positive_tag_count
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and D."name" not in ('GLOWORLD','GLOZONE')
--    and b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
---- and extract(month from B.create_date) = extract(month from now)
---- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) = DATE(now) --- 1
and row_number = 1
group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
  
;

