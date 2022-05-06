--COMPLIANT RECORD 
select msisdn,sim_serial,activation_date,rgs_timestamp, DATEOF48HRCHECK from (
select msisdn,sim_serial,activation_date,rgs_timestamp,msisdn_compliance_timestamp as DATEOF48HRCHECK
,row_number() over (partition by bsl.msisdn order by bsl.activation_date desc )
from bfp_sync_log bsl 
where  bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and reg_type = 'NMSI'
and date(activation_date)='2021-10-01'
and bfpsyncstatusenum ='SUCCESS'
and rgs_timestamp is not null
) A 
where row_number = 1
;

--null NON COMPLIANT RGS RECORD 
select msisdn,sim_serial,activation_date,rgs_timestamp, DATEOF48HRCHECK from (
select msisdn,sim_serial,activation_date,rgs_timestamp, msisdn_compliance_timestamp DATEOF48HRCHECK
,row_number() over (partition by bsl.msisdn order by bsl.activation_date desc )
from bfp_sync_log bsl 
where  bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and reg_type = 'NMSI'
and date(activation_date)='2021-10-01'
and bfpsyncstatusenum ='SUCCESS'
and rgs_timestamp is null 
and msisdn_compliance_timestamp is null 
) A 
where row_number = 1
;

--duplicate records
select * from (
select *
,row_number() over (partition by bsl.msisdn order by bsl.activation_date desc )
from bfp_sync_log bsl 
where  bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and reg_type = 'NMSI'
and date(activation_date)='2021-10-01'
and bfpsyncstatusenum ='SUCCESS'
--and rgs_timestamp is not null
) A 
where row_number = 2
;