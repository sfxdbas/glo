--SIM SWAP TAT  = (SWAP DATE - CHECKED DATE) - default wait time (30mins)
--SIM SWAP metric key:
--SWAP DATE => Sim swap order closure timestamp 
--CHECKED DATE => Swap approval timestamp
--Default wait time => in line with the business rules, it takes 30 mins for the swap to get to Siebel


select MSISDN, create_date , check_date , (check_date - create_date) as SWAPTAT
from sim_swap_demographic ssd 
where date(create_date) = date(now)-1
and check_status = 'CHECKED'
;