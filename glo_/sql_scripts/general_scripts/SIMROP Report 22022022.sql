--All REGISTRATIONS by each device within specified period (Device wise Registrations) 
--
select date(bsl.create_date), er.code device , count(distinct msisdn)
from bfp_sync_log bsl 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2022-02-21' and '2022-02-21'
group by date(bsl.create_date), er.code
order by date(bsl.create_date)
;

--All ACTIVATIONS done by each device within specified period (Device wise Activations) 
--
select date(bsl.create_date), er.code device , count(distinct msisdn)
from bfp_sync_log bsl 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(bsl.create_date) between '2022-02-21' and '2022-02-21'
group by date(bsl.create_date), er.code
order by date(bsl.create_date)
;

--All REGISTRATIONS by each dealer within specified period (Dealer wise Registrations) 
--
select date(bsl.create_date), kd."name" as dealer, count(distinct msisdn)
from bfp_sync_log bsl 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join node n on n.enrollment_ref = er.id 
join node_assignment na on na.node_fk = n.id 
join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2022-02-21' and '2022-02-21'
group by date(bsl.create_date), kd."name" 
order by date(bsl.create_date)
;

--All ACTIVATIONS done by each dealer within specified period (Dealer wise Activations) 
--
select date(bsl.create_date), kd."name" as dealer, count(distinct msisdn)
from bfp_sync_log bsl 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join node n on n.enrollment_ref = er.id 
join node_assignment na on na.node_fk = n.id 
join kyc_dealer kd on kd.pk = na.kyc_dealer_fk 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(bsl.create_date) between '2022-02-21' and '2022-02-21'
group by date(bsl.create_date), kd."name" 
order by date(bsl.create_date)
;

--All REGISTRATIONS by each Region within specified period (Region wise Registrations) 
--
select date(bsl.create_date), z."name" as region, count(distinct msisdn)
from bfp_sync_log bsl 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join node n on n.enrollment_ref = er.id 
join node_assignment na on na.node_fk = n.id 
join zone z on z.id = na.zone_fk 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2022-02-21' and '2022-02-21'
group by date(bsl.create_date), z."name" 
order by date(bsl.create_date)
;

--All ACTIVATIONS done by each Region within specified period (Region wise Activations)
--
select date(bsl.create_date), z."name" as region, count(distinct msisdn)
from bfp_sync_log bsl 
join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
join node n on n.enrollment_ref = er.id 
join node_assignment na on na.node_fk = n.id 
join zone z on z.id = na.zone_fk 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and date(bsl.create_date) between '2022-02-21' and '2022-02-21'
group by date(bsl.create_date), z."name" 
order by date(bsl.create_date)
;

--All active Agents with invalid NIN
--
select ku.first_name, ku.surname,ku.email_address, ku.mobile as phone_number, ku.nin 
from km_user ku 
where nin is not null 
and active is true
and not exists 
(select 1 from nimc_verification_log nvl where nvl.nin = ku.nin)
;

--All whitelisted devices
--
select distinct er.code as device
from device_specific_setting dss 
join enrollment_ref er on DSS.enrollment_ref_fk = er.id 
where dss.setting_name in 
(
'PILOT-AVAILABLE-USE-CASE',
'PILOT-IMPROVED-NIN-VERIFICATION-USE-CASES',
'PILOT-NIN-VERIFICATION-USE-CASES',
'IMPROVED_NIN_VERIFICATION_USE_CASES',
'PILOT-NIN-VERIFICATION-TYPES'
)
;

--All Partners created on SIMROP with their NIN
--
select kd."name" as partner, ku.nin 
from kyc_dealer kd
join km_user ku on lower(kd.email_address) = lower(ku.email_address)
where ku.nin is not null 
;

--All users on SIMROP with their NIN
--
select ku.first_name, ku.surname,ku.email_address, ku.mobile as phone_number, ku.nin 
from km_user ku 
where nin is not null 
;

--All users mapped for SWAP. E.g Glozone

