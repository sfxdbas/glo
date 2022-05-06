SELECT msisdn--, nin
FROM public.total_number_of_unbarred_subscribers_csv_27042022;

select * from bfp_sync_log bsl where msisdn ='06000000000';
update total_number_of_unbarred_subscribers_csv_27042022 set msisdn = 0||right(msisdn ,10) where msisdn is not null ;

select a.* 
from m2_out_of_10_6ncc_list_IS_to_chk_nin_27042022 a 
join check_for_nin_ft_26042022 b using (msisdn )
where b.nin is null
order by 2 desc 
;


SELECT msisdn
FROM public.m2_out_of_10_6ncc_list_IS_to_chk_nin_27042022 c
where not exists (select 1 from bfp_sync_log bsl where bsl.msisdn=c.msisdn)
;

--update m2_out_of_10_6ncc_list_IS_to_chk_nin_27042022 set msisdn =0||msisdn where msisdn is not null ;
 
--create table total_number_of_unbarred_subscribers_csv_27042022_return as 
select  distinct on (bsl.msisdn ) bsl.msisdn, dd.dda34 nin , dd.dda36  nin_status
from bfp_sync_log bsl 
join total_number_of_unbarred_subscribers_csv_27042022 cptn on bsl.msisdn = cptn.msisdn  
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id
where bsl.bfpsyncstatusenum = 'SUCCESS'
--and bsl.msisdn = '06000000000'
order by bsl.msisdn, create_date desc 
;

-- -- 507,350
-- 507,350

--1.MSISDN WITH NIN and 
select msisdn,nin from check_for_nin_ft_26042022 where nin is not null AND  nin_status not in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid') ;

--2.MSISDN WITHOUT NIN 
select  msisdn,nin  from check_for_nin_ft_26042022 where nin is  null ;

select NIN_STATUS,COUNT(1) from check_for_nin_ft_26042022 cfnf group by 1 