--insert into msisdn_detail 
with cte as (
select bsl.create_date ,0||d.msisdn as msisdn , BD.ID, BD.FIRSTNAME, BD.SURNAME, d.sim_serial, 
row_number () over ( partition by bsl.msisdn order by bsl.create_date desc ), mps.imsi, platform
from bfp_sync_log bsl , basic_data bd, user_id ui, dummy_assign_to_users d, msisdn_provision_status mps 
where UI.ID = BD.USER_ID_FK 
and UI.UNIQUE_ID = BSL.unique_id 
and 0||d.msisdn = bsl.msisdn 
and mps.msisdn = 0||d.msisdn
and mps.sim_serial = d.sim_serial 
and bfpsyncstatusenum = 'SUCCESS'
and d.msisdn = '8113999687' -- use the equal to to get the basicdataid, return it to to equal to during insert 
)
select hibernate_sequence.nextval,null,NULL, msisdn, NULL, true, sim_serial , 
case when platform like 'ICC%' then 'PREPAID' else 'POSTPAID' end as SUBSCRIBER_TYPE, 
false, NULL, false, 2815579345 as basic_data_id, 'MOBILE', PLATFORM, IMSI, false
from cte where row_number = 1
;

--	2135342166
select * from msisdn_detail md order by id desc ;

