---> PROCESS
from 4th -- 21st 
-- valid (fn & ln SIMREG == NIMC) 
-- valid (fn & ln SIMREG != NIMC) --> INVALID_DEMO_MISMATCH (on ENLL & DD)
	--> NIN to null , NIN status  & trans_ID - null 
-- invalidDemoMismatch (fn & ln SIMREG == NIMC) 
   -->  update NIN & nin status & trans_ID-> NIN VERIFIED (ENLL -> VALID)


--> CLEAN UP

-- valid (change)
with cte as (
select distinct on (basic_data_id) basic_data_id,verification_transaction_id,create_date,external_id,msisdn,nin,verification_status,
dynamic_data_id
from external_nin_link_log
where (create_date) between '2022-04-04 22:00:00' and '2022-04-22 07:00:00'
--and  msisdn = '08079183961'
order by basic_data_id,create_date desc 
)
select /*dd.**/
'update external_nin_link_log set verification_status = ''INVALID_DEMO_MATCH_NIMC'' where verification_transaction_id = '||''''||cte.verification_transaction_id||''''||';',
'update dynamic_data set dda34 = null, dda36 = null, dda23 = null where id = '||dynamic_data_id||';',
cte.create_date,cte.msisdn,cte.nin,cte.verification_status,cte.verification_transaction_id,dd.dda34,dda36,dda23,
bd.firstname fn_simreg,nvl.first_name fn_nimc ,bd.surname ln_simreg ,nvl.surname ln_nimc,
to_char(bd.birthday::timestamp, 'yyyy-mm-dd') dob_simreg, 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc
from cte 
join basic_data bd on bd.id = cte.basic_data_id
join dynamic_data dd on dd.id = cte.dynamic_data_id
join nimc_verification_log nvl on nvl.transaction_id = cte.verification_transaction_id 
where cte.verification_status = 'VALID'
and lower(nvl.first_name)||' '||lower(nvl.surname) != lower(bd.firstname)||' '||lower(bd.surname)
--and case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end=to_char(bd.birthday::timestamp, 'yyyy-mm-dd')
--order by create_date
;
-- INVALID_DEMO_MATCH_NIMC





-- invalid demo match nimc (change)
with cte as (
select distinct on (basic_data_id) basic_data_id,verification_transaction_id,create_date,external_id,msisdn,nin,verification_status,
dynamic_data_id
from external_nin_link_log
where (create_date) between '2022-04-04 22:00:00' and '2022-04-22 07:00:00'
--and  msisdn = '08079183961'
order by basic_data_id,create_date desc 
)
select /*dd.**/
'update external_nin_link_log set verification_status = ''VALID'' where verification_transaction_id = '||''''||cte.verification_transaction_id||''''||';',
'update dynamic_data set dda34 = '||''''||cte.nin||''''||', dda36 = ''NIN_VERIFIED'' , dda23 = '||''''||cte.verification_transaction_id||''''||' where id = '||dynamic_data_id||';',
cte.create_date,cte.msisdn,cte.nin,cte.verification_status,cte.verification_transaction_id,dd.dda34,dda36,dda23,
bd.firstname fn_simreg,nvl.first_name fn_nimc ,bd.surname ln_simreg ,nvl.surname ln_nimc,
to_char(bd.birthday::timestamp, 'yyyy-mm-dd') dob_simreg, 
case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end dob_nimc
from cte 
join basic_data bd on bd.id = cte.basic_data_id
join dynamic_data dd on dd.id = cte.dynamic_data_id
join nimc_verification_log nvl on nvl.transaction_id = cte.verification_transaction_id 
where cte.verification_status = 'INVALID_DEMO_MATCH_NIMC'
and lower(nvl.first_name)||' '||lower(nvl.surname) = lower(bd.firstname)||' '||lower(bd.surname)
--and case when nvl.birth_date like '%*%' then nvl.birth_date else to_char(nvl.birth_date::timestamp, 'yyyy-mm-dd') end=to_char(bd.birthday::timestamp, 'yyyy-mm-dd')
--order by create_date
;
-- INVALID_DEMO_MATCH_NIMC


-- REPORTING