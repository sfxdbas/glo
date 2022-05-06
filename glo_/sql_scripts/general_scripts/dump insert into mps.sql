with t1 as (
select rank() over (partition by msisdn, sim_serial order by create_date),*
from msisdn_provision_status mps where msisdn = '08159894933' --in (select msisdn from insert_into_mps_21052021)
--group by 1 ,2
--order by COUNT(1) desc 
order by msisdn 
) select * from t1 -- where rank  = 1
;

--select * from seamfix_siebel_dump_available_19052021b sb
--where  exists (
--insert into msisdn_provision_status
select 
hibernate_sequence.nextval,true, now, false, now, ssd.imsi, 0||ssd.msisdn as msisdn, ssd.sim_serial, ssd.status,'DUMP' as status_reason,null,null,
ssd.platform,null, null,null,null,null, null, null, null, null
FROM public.insert_into_mps_21052021_v3 ssd 
--where  not exists 
--(select 1 from msisdn_provision_status mps where mps.msisdn = 0||ssd.msisdn
--and mps.sim_serial = ssd.sim_serial
--)
;


CREATE table insert_into_mps_21052021_v3 as 
--insert into msisdn_provision_status
select hibernate_sequence.nextval as pkid, ssd.imsi, ssd.msisdn, ssd.sim_serial, ssd.status,ssd.platform
from seamfix_siebel_dump_available_19052021b ssd
where  not exists 
(select 1 from msisdn_provision_status mps where mps.msisdn = 0||ssd.msisdn
and mps.sim_serial = ssd.sim_serial
);


select * from insert_into_mps_21052021_v3 where msisdn >= '7050302742' order by msisdn ;


insert into msisdn_provision_status 
select hibernate_sequence.nextval,true, now, false, now, ssd.imsi, 0||ssd.msisdn as msisdn, ssd.sim_serial, ssd.status,
'DUMP' as status_reason,null,null,ssd.platform,null, null,null,null,null, null, null, null, null
FROM public.insert_into_mps_21052021_v3 ssd where pkid between 2171338342 and 2171343243 and not exists 
(select 1 from msisdn_provision_status mps where mps.msisdn = 0||ssd.msisdn and mps.sim_serial = ssd.sim_serial);