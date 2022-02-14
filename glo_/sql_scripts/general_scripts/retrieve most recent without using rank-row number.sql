--create table  ta_25012022 as 
-- (MSISDN, Activation Date, NIN, Date Submitted, Validation status)
select distinct on (bsl.msisdn) msisdn, bsl.create_date activation_date, dd.dda34 nin, dd.dda36 as validation_status
from bfp_sync_log bsl 
join user_id ui using (unique_id )
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where bsl.bfpsyncstatusenum ='SUCCESS'
--and bsl.activationstatusenum = 'ACTIVATED'
and bsl.msisdn ~ '^[0-9.]+$'
--and date(bsl.create_date) <= '2021-12-31'
and date(bsl.create_date) between '2021-1-1' and '2021-12-31'
--and msisdn in ('08113845427','08050000016', '07058203079')
order by  bsl.msisdn, create_date desc 
;
