--> simswap previous day report scripts -- 

-- sim swap
SELECT sum(case when registration_status = 'SENT_TO_SIEBEL' and swap_status = 'SWAPPED' then 1 else 0 end) as swapped,
	   sum(case when check_status = 'CHECKED' then 1 else 0 end) as checked,
	   sum(case when check_status = 'FAILED_CHECK' then 1 else 0 end) as failed_check,
	   sum(case when check_status is null then 1 else 0 end) as unchecked,
COUNT(1) as raised
from sim_swap_demographic 
--where swap_status = 'SWAPPED'
where date(create_date) = date(now)-1
--order by 3 desc 
;

-- sim swap
SELECT msisdn,S.SIM_SERIAL, s.device_id, checker_user_id as user_id, KU.user_id as MAKER_USER_ID,device_tag as kit_tag,
st.name as state_of_deployment, 
swap_status, check_status,
approval_feedback as remark,
s.create_date, s.check_date, s.swap_time 
from sim_swap_demographic s
left join km_user ku on lower(S.agent_email) = lower(KU.email_address)
left join enrollment_ref er on s.device_id = er.device_id
left join node n on n.enrollment_ref = er.id 
left join node_assignment na on na.node_fk = n.id 
left join state st on st.id = na.state_fk
where  date(s.create_date) = date(now)-1 
--  swap_status != 'SWAPPED'
;


--> Rereg previous day report scripts --

-- rereg
SELECT COUNT(distinct msisdn)
from bfp_sync_log 
where BFPSYNCSTATUSENUM = 'SUCCESS'
AND date(create_date) = date(now)-1 
and reg_type like 'RR%'

-- rereg
--rereg list
 with rem_dup as (
SELECT msisdn,b.sim_serial,b.device_id,ku.user_id,er.code as kit_tag,
s.name as state_of_deployment, bfpsyncstatusenum as status, 
case when rejection_reason is null and activationstatusenum is not null
then activationstatusenum
when rejection_reason is null and activationstatusenum is null
then 'PENDING ACTIVATION'
else rejection_reason end as remark,
	 row_number() over (partition by b.msisdn order by b.create_date desc ) as rank_
from bfp_sync_log b
 left join km_user ku on lower(ku.email_address) = lower(b.agent_email_address)
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
where BFPSYNCSTATUSENUM = 'SUCCESS'
and date(b.create_date) = date(now)-1 
and reg_type like 'RR%'
) 
select * 
from rem_dup 
where rank_ = 1
;



--> Report on Sim swap report scripts --

--- Sent to Siebel, Swappped
with stss as (
select ssd.CREATE_DATE as create_date, ssd.msisdn, ssd.sim_serial, /* mps.imsi, */ ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
-- left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where registration_status = 'SENT_TO_SIEBEL' 
and swap_status = 'SWAPPED'
-- and ssd.sim_serial = mps.sim_serial
and date(ssd.CREATE_DATE) = date(now)-1
)
select  count(1)
from stss
--  -- left join msisdn_provision_status mps2 on stss.target_msisdn = mps2.msisdn 
-- where stss.target_sim_serial = mps2.sim_serial 
; 

----  Checked, Failed push to Siebel
with cafpts as (
select ssd.CREATE_DATE as create_date, ssd.msisdn, ssd.sim_serial, /* mps.imsi, */ ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
-- left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where check_status = 'CHECKED' 
and registration_status = 'FAILED'
-- and ssd.sim_serial = mps.sim_serial
and date(ssd.CREATE_DATE) = date(now)-1
) 
select count(1)
from cafpts 
-- left join msisdn_provision_status mps2 on cafpts.target_msisdn = mps2.msisdn 
-- where cafpts.target_sim_serial = mps2.sim_serial 
;

--- Sent to Siebel, not Swappped (This is not possible though)
with stsns as (
select ssd.CREATE_DATE as create_date, ssd.msisdn, ssd.sim_serial, /* mps.imsi, */ ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
-- left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where registration_status = 'SENT_TO_SIEBEL'
and swap_status <> 'SWAPPED'
-- and ssd.sim_serial = mps.sim_serial
and date(ssd.CREATE_DATE) = date(now)-1
) select count(1)
from stsns
-- left join msisdn_provision_status mps2 on stsns.target_msisdn = mps2.msisdn 
--where stsns.target_sim_serial = mps2.sim_serial 
; 

