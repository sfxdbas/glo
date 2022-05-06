--update cug_lines_28042022 set msisdn =0||msisdn where length(msisdn)<11;
--update cug_lines_28042022 set company =upper(company) where msisdn is not null;
--update cug_primarytm_28042022 set msisdn =0||msisdn where length(msisdn)<11;
--update cug_primarytm_28042022 set company =upper(company) where msisdn is not null;
--select * from cug_lines_28042022 cl where not exists (select 1 from cug_primarytm_28042022 cp where cp.company=cl.company);
--select * from cug_primarytm_28042022  cl where not exists (select 1 from cug_lines_28042022 cp where cp.company=cl.company);
 

select /*id,company,status,msisdn --,*/sc
--,'delete from cug_lines_28042022 where id = '||id||';'
from (
select 
--distinct cl.*,mps.msisdn ,mps.sim_serial,mps.status ,
cl.id,cl.company,MPS.status ,mps.msisdn,
 'update cug_lines_28042022 set sim_serial = '||''''||mps.sim_serial||''''||' where msisdn = '||''''||cl.msisdn||''''||';' sc
,row_number() over (partition by mps.msisdn order by mps.create_date desc )
from cug_lines_28042022 cl
 join msisdn_provision_status mps using (msisdn)
where cl.sim_serial is   null
and lower(mps.status)   in ('available','active')
--and  msisdn = '10159393381'
) a where row_number =1 --order by 2 desc 
;


with del as (
select *,row_number() over (partition by cl.msisdn order by cl.id)
from cug_lines_28042022 cl 
) select ''''||msisdn||''',',*
,'delete from cug_lines_28042022 where id = '||id||';'
from del 
where row_number > 1
;


with del as (
select *,row_number() over (partition by cl.msisdn order by cl.id)
from cug_primarytm_28042022 cl 
) select *
,'delete from cug_primarytm_28042022 where id = '||id||';'
from del 
where row_number > 1
;


select distinct md.msisdn,basic_data_fk,user_category, cp.*
from msisdn_detail md 
right join cug_primarytm_28042022 cp using (msisdn)
where (user_category in ('CHILD','PRIMARY_TM') or  cp.company in (''))
order by company 
;



select reg_type,create_date, 'UPDATE cug_primarytm_28042022 SET UNIQUE_ID = '||''''||unique_id||''''||' WHERE MSISDN = '||''''||MSISDN||''''||';',* from (
SELECT reg_type, company, BSL.msisdn, bsl.unique_id , bsl.create_date 
,ROW_NUMBER() over (partition by BSL.msisdn order by BSL.create_date desc )
FROM public.cug_primarytm_28042022
/*left*/ join bfp_sync_log bsl using (MSISDN)
where bfpsyncstatusenum ='SUCCESS'
--order by company ,bsl.create_date 
) A where row_number =1 
order by length(unique_id)
;


select *
,'delete from cug_lines_28042022 where id = '||id||';'
from cug_lines_28042022 ac where NOT exists (
select unique_id ,msisdn 
from bfp_sync_log bsl 
WHERE bsl.msisdn = ac.msisdn 
)
;


--create table dummy_cug_28042022 as 
select MSISDN/*,COMPANY,STATUS*/ from (
select ac.*,BSL.activationstatusenum STATUS 
,row_number () over (partition by BSL.msisdn order by BSL.create_date DESC )
from cug_lines_28042022 ac
left join bfp_sync_log bsl on bsl.msisdn =ac.msisdn 
where bfpsyncstatusenum = 'SUCCESS' 
and BSL.unique_id not in  (select unique_id from cug_primarytm_28042022 cp)
and bsl.msisdn not in ( select msisdn from dummy_cug_28042022)
) A where row_number = 1 
--order by 2,1
;


select * from (
select 
'when ccl.company = '||''''||cap.company||''''||' then '||   ''''||
bsl.device_id 
||''''
,bsl.msisdn ,
/*TM_msisdn ,*/cap.company,activationstatusenum ,
bsl.enrollment_ref_fk ,device_id ,agent_email_address ,create_date , 
row_number () over (partition by bsl.msisdn order by bsl.create_date desc )
from 
bfp_sync_log bsl  
join cug_primarytm_28042022 cap on cap.msisdn= bsl.msisdn 
) a 
where row_number =1
;

select * from (
select 
'when ccl.company = '||''''||cap.company||''''||' then '|| -- ''''||
bsl.basic_data_fk 
--||''''
,user_category ,
--,BSL.msisdn ,
/*TM_msisdn ,*/cap.company,--activationstatusenum ,
--bsl.enrollment_ref_fk 
--bsl.basic_data_fk ,user_category ,
--device_id ,agent_email_address ,
--unique_id ,enrollment_ref_fk ,create_date  
row_number () over (partition by bsl.msisdn order by bsl.id desc )
--row_number () over (partition by bsl.phone_number order by bsl.receipt_timestamp desc )
from 
msisdn_detail bsl
join cug_primarytm_28042022 cap on cap.msisdn= bsl.msisdn 
where (user_category in ('CHILD','PRIMARY_TM')  or  cap.company in (''))
) a 
where row_number =1
;



select * from (
select 
'when ccl.company = '||''''||cap.company||''''||' then '||  ''''||
SAR.unique_id 
||''''
,''''||customer_name||''',', state.id,
SAR.phone_number ,
/*TM_msisdn ,*/cap.company,SAR.unique_id,enrollment_ref ,receipt_timestamp 
,row_number () over (partition by SAR.phone_number order by SAR.receipt_timestamp desc )
from 
sms_activation_request SAR
join state on state.id = SAR.state_id 
join cug_primarytm_28042022 cap on cap.msisdn = SAR.phone_number 
) a 
where row_number =1
;
