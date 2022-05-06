-- update cug_lines_28042022 set company ='OTIS CARPETS' where company is null ;

INSERT  into bfp_sync_log 
with T1 as (
select  row_number() over (partition by BSL.msisdn order by BSL.create_date desc ),
HIBERNATE_SEQUENCE.NEXTVAL PK,true ACTIVE ,bsl.create_date+interval '1 hour' CREATE_DATE,false DELETED,
bsl.last_modified+interval '1 hour' LAST_MODIFIED,bsl.activation_date+interval '1 hour' ACTIVATION_DATE,
'ACTIVATED' activationstatusenum,'SUCCESS' bfpsyncstatusenum,null file_name, bsl.create_date+interval '1 hour' file_sync_date,BSL.MSISDN,
ccl.sim_serial SIM_SERIAL,null source_path,null target_path,
CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1650966713334'
when ccl.company = 'CBN' then 'GLO-HH-FCT-ABU-GWABJ-263T-1641392835402'
when ccl.company = 'DELTA_AFRIK' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649316771595'
when ccl.company = 'WEBB_FONTAINE' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1643105435011'
when ccl.company = 'CHEVRON' then 'GLO-DH-LAG-ETI-GWLAVI-359W-1631095124050'
when ccl.company = 'UNIQUE_EYE' then 'GLO-HH-413S-1649246562756'
when ccl.company = 'ARTEE' then 'GLO-DH-LAG-ETI-GWLAVI-361W-1630406110650'
when ccl.company = 'AKOLTEM_NIG_LIMITED' then 'GLO-HH-471S-1651141718488'
when ccl.company = 'OSAKS' then 'GLO-HH-RIV-POR-GWUNIPORT-880D-1651046950772'
when ccl.company = 'ADEBOWALE_SOBANJO' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1650448023899'
when ccl.company = 'CHEMSTAR' then 'GLO-HH-372S-1649150187372'
when ccl.company = 'OWANBE_MART' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649940636582'
when ccl.company = 'BAYWOOD_CONTINENTAL' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1651136300010'
when ccl.company = 'SIMIDAVIS' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649939746574'
when ccl.company = 'PREZICON' then 'GLO-DH-442W-1651130385237'
when ccl.company = 'EBEANO' then 'GLO-HH-415S-1631007350467'
when ccl.company = 'MARINA_HMO' then 'GLO-HH-LAG-SHL-GWLAFAD-481T-1650619971429'
when ccl.company = 'DJ_FASHIONS' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649928478845'
when ccl.company = 'DIGITAL_DIRECT' then 'GLO-HH-416S-1650964358929'
when ccl.company = 'REMIX' then 'GLO-HH-471S-1650616826413'
when ccl.company = 'DRUG_AVENUE' then 'GLO-DH-442W-1651135262162'
when ccl.company = 'LASPEC' then 'GLO-HH-333S-1651049285075'
when ccl.company = 'CLARKE_ENERGY' then 'GLO-HH-372S-1649236629488'
when ccl.company = 'GEOREYSTING' then 'GLO-DH-RIV-POR-GWPHC3-445W-1650619230736'
end as  UNIQUE_ID, 
CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 163915
when ccl.company = 'CBN' then 1135108092
when ccl.company = 'DELTA_AFRIK' then 163915
when ccl.company = 'WEBB_FONTAINE' then 163915
when ccl.company = 'CHEVRON' then 73047
when ccl.company = 'UNIQUE_EYE' then 883807173
when ccl.company = 'ARTEE' then 73049
when ccl.company = 'AKOLTEM_NIG_LIMITED' then 885969094
when ccl.company = 'OSAKS' then 170137
when ccl.company = 'ADEBOWALE_SOBANJO' then 163915
when ccl.company = 'CHEMSTAR' then 883807132
when ccl.company = 'OWANBE_MART' then 163915
when ccl.company = 'BAYWOOD_CONTINENTAL' then 163915
when ccl.company = 'SIMIDAVIS' then 163915
when ccl.company = 'PREZICON' then 73130
when ccl.company = 'EBEANO' then 883807175
when ccl.company = 'MARINA_HMO' then 930081118
when ccl.company = 'DJ_FASHIONS' then 163915
when ccl.company = 'DIGITAL_DIRECT' then 883807176
when ccl.company = 'REMIX' then 885969094
when ccl.company = 'DRUG_AVENUE' then 73130
when ccl.company = 'LASPEC' then 929873
when ccl.company = 'CLARKE_ENERGY' then 883807132
when ccl.company = 'GEOREYSTING' then 73133
end as ENROLLMENT_REF_FK, 
CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'CBN' then 'adebayo.daniyan@gloworld.com'
when ccl.company = 'DELTA_AFRIK' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'WEBB_FONTAINE' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'CHEVRON' then 'adebanke.kuye@gloworld.com'
when ccl.company = 'UNIQUE_EYE' then 'onome.akpene@gloworld.com'
when ccl.company = 'ARTEE' then 'adebanke.kuye@gloworld.com'
when ccl.company = 'AKOLTEM_NIG_LIMITED' then 'ijeoma.ijeh@gloworld.com'
when ccl.company = 'OSAKS' then 'chimezie.aharaumunna@gloworld.com'
when ccl.company = 'ADEBOWALE_SOBANJO' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'CHEMSTAR' then 'tochi.onyeonoru@gloworld.com'
when ccl.company = 'OWANBE_MART' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'BAYWOOD_CONTINENTAL' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'SIMIDAVIS' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'PREZICON' then 'nkem.ogbulie@gloworld.com'
when ccl.company = 'EBEANO' then 'charity.wangai@gloworld.com'
when ccl.company = 'MARINA_HMO' then 'toyin.akinlagun@gloworld.com'
when ccl.company = 'DJ_FASHIONS' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'DIGITAL_DIRECT' then 'olusegun.kolawole@gloworld.com'
when ccl.company = 'REMIX' then 'jeremiah.ndem@gloworld.com'
when ccl.company = 'DRUG_AVENUE' then 'nkem.ogbulie@gloworld.com'
when ccl.company = 'LASPEC' then 'grace.ijakeyi@gloworld.com'
when ccl.company = 'CLARKE_ENERGY' then 'constance.anyaso@gloworld.com'
when ccl.company = 'GEOREYSTING' then 'anthony.oriekose@gloworld.com'
end as AGENT_EMAIL_ADDRESS, 'SIMROP' CAPTURE_MODE, 
CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'CBN' then 'HEWLETT-PACKARD-TRF3120SDW'
when ccl.company = 'DELTA_AFRIK' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'WEBB_FONTAINE' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'CHEVRON' then 'HP-5CD9343SWM'
when ccl.company = 'UNIQUE_EYE' then 'HP-5CD9343SWK'
when ccl.company = 'ARTEE' then 'HEWLETT-PACKARD-USH11201AP'
when ccl.company = 'AKOLTEM_NIG_LIMITED' then 'HEWLETT-PACKARD-TRF53507XN'
when ccl.company = 'OSAKS' then 'HEWLETT-PACKARD-CZC005BM45'
when ccl.company = 'ADEBOWALE_SOBANJO' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'CHEMSTAR' then 'INSYDE-CND80612W9'
when ccl.company = 'OWANBE_MART' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'BAYWOOD_CONTINENTAL' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'SIMIDAVIS' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'PREZICON' then 'HEWLETT-PACKARD-TRF14705BK'
when ccl.company = 'EBEANO' then 'HP-5CD9343ST8'
when ccl.company = 'MARINA_HMO' then 'HEWLETT-PACKARD-CZC005BMGT'
when ccl.company = 'DJ_FASHIONS' then 'HEWLETT-PACKARD-CZC2232B7T'
when ccl.company = 'DIGITAL_DIRECT' then 'HP-5CD9343SWR'
when ccl.company = 'REMIX' then 'HEWLETT-PACKARD-TRF53507XN'
when ccl.company = 'DRUG_AVENUE' then 'HEWLETT-PACKARD-TRF14705BK'
when ccl.company = 'LASPEC' then 'HEWLETT-PACKARD-CZC2232N0M'
when ccl.company = 'CLARKE_ENERGY' then 'INSYDE-CND80612W9'
when ccl.company = 'GEOREYSTING' then 'HP-5CD9343S05'
end AS DEVICE_ID, '10.152.89.182' INSTANCE_IP, '8190' INSTANCE_PORT,'CAR' REG_TYPE,null REJECTION_REASON,  'HTTP' TRANSFER_MODE, 
'NOT_APPLICABLE' MSISDN_COMPLIANCE_STATUS, '2021-09-22 11:17:50' MSISDN_COMPLIANCE_TIMSETAMP
-- select /*BSL.* */--distinct BSL.instance_ip ,unique_id --BSL.* 
-- CCL.*,BSL.reg_type ,BSL.unique_id 
from bfp_sync_log bsl 
join cug_lines_28042022  ccl on BSL.msisdn = CCL.msisdn 
where bfpsyncstatusenum = 'SUCCESS'
and BSL.unique_id     not  in  (select unique_id from cug_primarytm_28042022 cp)
 and bsl.msisdn   not   in ( select msisdn from dummy_cug_28042022)
 )
select pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name,
file_sync_date::timestamp, msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id,
instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timsetamP::timestamp
from T1 
where row_number = 1
;


INSERT  into msisdn_detail 
with T1 as (
select row_number() over (partition by BSL.msisdn order by BSL.create_date desc ),
hibernate_sequence.nextval id,NULL activation_status,NULL activation_timestamp,BSL.msisdn,NULL msdidn_part_key,FALSE new_subscriber,
CCL.SIM_SERIAL serial,'PREPAID' subscriber_type,NULL yellow_account_enabled, null yellow_account_types,FALSE zap,
CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 3362149806
when ccl.company = 'CBN' then 3165676297
when ccl.company = 'DELTA_AFRIK' then 3313973817
when ccl.company = 'WEBB_FONTAINE' then 3201791378
when ccl.company = 'CHEVRON' then 2922870944
when ccl.company = 'UNIQUE_EYE' then 3311992830
when ccl.company = 'ARTEE' then 2853311469
when ccl.company = 'ADEBOWALE_SOBANJO' then 3345894008
when ccl.company = 'CHEMSTAR' then 3310020703
when ccl.company = 'OWANBE_MART' then 3335499798
when ccl.company = 'SIMIDAVIS' then 3336045297
when ccl.company = 'EBEANO' then 2921791335
when ccl.company = 'MARINA_HMO' then 3350629406
when ccl.company = 'DJ_FASHIONS' then 3329817383
when ccl.company = 'REMIX' then 3350770200
when ccl.company = 'LASPEC' then 3359090747
when ccl.company = 'CLARKE_ENERGY' then 3311715292
when ccl.company = 'GEOREYSTING' then 3350511434
 END basic_data_fk,
'Mobile' msisdn_category,null platform,null imsi,null visitor,null alternate_number,null first_name,null last_name,null nin,
null nin_status,null transaction_id,'CHILD' user_category,'CORPORATE' corporate_category
from bfp_sync_log bsl 
join cug_lines_28042022 ccl on BSL.msisdn = CCL.msisdn 
where bfpsyncstatusenum = 'SUCCESS'
and BSL.unique_id     not  in  (select unique_id from cug_primarytm_28042022 cp)
 and bsl.msisdn   not   in ( select msisdn from dummy_cug_28042022)
) select id, activation_status::BOOL, activation_timestamp::TIMESTAMP, msisdn, msdidn_part_key::TIMESTAMP, new_subscriber, serial, 
subscriber_type, yellow_account_enabled::BOOL, yellow_account_types, zap, basic_data_fk, msisdn_category, platform, imsi, visitor::BOOL, 
alternate_number, first_name, last_name, nin, nin_status, transaction_id, user_category, corporate_category
from T1 where row_number =1
;



 INSERT  into sms_activation_request 
