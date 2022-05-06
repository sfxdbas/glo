/* 1. 36058070220-NIN.
transaction_id = 36058070220-1641085599530
08155570907 
-- photo 105995998 
Chijioke Obuna . 

2.14339313044-NIN.
transaction_id =  14339313044-1612019560198
-- photo 558414821 
08059454267 */


select first_name,surname ,birth_date , nin,photo ,transaction_id 
from nimc_verification_log nvl 
where transaction_id in ('36058070220-1641085599530','14339313044-1612019560198')
;


select 
msisdn, dd.dda34 nin, dd.dda36, dd.dda23, bsl.create_date,
loread(lo_open(p.passport_data, 262444),100000) , bd.id bdfk, dd.id ddid
,nin,photo ,transaction_id 
--distinct on (bsl.msisdn ) bsl.msisdn, dd.dda34 nin 
from bfp_sync_log bsl 
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
join nimc_verification_log nvl on nvl.transaction_id = dd.dda23
 join passport p on p.basic_data_fk = bd.id 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and bsl.msisdn in ('08155570907','08059454267')
--order by bsl.msisdn, create_date desc 
;

--insert into passport 
--select hibernate_sequence.nextval, null,558414821, 502989894;
--union all 
select hibernate_sequence.nextval, null,105995998, 508905320
;

--update dynamic_data set dda34 = '36058070220', dda36 = 'NIN_VERIFIED', dda23 = '36058070220-1641085599530' where id = 508905320;
--update dynamic_data set dda34 = '14339313044', dda36 = 'NIN_VERIFIED', dda23 = '14339313044-1612019560198' where id = 502989894;
--

/* 1. 36058070220-NIN.
transaction_id = 36058070220-1641085599530
08155570907 
-- photo 105995998 
Chijioke Obuna . 

2.14339313044-NIN.
transaction_id =  14339313044-1612019560198
-- photo 558414821 
08059454267 */