-- Checked and Not Sent to Siebel
with cansts as (
select ssd.CREATE_DATE as create_date, ssd.msisdn, ssd.sim_serial, /* mps.imsi, */ ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
-- left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where check_status = 'CHECKED' 
and (registration_status = 'FAILED' or  registration_status  is null) 
-- and ssd.sim_serial = mps.sim_serial
and date(ssd.CREATE_DATE) = date(now)-1
) select count(1)
from cansts
-- left join msisdn_provision_status mps2 on cansts.target_msisdn = mps2.msisdn 
-- where cansts.target_sim_serial = mps2.sim_serial 
;

--- unchecked
with unchecked as (
select ssd.create_date, ssd.msisdn, ssd.sim_serial, /* mps.imsi, */ ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
-- left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where  check_status is null
-- and ssd.sim_serial = mps.sim_serial
and date(ssd.CREATE_DATE) = date(now)-1
) select count(1)
from unchecked
-- -- left join msisdn_provision_status mps2 on unchecked.target_msisdn = mps2.msisdn 
--where unchecked.target_sim_serial = mps2.sim_serial 
;


-- canceled swap 
with canceled_swap as (
select ssd.CREATE_DATE as create_date, ssd.msisdn, ssd.sim_serial, /* mps.imsi, */ ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd 
-- left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn 
---- left join msisdn_provision_status mps2 on ssd.sim_serial = mps2.sim_serial 
where check_status = 'FAILED_CHECK'
-- and ssd.sim_serial = mps.sim_serial 
and date(ssd.CREATE_DATE) = date(now)-1
) 
select  count(1)
from canceled_swap csw
-- left join msisdn_provision_status mps2 on csw.target_msisdn = mps2.msisdn 
-- where csw.target_sim_serial = mps2.sim_serial 
;


--> Dealerwise Report 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, T1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and b.bfpsyncstatusenum = 'SUCCESS'
	and b.activationstatusenum = 'ACTIVATED'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%')
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 	and DATE(B.CREATE_DATE) <= DATE(now) - 1
group by 1 
order by 1  
;


-- summary RE REG
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
    COUNT(1) as GRAND_TOTAL
from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, T1 b
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and d.pk = kd.dealer_type_fk
    and B.enrollment_ref_fk = E.ID
    and b.bfpsyncstatusenum = 'SUCCESS'
	and b.activationstatusenum = 'ACTIVATED'
	and b.reg_type like 'RR%'
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 	and DATE(B.CREATE_DATE) <= DATE(now) - 1
group by 1 
order by 1  
;


-- glozone NEW REG
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
	COUNT(1) as GRAND_TOTAL
-- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2021-01-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    and d.pk = kd.dealer_type_fk
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%')
    and DATE(B.CREATE_DATE) <= DATE(now) - 1
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
	and D."name" = 'GLOZONE'    
    group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
	;
	

-- glozone RE REG
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
	COUNT(1) as GRAND_TOTAL
-- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2021-01-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    and d.pk = kd.dealer_type_fk
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
	and b.reg_type like 'RR%'
    and DATE(B.CREATE_DATE) <= DATE(now) - 1
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
	and D."name" = 'GLOZONE'    
    group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
;


-- gloworld NEW REG
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
	COUNT(1) as GRAND_TOTAL
-- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2021-01-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    and d.pk = kd.dealer_type_fk
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%')
    and DATE(B.CREATE_DATE) <= DATE(now) - 1
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
	and D."name" = 'GLOWORLD'      
    group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
;


-- gloworld RE REG
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
	COUNT(1) as GRAND_TOTAL
-- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2021-01-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    and d.pk = kd.dealer_type_fk
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
	and b.reg_type like 'RR%'
    and DATE(B.CREATE_DATE) <= DATE(now) - 1
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
	and D."name" = 'GLOWORLD'    
    group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
;


