with cte as (
select um.msisdn, mps.msisdn, um.imsi as imsi1, mps.imsi as imsi2, um.iccid, mps.sim_serial, um.attrib_43, mps.platform ,pk,
delta_sim_serial , delta_imsi,
row_number() over(partition by mps.msisdn order by mps.create_date desc ) as rank
from update_mps_07272021 um, msisdn_provision_status mps 
where 0||um.msisdn = mps.msisdn 
)
select --'update msisdn_provision_status set delta_sim_serial = null, delta_imsi = null  where pk = '||pk||';',
* 
from cte 
--where rank = 1
--and imsi1 != imsi2
--and iccid != sim_serial
;