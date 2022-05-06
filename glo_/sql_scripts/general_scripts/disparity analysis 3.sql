 select  distinct  msisdn --, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
--,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
-- and extract(month from B.create_date) = extract(month from now)
-- and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
-- and DATE(B.CREATE_DATE) <= DATE(now) - 1
and date(b.create_date) = '2021-09-01'
;

with t1 as (
        select   msisdn , enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS'
--	and b.activationstatusenum = 'ACTIVATED' --AND date(b.create_date) between '2021-09-01' and '2021-09-31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
 and date(b.create_date) = '2021-09-01'
--and date(b.create_date) = '2021-09-01'
    )
	select  D."name" ,msisdn ,B.create_date 
	,row_number () OVER(partition by msisdn order by D.NAME  )
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
--and row_number = 1
--group by 1 
--and MSISDN = '09157696959'
and MSISDN in ('08059784120',
'09159305420',
'09158500472') 
--and D.NAME != D.NAME
--order by 4 DESC  
;