-- others NEW REG
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
	COUNT(1) as GRAND_TOTAL
-- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2021-01-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    and d.pk = kd.dealer_type_fk
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%')
    and DATE(B.CREATE_DATE) <= DATE(now) - 1
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
	and D."name" not in ('GLOWORLD' , 'GLOZONE')
    group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
;


-- others RE REG 
with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select kd.deal_code TCODE,KD.NAME as PARTNER_NAME, e.code deviceid, 
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
--    sum(case when date(b.create_date) ='2021-07-31' then 1 else 0 end
	0 as "-31",
	COUNT(1) as GRAND_TOTAL
-- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2021-01-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    and d.pk = kd.dealer_type_fk
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
	and b.reg_type like 'RR%'
    and DATE(B.CREATE_DATE) <= DATE(now) - 1
    and extract(month from B.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
	and D."name" not in ('GLOWORLD' , 'GLOZONE')
    group by kd.deal_code,KD.NAME, e.code
    order by kd.deal_code
;



--> NEW REGISTRATION PREVIOUS DAY 
-- new reg
with rem_dup as (
SELECT msisdn,b.sim_serial,b.device_id,ku.user_id,er.code as kit_tag,
s.name as state_of_deployment, bfpsyncstatusenum as status, 
case when rejection_reason is null and activationstatusenum is not null
then activationstatusenum
when rejection_reason is null and activationstatusenum is null
then 'PENDING ACTIVATION'
else rejection_reason end as remark,
	 row_number() over (partition by b.msisdn order by b.create_date desc ) as rank_,
sar.registration_timestamp as reg_date,b.file_sync_date as sync_date, b.activation_date 
from bfp_sync_log b
 left join km_user ku on ku.email_address = b.agent_email_address
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
 join sms_activation_request sar on sar.unique_id = b.unique_id 
where BFPSYNCSTATUSENUM = 'SUCCESS'
and sar.phone_number = b.msisdn 
and date(b.create_date) = date(now)-1 
and reg_type like 'NM%'
) 
select count(1) 
from rem_dup 
where rank_ = 1
;

-- new reg
with rem_dup as (
SELECT msisdn,b.sim_serial,b.device_id,ku.user_id,er.code as kit_tag,
s.name as state_of_deployment, bfpsyncstatusenum as status, 
case when rejection_reason is null and activationstatusenum is not null
then activationstatusenum
when rejection_reason is null and activationstatusenum is null
then 'PENDING ACTIVATION'
else rejection_reason end as remark,
	 row_number() over (partition by b.msisdn order by b.create_date desc ) as rank_,
sar.registration_timestamp as reg_date,b.file_sync_date as sync_date, b.activation_date 
from bfp_sync_log b
 left join km_user ku on ku.email_address = b.agent_email_address
 join enrollment_ref er on er.id = b.enrollment_ref_fk
 join node n on n.enrollment_ref = er.id 
 join node_assignment na on na.node_fk = n.id 
 left join state s on s.id = na.state_fk
 join sms_activation_request sar on sar.unique_id = b.unique_id 
where BFPSYNCSTATUSENUM = 'SUCCESS'
and sar.phone_number = b.msisdn 
and date(b.create_date) = date(now)-1 
and reg_type like 'NM%'
) 
select *
from rem_dup 
where rank_ = 1
;



--> Sim swap device wise report 
with days as (
select 	1   as daily_	from dual union all
select 	2	from dual union all
select 	3	from dual union all
select 	4	from dual union all
select 	5	from dual union all
select 	6	from dual union all
select 	7	from dual union all
select 	8	from dual union all
select 	9	from dual union all
select 	10	from dual union all
select 	11	from dual union all
select 	12	from dual union all
select 	13	from dual union all
select 	14	from dual union all
select 	15	from dual union all
select 	16	from dual union all
select 	17	from dual union all
select 	18	from dual union all
select 	19	from dual union all
select 	20	from dual union all
select 	21	from dual union all
select 	22	from dual union all
select 	23	from dual union all
select 	24	from dual union all
select 	25	from dual union all
select 	26	from dual union all
select 	27	from dual union all
select 	28	from dual union all
select 	29	from dual union all
select 	30	from dual union all
select 	31	from dual 
), ER as (
select u.user_id, s.checker_user_id, s.device_tag as kit_tag, count(s.pk) as count_of_swapped, Extract(day from s.create_date)  as day_in_month 
from sim_swap_demographic s 
join km_user u on lower(u.email_address) = lower(s.agent_email)
where (s.swap_status) = 'SWAPPED' and (s.check_status) = 'CHECKED'
and extract(year from s.create_date) = extract(year from now )
and extract(month from s.create_date) = extract(month from now )
and date(s.create_date) <= date(now)-1
group by u.user_id, s.checker_user_id, s.device_tag, Extract(day from s.create_date), Extract(month from s.create_date)
), mg as (
select er.user_id, er.checker_user_id, er.kit_tag, er.count_of_swapped, d.daily_ as days_in_month
from days d 
left join er on d.daily_ = er.day_in_month)
select mg.user_id, mg.checker_user_id,mg.kit_tag as deviceid, --mg.kit_tag,
sum(case when (mg.days_in_month = 1) then count_of_swapped else 0 end) as "-01",
sum(case when (mg.days_in_month = 2) then count_of_swapped else 0 end) as "-02",
sum(case when (mg.days_in_month = 3) then count_of_swapped else 0 end) as "-03",
sum(case when (mg.days_in_month = 4) then count_of_swapped else 0 end) as "-04",
sum(case when (mg.days_in_month = 5) then count_of_swapped else 0 end) as "-05",
sum(case when (mg.days_in_month = 6) then count_of_swapped else 0 end) as "-06",
sum(case when (mg.days_in_month = 7) then count_of_swapped else 0 end) as "-07",
sum(case when (mg.days_in_month = 8) then count_of_swapped else 0 end) as "-08",
sum(case when (mg.days_in_month = 9) then count_of_swapped else 0 end) as "-09",
sum(case when (mg.days_in_month = 10) then count_of_swapped else 0 end) as "-10",
sum(case when (mg.days_in_month = 11) then count_of_swapped else 0 end) as "-11",
sum(case when (mg.days_in_month = 12) then count_of_swapped else 0 end) as "-12",
sum(case when (mg.days_in_month = 13) then count_of_swapped else 0 end) as "-13",
sum(case when (mg.days_in_month = 14) then count_of_swapped else 0 end) as "-14",
sum(case when (mg.days_in_month = 15) then count_of_swapped else 0 end) as "-15",
sum(case when (mg.days_in_month = 16) then count_of_swapped else 0 end) as "-16",
sum(case when (mg.days_in_month = 17) then count_of_swapped else 0 end) as "-17",
sum(case when (mg.days_in_month = 18) then count_of_swapped else 0 end) as "-18",
sum(case when (mg.days_in_month = 19) then count_of_swapped else 0 end) as "-19",
sum(case when (mg.days_in_month = 20) then count_of_swapped else 0 end) as "-20",
sum(case when (mg.days_in_month = 21) then count_of_swapped else 0 end) as "-21",
sum(case when (mg.days_in_month = 22) then count_of_swapped else 0 end) as "-22",
sum(case when (mg.days_in_month = 23) then count_of_swapped else 0 end) as "-23",
sum(case when (mg.days_in_month = 24) then count_of_swapped else 0 end) as "-24",
sum(case when (mg.days_in_month = 25) then count_of_swapped else 0 end) as "-25",
sum(case when (mg.days_in_month = 26) then count_of_swapped else 0 end) as "-26",
sum(case when (mg.days_in_month = 27) then count_of_swapped else 0 end) as "-27",
sum(case when (mg.days_in_month = 28) then count_of_swapped else 0 end) as "-28",
sum(case when (mg.days_in_month = 29) then count_of_swapped else 0 end) as "-29",
sum(case when (mg.days_in_month = 30) then count_of_swapped else 0 end) as "-30",
sum(case when (mg.days_in_month = 31) then count_of_swapped else 0 end) as "-31"
from mg
group by mg.user_id, mg.checker_user_id,mg.kit_tag
order by 3,1, 2;