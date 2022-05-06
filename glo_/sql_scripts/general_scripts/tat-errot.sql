-- error 
select   bsl.msisdn, bsl.sim_serial,bsl.reg_type ,bsl.rejection_reason , bsl.create_date 
from bfp_sync_log bsl
where  date(bsl.create_date) = date(now)-1
and bsl.bfpsyncstatusenum = 'ERROR'
order by 3,5
;

select * from quarantined_msisdn_detail qmd ;