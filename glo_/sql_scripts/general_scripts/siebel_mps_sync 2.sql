SELECT bsl_msisdn, bsl_simserial, bsl_status, bsl_date, mps_msisdn, mps_ismserial, mps_status, mps_date
FROM public.extract_bsl_mps_statuses_25112021 a 
where not exists (
select msisdn  
from update_bsl_siebel_dump20210812b_csv_archive_09122021 b 
where a.bsl_msisdn = b.msisdn 
)
and bsl_msisdn='07010933330'
;

select 'update bfp_sync_log set activationstatusenum = ''ACTIVATED'', last_modified = now where pk ='|| pk||';'
from update_bsl_siebel_dump20210812b_csv_archive_09122021 a ,
bsl_full_mr_siebel_dump20210812b_csv_bkup_09122021 b 
where a.msisdn =b.msisdn 
;

select * from bfp_sync_log bsl where pk in (
select pk from update_bsl_siebel_dump20210812b_csv_archive_09122021 a ,
bsl_full_mr_siebel_dump20210812b_csv_bkup_09122021 b 
where a.msisdn = b.msisdn 
)
--and  activationstatusenum = 'ARCHIVED'
order by last_modified desc 
;

select  * from bfp_sync_log bsl where pk in (
select pk 
from update_bsl_siebel_dump20210812b_csv_deact_09122021
)
--and  activationstatusenum = 'ACTIVATED'
order by last_modified desc

--order by 7 desc 
;