-- for NIN verified status - update only DOB (check fn & ln) 
-- fn or ln or dob mismatch (update whichever) --> status outside NIN verified
-- ones without NIN, get them from ENLL and perform check on simreg
--   update dda36, dda34, dda23, update fn & ln & dob (VTI is not null)


-- prep.
--create table update_demo_tnous_28042022 as  --1,037,312
select  distinct on (bsl.msisdn ) bsl.msisdn, dd.dda34 nin , dd.dda36  nin_status, 
bd.firstname fn_simreg,nvl.first_name fn_nimc ,bd.surname ln_simreg ,nvl.surname ln_nimc,
to_char(bd.birthday::timestamp, 'yyyy-mm-dd') dob_simreg , 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc 
,BD.ID as basic_data_id, dd.id as dynamic_data_id, dd.dda23 
from bfp_sync_log bsl 
join total_number_of_unbarred_subscribers_csv_27042022 cptn on bsl.msisdn = cptn.msisdn  
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id
join nimc_verification_log nvl on nvl.transaction_id = dd.dda23 
where bsl.bfpsyncstatusenum = 'SUCCESS'
and lower(nvl.first_name)||' '||lower(nvl.surname) = lower(bd.firstname)||' '||lower(bd.surname)
and to_char(bd.birthday::timestamp, 'yyyy-mm-dd') != case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end
--and bsl.msisdn = '07050316997'
order by bsl.msisdn, bsl.create_date desc -- , nvl.create_date desc 
;


--create table dynamic_data_bkup_1037312_28042022 as 
select * from dynamic_data bd where id in (
select dynamic_data_id  from update_demo_tnous_28042022);

--1. cont.
select -- 52,038
'update basic_data set birthday = '||''''||to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss')||''''||' where id = '||ud.basic_data_id||';'/*,
basic_data_id,msisdn,ud.nin,nin_status,fn_simreg,nvl.first_name fn_nimc ,ln_simreg ,nvl.surname ln_nimc,dob_simreg , 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc  
,to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss') update_birthday*/
from update_demo_tnous_28042022 ud 
join nimc_verification_log nvl on nvl.transaction_id = ud.dda23
where nin_status in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid') 
and lower(nvl.first_name)||' '||lower(nvl.surname) = lower(fn_simreg)||' '||lower(ln_simreg)
and nvl.first_name not like '%*%' 
and nvl.surname not like '%*%' 
and nvl.birth_date not like '%*%'
and dob_simreg != case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end
--and ud.msisdn ='07050316997'
;

--2. cont.
select --51,478 --> updated (17,175) --re_updated (12,601)
'update basic_data set firstname = '||''''||nvl.first_name||''''||', surname = '||''''||nvl.surname||''''||', birthday = '||''''||to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss')||''''||' where id = '||ud.basic_data_id||';'
,basic_data_id,msisdn,ud.nin,nin_status,fn_simreg,nvl.first_name fn_nimc ,ln_simreg ,nvl.surname ln_nimc,dob_simreg , 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc  
,to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss') update_birthday
from update_demo_tnous_28042022 ud 
join nimc_verification_log nvl on nvl.transaction_id = ud.dda23
where nin_status not in ('NIN VERIFIED', 'NIN_VERIFIED', 'Valid') 
and (lower(nvl.first_name)||' '||lower(nvl.surname) = lower(fn_simreg)||' '||lower(ln_simreg) 
     or  lower(nvl.first_name)||' '|| case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end = lower(fn_simreg)||' '||dob_simreg 
     or lower(nvl.surname)||' '|| case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end = lower(ln_simreg)||' '||dob_simreg
)
--and (lower(nvl.first_name) = lower(fn_simreg) or lower(nvl.surname) = lower(ln_simreg) or  dob_simreg = case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end)
and nvl.first_name not like '%*%' 
and nvl.surname not like '%*%' 
and nvl.birth_date not like '%*%'
--and ud.msisdn ='07050316997'
--and ud.basic_data_id =855155185
;

--3. cont. --16,845 (26,771)
with t1 as (
select distinct on (enll.basic_data_id ) enll.basic_data_id ,enll.create_date ,enll.basic_data_id,enll.verification_status ,enll.msisdn,enll.nin,enll.verification_transaction_id
,ud.basic_data_id,ud.msisdn,ud.nin,nin_status,fn_simreg,nvl.first_name fn_nimc ,ln_simreg ,nvl.surname ln_nimc,dob_simreg , 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc  
,to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss') update_birthday
,'update basic_data set firstname = '||''''||nvl.first_name||''''||', surname = '||''''||nvl.surname||''''||', birthday = '||''''||to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss')||''''||' where id = '||ud.basic_data_id||';'
from external_nin_link_log enll 
join update_demo_tnous_28042022 ud on ud.msisdn = enll.msisdn 
join nimc_verification_log nvl on nvl.transaction_id = enll.verification_transaction_id 
where verification_transaction_id is not null 
and ud.nin is null 
--and enll.msisdn ='07036430527'
and nvl.first_name not like '%*%' 
and nvl.surname not like '%*%' 
and nvl.birth_date not like '%*%'
--and lower(nvl.first_name)||' '||lower(nvl.surname) != lower(fn_simreg)||' '||lower(ln_simreg)
and (lower(nvl.first_name)||' '||lower(nvl.surname) = lower(fn_simreg)||' '||lower(ln_simreg) 
     or  lower(nvl.first_name)||' '|| case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end = lower(fn_simreg)||' '||dob_simreg 
     or lower(nvl.surname)||' '|| case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end = lower(ln_simreg)||' '||dob_simreg
)
--and ud.basic_data_id =511691352
order by enll.basic_data_id ,enll.create_date desc )
, t2 as (--union all 
select distinct on (enll.basic_data_id ) enll.basic_data_id ,enll.create_date ,enll.basic_data_id,enll.verification_status 
,enll.msisdn,enll.nin,enll.verification_transaction_id,nvl.nin,nvl.transaction_id 
,ud.basic_data_id,ud.msisdn,ud.nin,nin_status,fn_simreg,nvl.first_name fn_nimc ,ln_simreg ,nvl.surname ln_nimc,dob_simreg , 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc  
,to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd hh24:mi:ss') update_birthday
,'update dynamic_data set dda34 = '||''''||nvl.nin ||''''||', dda36 = ''NIN_VERIFIED'''||', dda23 = '||''''||nvl.transaction_id||''''||' where id = '||ud.dynamic_data_id ||';'
from external_nin_link_log enll 
join update_demo_tnous_28042022 ud on ud.msisdn = enll.msisdn 
join nimc_verification_log nvl on nvl.transaction_id = enll.verification_transaction_id 
where verification_transaction_id is not null 
and ud.nin is null 
--and enll.msisdn ='07036430527'
and nvl.first_name not like '%*%' 
and nvl.surname not like '%*%' 
and nvl.birth_date not like '%*%'
--and lower(nvl.first_name)||' '||lower(nvl.surname) != lower(fn_simreg)||' '||lower(ln_simreg)
and (lower(nvl.first_name)||' '||lower(nvl.surname) = lower(fn_simreg)||' '||lower(ln_simreg) 
     or  lower(nvl.first_name)||' '|| case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end = lower(fn_simreg)||' '||dob_simreg 
     or lower(nvl.surname)||' '|| case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end = lower(ln_simreg)||' '||dob_simreg
)
--and ud.basic_data_id =511691352
order by enll.basic_data_id ,enll.create_date desc 
) 
select "?column?" from t1 
union all 
select  "?column?" from t2
;