with T1 as (
select row_number() over (partition by BSL.msisdn order by BSL.create_date desc ),
hibernate_sequence.nextval id,bsl.create_date+interval '1 hour' activation_timestamp,null agility_push_timestamp,null crm_bio_update_time,
0 confirmation_status,bsl.create_date+interval '1 hour' sar_part_key,null crm_update_time,case 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 'Alaba Vivian'
when ccl.company = 'CBN' then 'Owoeye Oluwole'
when ccl.company = 'DELTA_AFRIK' then 'Udeh Chukwuemeke'
when ccl.company = 'WEBB_FONTAINE' then 'Shopitan Blessing'
when ccl.company = 'CHEVRON' then 'Iwueze Cosmas'
when ccl.company = 'UNIQUE_EYE' then 'Idowu Mathew'
when ccl.company = 'ARTEE' then 'Oyelade Muritala'
when ccl.company = 'ADEBOWALE_SOBANJO' then 'Essien Comfort'
when ccl.company = 'CHEMSTAR' then 'Amusan Adams'
when ccl.company = 'OWANBE_MART' then 'Dosunmu Rashedat'
when ccl.company = 'SIMIDAVIS' then 'Akingba Olajumoke'
when ccl.company = 'EBEANO' then 'Orok Uduak'
when ccl.company = 'MARINA_HMO' then 'Esivue Musa'
when ccl.company = 'DJ_FASHIONS' then 'Akanji Eno'
when ccl.company = 'REMIX' then 'Chidinma Success'
when ccl.company = 'LASPEC' then 'Ogunyemi Olubukola'
when ccl.company = 'CLARKE_ENERGY' then 'Olonade Ahmad'
when ccl.company = 'GEOREYSTING' then 'Peter Eddy'
end customer_name,CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 'Alaba Vivian'
when ccl.company = 'CBN' then 'Owoeye Oluwole'
when ccl.company = 'DELTA_AFRIK' then 'Udeh Chukwuemeke'
when ccl.company = 'WEBB_FONTAINE' then 'Shopitan Blessing'
when ccl.company = 'CHEVRON' then 'Iwueze Cosmas'
when ccl.company = 'UNIQUE_EYE' then 'Idowu Mathew'
when ccl.company = 'ARTEE' then 'Oyelade Muritala'
when ccl.company = 'ADEBOWALE_SOBANJO' then 'Essien Comfort'
when ccl.company = 'CHEMSTAR' then 'Amusan Adams'
when ccl.company = 'OWANBE_MART' then 'Dosunmu Rashedat'
when ccl.company = 'SIMIDAVIS' then 'Akingba Olajumoke'
when ccl.company = 'EBEANO' then 'Orok Uduak'
when ccl.company = 'MARINA_HMO' then 'Esivue Musa'
when ccl.company = 'DJ_FASHIONS' then 'Akanji Eno'
when ccl.company = 'REMIX' then 'Chidinma Success'
when ccl.company = 'LASPEC' then 'Ogunyemi Olubukola'
when ccl.company = 'CLARKE_ENERGY' then 'Olonade Ahmad'
when ccl.company = 'GEOREYSTING' then 'Peter Eddy'
end as ENROLLMENT_REF,
true is_initiator, null msisdn_update_status,null msisdn_update_timestamp, bsl.msisdn phone_number,null previous_unique_id, 
bsl.create_date+interval '1 hour' receipt_timestamp,bsl.create_date+interval '1 hour' registration_timestamp,'CAR' registration_type,'BIOMETRICS' sender_number,
CCL.sim_serial serial_number,
case 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 25
when ccl.company = 'CBN' then 15
when ccl.company = 'DELTA_AFRIK' then 25
when ccl.company = 'WEBB_FONTAINE' then 25
when ccl.company = 'CHEVRON' then 25
when ccl.company = 'UNIQUE_EYE' then 25
when ccl.company = 'ARTEE' then 25
when ccl.company = 'ADEBOWALE_SOBANJO' then 25
when ccl.company = 'CHEMSTAR' then 25
when ccl.company = 'OWANBE_MART' then 25
when ccl.company = 'SIMIDAVIS' then 25
when ccl.company = 'EBEANO' then 25
when ccl.company = 'MARINA_HMO' then 25
when ccl.company = 'DJ_FASHIONS' then 25
when ccl.company = 'REMIX' then 33
when ccl.company = 'LASPEC' then 25
when ccl.company = 'CLARKE_ENERGY' then 25
when ccl.company = 'GEOREYSTING' then 33
end as state_id,
'UNACTIVATED' status,
CASE 
when ccl.company = 'VETTAL_MEGA_SERVICES_LTD' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1650966713334'
when ccl.company = 'CBN' then 'GLO-HH-FCT-ABU-GWABJ-263T-1641392835402'
when ccl.company = 'DELTA_AFRIK' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649316771595'
when ccl.company = 'WEBB_FONTAINE' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1643105435011'
when ccl.company = 'CHEVRON' then 'GLO-DH-LAG-ETI-GWLAVI-359W-1631095124050'
when ccl.company = 'UNIQUE_EYE' then 'GLO-HH-413S-1649246562756'
when ccl.company = 'ARTEE' then 'GLO-DH-LAG-ETI-GWLAVI-361W-1630406110650'
when ccl.company = 'ADEBOWALE_SOBANJO' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1650448023899'
when ccl.company = 'CHEMSTAR' then 'GLO-HH-372S-1649150187372'
when ccl.company = 'OWANBE_MART' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649940636582'
when ccl.company = 'SIMIDAVIS' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649939746574'
when ccl.company = 'EBEANO' then 'GLO-HH-415S-1631007350467'
when ccl.company = 'MARINA_HMO' then 'GLO-HH-LAG-SHL-GWLAFAD-481T-1650619971429'
when ccl.company = 'DJ_FASHIONS' then 'GLO-DH-LAG-ETI-GWLAVIMINI-310W-1649928478845'
when ccl.company = 'REMIX' then 'GLO-HH-471S-1650616826413'
when ccl.company = 'LASPEC' then 'GLO-HH-333S-1651049285075'
when ccl.company = 'CLARKE_ENERGY' then 'GLO-HH-372S-1649236629488'
when ccl.company = 'GEOREYSTING' then 'GLO-DH-RIV-POR-GWPHC3-445W-1650619230736'
end as  UNIQUE_ID, 
hibernate_sequence.nextval phone_number_status_fk, null msisdn_compliance_status
from bfp_sync_log bsl 
join cug_lines_28042022 ccl on BSL.msisdn = CCL.msisdn 
where bfpsyncstatusenum = 'SUCCESS'
and BSL.unique_id     not  in  (select unique_id from cug_primarytm_28042022 cp)
 and bsl.msisdn   not   in ( select msisdn from dummy_cug_28042022)
) 
select id, activation_timestamp, agility_push_timestamp::timestamp , crm_bio_update_time::timestamp, confirmation_status, sar_part_key, 
crm_update_time::timestamp, customer_name, enrollment_ref, is_initiator, msisdn_update_status, msisdn_update_timestamp::timestamp,
phone_number,previous_unique_id, receipt_timestamp, registration_timestamp, registration_type, sender_number, serial_number, state_id, 
status, unique_id, phone_number_status_fk, msisdn_compliance_status 
from T1 
where row_number = 1
;

-- INSERT  into phone_number_status 
select sar.phone_number_status_fk,null,null,receipt_timestamp+interval '1 hour','','ACTIVATED',NULL
from sms_activation_request sar 
where  customer_name in (
'Alaba Vivian',
'Owoeye Oluwole',
'Udeh Chukwuemeke',
'Shopitan Blessing',
'Iwueze Cosmas',
'Idowu Mathew',
'Oyelade Muritala',
'Essien Comfort',
'Amusan Adams',
'Dosunmu Rashedat',
'Akingba Olajumoke',
--'Orok Uduak',
'Esivue Musa',
'Akanji Eno',
'Chidinma Success',
'Ogunyemi Olubukola',
'Olonade Ahmad',
'Peter Eddy'
)
--and date(receipt_timestamp ) = date(now)
and not exists (select 1 from phone_number_status pns where pns.id = sar.phone_number_status_fk)