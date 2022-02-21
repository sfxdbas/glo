-- step 1
-- create view dummy_view as 
with t1 as (
select enrollment_ref,count(*) r_count
from sms_activation_request s
-- where extract(month from s.receipt_timestamp) = extract(month from now())
-- where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
group by 1), t2 as (
select count(*) d_count , sms_activation_request.phone_number, sms_activation_request.enrollment_ref
from sms_activation_request 
-- where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
group by 2,3
having count(*) > 1
)
select t1.enrollment_ref , t1.r_count, coalesce(sum(t2.d_count),0) d_count
from t1 left join t2 --, sms_activation_request s
on  t1.enrollment_ref = t2.enrollment_ref
-- and t1.enrollment_ref = 'GLO-DH-001A'
-- and extract(month from t1.receipt_timestamp)  = extract(month from now())
group by  1,2
order by 1 
-- limit 10
;

-- step 2

-- create view dummy_view as 
with t1 as (
select enrollment_ref,to_char(receipt_timestamp, 'YYYY-mm') date_,phone_number, count(phone_number) r_count
from sms_activation_request s
-- where extract(month from s.receipt_timestamp) = extract(month from now())
-- where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
group by 1,2 ,3
order by 1,2), t2 as (
select count(*) d_count ,to_char(receipt_timestamp, 'YYYY-mm') date_, phone_number, enrollment_ref
from sms_activation_request 
-- where enrollment_ref = 'GLO-DN-671O'
group by 2,3,4
having count(*) > 1
order by 2,4
)
select t1.date_,t1.enrollment_ref kit_tag,sum(t1.r_count) r_count, coalesce(sum(t2.d_count),0) d_count
from t1 left join t2 --, sms_activation_request s
on  t1.enrollment_ref = t2.enrollment_ref
and t1.phone_number = t2.phone_number
-- and t1.enrollment_ref = 'GLO-HH-SFX001-LAG-IKJ-3554664'
-- and extract(month from t1.receipt_timestamp)  = extract(month from now())
-- and t2.date_ = '2020-03'
group by  1 ,2 --,3,4
order by 2,1
-- limit 10
;


select enrollment_ref,phone_number, count(*) from sms_activation_request where enrollment_ref = 'GLO-DN-671O' group by 1,2;

select * from dummy_view where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'; -- and to_char(date_) = 
;
select phone_number 
from sms_activation_request
where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090' and to_char(receipt_timestamp, 'yyyy-mm') = '2020-03' order by phone_number ; -- to_char(receipt_timestamp, 'YYYY-MM') = '2020-02'; 

with t2 as (
select enrollment_ref,to_char(receipt_timestamp, 'YYYY-mm') date_ ,count(*) r_count
from sms_activation_request s
-- where extract(month from s.receipt_timestamp) = extract(month from now())
-- where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
-- where to_char(receipt_timestamp, 'YYYY-mm') = '2020-03'
-- where  enrollment_ref = 'GLO-DN-401B'
group by 1,2
-- having count(*)>1
order by 1,2)
select * from t2 where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
-- where date_ = '2020-03'
;




--create view dummy_view_1 as 
-- create view device_reg_details as 
with t1 as (
select enrollment_ref,to_char(receipt_timestamp, 'YYYY-mm') date_,phone_number, count(phone_number) r_count
from sms_activation_request s
-- where extract(month from s.receipt_timestamp) = extract(month from now())
--	where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
group by 1,2 ,3
order by 1,2), t2 as (
select count(phone_number) d_count ,to_char(receipt_timestamp, 'YYYY-mm') date_, phone_number, enrollment_ref
from sms_activation_request 
--where enrollment_ref = 'GLO-HH-SFX001-LAG-ETI-19090'
group by 2,3,4
having count(*) > 1
order by 2,4
)
select t1.date_,t1.enrollment_ref kit_tag,sum(t1.r_count) r_count, coalesce(sum(t2.d_count),0) d_count
from t1 left join t2 --, sms_activation_request s
on  t1.enrollment_ref = t2.enrollment_ref
and t1.phone_number = t2.phone_number
--and t1.enrollment_ref = 'GLO-HH-SFX001-LAG-IKJ-3554664'
--and extract(month from t1.receipt_timestamp)  = extract(month from now())
--and t2.date_ = '2020-03'
group by  1 ,2 --,3,4
order by 2,1
-- limit 10
;

select * 
from device_reg_details
where kit_tag = 'insert kit tag here'
and date_ = 'insert year and month here';



-- CREATE OR REPLACE VIEW public.dummy_view_1 as
 WITH t1 AS (
         SELECT e.code,
            to_char(b.create_date, 'YYYY-mm'::character varying) AS date_,
            b.msisdn,
            count(b.msisdn) AS r_count
           FROM bfp_sync_log b, enrollment_ref e
           where b.enrollment_ref_fk = e.id
          GROUP BY e.code, (to_char(b.create_date, 'YYYY-mm'::character varying)), b.msisdn
          ORDER BY e.code, (to_char(b.create_date, 'YYYY-mm'::character varying))
        ), t2 AS (
         SELECT count(msisdn) AS d_count,
            to_char(create_date, 'YYYY-mm'::character varying) AS date_,
            msisdn,
           e.code
          FROM bfp_sync_log b, enrollment_ref e
           where b.enrollment_ref_fk = e.id
          GROUP BY (to_char(create_date, 'YYYY-mm'::character varying)), msisdn,
          e.code
         HAVING count(*) > 1
          ORDER BY (to_char(create_date, 'YYYY-mm'::character varying)), e.code
        )
 SELECT t1.date_,
    t1.code AS kit_tag,
    sum(t1.r_count) AS r_count,
    COALESCE(sum(t2.d_count), 0::numeric) AS d_count
   FROM t1
     LEFT JOIN t2 ON t1.code::text = t2.code::text AND t1.msisdn::text = t2.msisdn::text
--     where t1.code = 'GLO-DN-671O'
  GROUP BY t1.date_, t1.code
  ORDER BY t1.code, t1.date_;

 