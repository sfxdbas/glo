-- Checked and Not Sent to Siebel
with cansts as (
select ssd.create_date, ssd.msisdn, ssd.sim_serial, mps.imsi, ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where check_status = 'CHECKED' 
and (registration_status = 'FAILED' or  registration_status  is null) 
and ssd.sim_serial = mps.sim_serial
and date(ssd.create_date) = date(now)
) select cansts.*,mps2.imsi as target_imsi 
from cansts
left join msisdn_provision_status mps2 on cansts.target_msisdn = mps2.msisdn 
where cansts.target_sim_serial = mps2.sim_serial 
;


--- unchecked
with unchecked as (
select ssd.create_date, ssd.msisdn, ssd.sim_serial, mps.imsi, ssd.target_msisdn, ssd.target_sim_serial 
from sim_swap_demographic ssd
left join msisdn_provision_status mps on ssd.msisdn = mps.msisdn
where  check_status is null
and ssd.sim_serial = mps.sim_serial
and date(ssd.create_date) = date(now)
) select unchecked.*,mps2.imsi as target_imsi 
from unchecked
left join msisdn_provision_status mps2 on unchecked.target_msisdn = mps2.msisdn 
where unchecked.target_sim_serial = mps2.sim_serial 
; 