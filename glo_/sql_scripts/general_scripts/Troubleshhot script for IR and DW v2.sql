-- summary NEW REG
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
	select D."name" ,
	sum(case when date(b.create_date) ='2021-07-01' then 1 else 0 end) as "-01",
    sum(case when date(b.create_date) ='2021-07-02' then 1 else 0 end) as "-02",
    sum(case when date(b.create_date) ='2021-07-03' then 1 else 0 end) as "-03",
    sum(case when date(b.create_date) ='2021-07-04' then 1 else 0 end) as "-04",
    sum(case when date(b.create_date) ='2021-07-05' then 1 else 0 end) as "-05",
    sum(case when date(b.create_date) ='2021-07-06' then 1 else 0 end) as "-06",
    sum(case when date(b.create_date) ='2021-07-07' then 1 else 0 end) as "-07",
    sum(case when date(b.create_date) ='2021-07-08' then 1 else 0 end) as "-08",
    sum(case when date(b.create_date) ='2021-07-09' then 1 else 0 end) as "-09",
    sum(case when date(b.create_date) ='2021-07-10' then 1 else 0 end) as "-10",
    sum(case when date(b.create_date) ='2021-07-11' then 1 else 0 end) as "-11",
    sum(case when date(b.create_date) ='2021-07-12' then 1 else 0 end) as "-12",
    sum(case when date(b.create_date) ='2021-07-13' then 1 else 0 end) as "-13",
    sum(case when date(b.create_date) ='2021-07-14' then 1 else 0 end) as "-14",
    sum(case when date(b.create_date) ='2021-07-15' then 1 else 0 end) as "-15",
    sum(case when date(b.create_date) ='2021-07-16' then 1 else 0 end) as "-16",
    sum(case when date(b.create_date) ='2021-07-17' then 1 else 0 end) as "-17",
    sum(case when date(b.create_date) ='2021-07-18' then 1 else 0 end) as "-18",
    sum(case when date(b.create_date) ='2021-07-19' then 1 else 0 end) as "-19",
    sum(case when date(b.create_date) ='2021-07-20' then 1 else 0 end) as "-20",
    sum(case when date(b.create_date) ='2021-07-21' then 1 else 0 end) as "-21",
    sum(case when date(b.create_date) ='2021-07-22' then 1 else 0 end) as "-22",
    sum(case when date(b.create_date) ='2021-07-23' then 1 else 0 end) as "-23",
    sum(case when date(b.create_date) ='2021-07-24' then 1 else 0 end) as "-24",
    sum(case when date(b.create_date) ='2021-07-25' then 1 else 0 end) as "-25",
    sum(case when date(b.create_date) ='2021-07-26' then 1 else 0 end) as "-26",
    sum(case when date(b.create_date) ='2021-07-27' then 1 else 0 end) as "-27",
    sum(case when date(b.create_date) ='2021-07-28' then 1 else 0 end) as "-28",
    sum(case when date(b.create_date) ='2021-07-29' then 1 else 0 end) as "-29",
    sum(case when date(b.create_date) ='2021-07-30' then 1 else 0 end) as "-30",
    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end)
	/*0*/ as "-31",
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, bfp_sync_log b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and b.bfpsyncstatusenum = 'SUCCESS'
	and b.activationstatusenum = 'ACTIVATED'
--	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI'))
--    and date(b.create_date) >= '2021-7-1' and date(b.create_date) <= '2021-7-31'
and  
 	 DATE(B.CREATE_DATE) = '2021-7-1'
-- 	 and kd.name = 'A2L COMMUNICATION'
group by 1 
order by 1  
;

select * 
from bfp_sync_log b
where b.bfpsyncstatusenum = 'SUCCESS'
	and b.activationstatusenum = 'ACTIVATED'
	and b.reg_type like 'RR%'
    and date(b.create_date) >= '2021-7-1' and date(b.create_date) <= '2021-7-31'