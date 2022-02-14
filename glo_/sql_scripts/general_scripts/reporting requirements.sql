--1.Activation Report per Trade Code – This report has the following columns;
--a.TCODE	--b.DEVICEID --c.COUNT OF ACTIVATIONS

select kd.deal_code TCODE, e.device_id deviceid, COUNT(1) count_of_activations
from kyc_dealer kd, enrollment_ref e, node n, node_assignment na, bfp_sync_log b --, sms_activation_request sar 
where kd.pk = na.kyc_dealer_fk
and e.id = n.enrollment_ref
and na.node_fk = n.id 
and b.enrollment_ref_fk = e.id 
--and sar.enrollment_ref = e.code
--and b.unique_id = sar.unique_id
--and b.msisdn = sar.phone_number
and b.bfpsyncstatusenum = 'SUCCESS'
and b.activationstatusenum = 'ACTIVATED'
group by kd.deal_code, e.device_id
order by kd.deal_code, e.device_id
;



--2.Registration Report per Trade Code
--a.TCODE	--b.DEVICEID --c.COUNT OF REGISTRATIONS

select kd.deal_code tcode, e.device_id deviceid, COUNT(1) countofregistrations
from kyc_dealer kd, enrollment_ref e, node n, node_assignment na, bfp_sync_log b --, sms_activation_request sar 
where kd.pk = na.kyc_dealer_fk
and e.id = n.enrollment_ref
and na.node_fk = n.id 
and b.enrollment_ref_fk = e.id 
--and sar.enrollment_ref = e.code
--and b.unique_id = sar.unique_id
--and b.msisdn = sar.phone_number
and b.bfpsyncstatusenum = 'SUCCESS'
group by kd.deal_code, e.device_id
;



--3.Activation Report per Channel
--a.CHANNEL --b.COUNT

select
	d."name" as channel, count( 1 ) countofActivations
from
	dealer_type d, kyc_dealer kd,enrollment_ref e,	node n,	node_assignment na,	bfp_sync_log b --,	sms_activation_request sar,
where
		kd.pk = na.kyc_dealer_fk
	and e.id = n.enrollment_ref
	and na.node_fk = n.id
	and b.enrollment_ref_fk = e.id
--	and sar.enrollment_ref = e.code
--	and b.unique_id = sar.unique_id
--	and b.msisdn = sar.phone_number
	and d.pk = kd.dealer_type_fk
	and b.bfpsyncstatusenum = 'SUCCESS'
	and b.activationstatusenum = 'ACTIVATED'
group by
	d."name"
	;


--4.Registration Report per Channel
--a.CHANNEL b.COUNT

select
	d."name" as channel, count( 1 ) countofregistrations
from
	dealer_type d, kyc_dealer kd,enrollment_ref e,	node n,	node_assignment na,	bfp_sync_log b --,	sms_activation_request sar,	
where
		kd.pk = na.kyc_dealer_fk
	and e.id = n.enrollment_ref
	and na.node_fk = n.id
	and b.enrollment_ref_fk = e.id
--	and sar.enrollment_ref = e.code
--	and b.unique_id = sar.unique_id
--	and b.msisdn = sar.phone_number
	and d.pk = kd.dealer_type_fk
	and b.bfpsyncstatusenum = 'SUCCESS'
group by
	d."name"
	;

--Summary of Validation Report (From Eyeballing)
--Input
--oStart Date
--oEnd Date
--Output
--oTotal Valid Numbers
--oTotal Invalid Numbers
--oTotal Numbers Validated

select
	sum( case when status = 'Valid' then true else false end ) as total_valid_numbers,
	sum( case when status = 'Invalid' then true else false end ) as total_invalid_numbers,
	sum( case when status = 'Valid' then true else false end ) + sum( case when status = 'Invalid' then true else false end )  total_numbers_validated	
from
	public.eyeballing
where date(create_date) >= '2020-02-01'
and date(create_date) <= date(now())



Breakdown of Invalid Report (from eyeballing)
Input
oStart Date
oEnd Date
Output
oTotal Invalid Picture
oTotal Invalid Card
oTotal Invalid Address
oTotal Invalid Name
oTotal Invalid Fingerprint
oTotal Invalid Gender


select
	sum( case when status = 'Invalid' and i.name = 'Picture'  then true else false end ) as total_invalid_picture,
	sum( case when status = 'Invalid' and i.name = 'Valid ID Capture'  then true else false end ) as total_invalid_card,
	sum( case when status = 'Invalid' and i.name = 'Address'  then true else false end ) as total_invalid_address,
	sum( case when status = 'Invalid' and i.name = 'Fingerprint'  then true else false end ) as total_invalid_fingerprint,
	sum( case when status = 'Invalid' and i.name = 'Gender'  then true else false end ) as total_invalid_gender
from
	public.eyeballing e, infraction i 
where e.infraction_fk = i.pk
and date(e.create_date) >= '2020-02-01'
and date(e.create_date) <= date(now())
;



6.4	SIM Reg Reports
Dealer Wise Registration (before and after 48 hours)
Input
oStart Date
oEnd Date
oDealer Type (Glo World, Glo Zone, Others)
Output
oDealer Type
oTrade Code
oChannel Partner Name
oDevice ID
oCount of Registration


select
	d."name" as dealer_type,	kd.deal_code tRADE_code,	kd."name" channel_partner_name,	e.device_id deviceid,	count( 1 ) countofregistrations
from
	dealer_type d, kyc_dealer kd,enrollment_ref e,	node n,	node_assignment na,	sms_activation_request sar
where
	kd.pk = na.kyc_dealer_fk
	and e.id = n.enrollment_ref
	and na.node_fk = n.id
	and sar.enrollment_ref = e.code
	and d.pk = kd.dealer_type_fk
	and date( sar.receipt_timestamp ) >= '2020-02-01'
	and date( sar.receipt_timestamp ) <= date( now())
	--and d."name" = ?
group by
	d."name",
	kd.deal_code,
	e.device_id,
	kd."name" ;


Channel Wise Registration (Summary after 48 hours)
Input
oStart Date
oEnd Date
oChannel
Output
oChannel
oRegistration Count
Note: Count of registration shall be separated based on the date range selected


select
	d."name" as channel, count( 1 ) countofregistrations
from
	kyc_dealer kd,enrollment_ref e,	node n,	node_assignment na,	bfp_sync_log b ,	sms_activation_request sar,	dealer_type d
where
		kd.pk = na.kyc_dealer_fk
	and e.id = n.enrollment_ref
	and na.node_fk = n.id
	and b.enrollment_ref_fk = e.id
	and sar.enrollment_ref = e.code
	and b.unique_id = sar.unique_id
	and b.msisdn = sar.phone_number
	and d.pk = kd.dealer_type_fk
	and b.bfpsyncstatusenum = 'SUCCESS'
	and date( sar.receipt_timestamp ) >= '2020-02-01'
	and date( sar.receipt_timestamp ) <= date( now())
	--and d."name" = ?
group by
	d."name"
	;
	
	

Channel and Device Productivity Report – This displays the unique count of devices that performed registrations in the stated categories
Input
oStart Date
oEnd Date
oChannel
Output
oChannel
oCount of Devices >100
oCount of Devices 50-100
oCount of Devices 10-49
oCount of Devices 2-9
oCount of Devices < 1

select
	d."name" as channel,
	case when count( distinct sar.enrollment_ref ) >= 100 then count(distinct sar.enrollment_ref)  else 0 end as count_of_devices_gt_100,
	case when count( distinct sar.enrollment_ref ) between 50 and 99 then count(distinct sar.enrollment_ref)  else 0 end as count_of_devices_btw_50_and_99,
	case when count( distinct sar.enrollment_ref ) between 10 and 49 then count(distinct sar.enrollment_ref)  else 0 end as count_of_devices_btw_10_and_49,
	case when count( distinct sar.enrollment_ref ) between 2 and 9 then count(distinct sar.enrollment_ref)  else 0 end as count_of_devices_btw_2_and_9,
	case when count( distinct sar.enrollment_ref ) <= 1 then count(distinct sar.enrollment_ref) else 0 end as count_of_devices_lt_1,
	count(distinct sar.enrollment_ref) total_devices
from
	kyc_dealer kd,enrollment_ref e,	node n,	node_assignment na,	bfp_sync_log b ,	sms_activation_request sar,	dealer_type d
where
		kd.pk = na.kyc_dealer_fk
	and e.id = n.enrollment_ref
	and na.node_fk = n.id
	and b.enrollment_ref_fk = e.id
	and sar.enrollment_ref = e.code
	and b.unique_id = sar.unique_id
	and b.msisdn = sar.phone_number
	and d.pk = kd.dealer_type_fk
	and b.bfpsyncstatusenum = 'SUCCESS'
	and date( sar.receipt_timestamp ) >= '2020-02-01'
	and date( sar.receipt_timestamp ) <= date( now())
	--and d."name" = ?
group by
	d."name"
	;


Channel and Device Productivity Report – This displays the count of registrations per channel
Input
oStart Date
oEnd Date
oChannel
Output
oChannel
oCount of Registrations >100
oCount of Registrations 50-100
oCount of Registrations 10-49
oCount of Registrations 2-9
oCount of Registrations  < 1
oTotal

elect
	d."name" as channel,
	case when count( sar.enrollment_ref ) >= 100 then count( sar.enrollment_ref)  else 0 end as count_of_regs_gt_100,
	case when count( sar.enrollment_ref ) between 50 and 99 then count( sar.enrollment_ref)  else 0 end as count_of_regs_btw_50_and_99,
	case when count( sar.enrollment_ref ) between 10 and 49 then count( sar.enrollment_ref)  else 0 end as count_of_regs_btw_10_and_49,
	case when count( sar.enrollment_ref ) between 2 and 9 then count( sar.enrollment_ref)  else 0 end as count_of_regs_btw_2_and_9,
	case when count( sar.enrollment_ref ) <= 1 then count( sar.enrollment_ref) else 0 end as count_of_regs_lt_1,
	count( sar.enrollment_ref) total_regs
from
	kyc_dealer kd,enrollment_ref e,	node n,	node_assignment na,	bfp_sync_log b ,	sms_activation_request sar,	dealer_type d
where
		kd.pk = na.kyc_dealer_fk
	and e.id = n.enrollment_ref
	and na.node_fk = n.id
	and b.enrollment_ref_fk = e.id
	and sar.enrollment_ref = e.code
	and b.unique_id = sar.unique_id
	and b.msisdn = sar.phone_number
	and d.pk = kd.dealer_type_fk
	and b.bfpsyncstatusenum = 'SUCCESS'
	and date( sar.receipt_timestamp ) >= '2020-02-01'
	and date( sar.receipt_timestamp ) <= date( now())
	--and d."name" = ?
group by
	d."name"
	;
	
	


SIM Registration Details 
Input
oMSISDN
Output
oMSISDN
oRECEIVEDDATE
oREGISTRATION CENTER
oSIMSERIAL
oLOCATIONSTATE
oLOCATIONLGA
oSURNAME
oFIRSTNAME
oMIDDLENAME
oDATEOFBIRTH
oGENDER
oMOTHERMAIDENNAME
oRESIDENTIALADDRESS
oRESIDENTIALLGA
oRESIDENTIALSTATE
oNATIONALITY
oSTATEOFORIGIN


select
	phone_number as msisdn, receipt_timestamp as receivedate, serial_number as simserial, st."name" as locationstate, b.surname, b.firstname, b.othername as middlename,
	to_char(b.birthday, 'YYYY-MM-DD') as DATEOFBIRTH, b.gender, d.dda12 AS mothersMaidenName, d.da3 AS residentialAddress, d.dda6 AS residentialLGA, 
	d.dda5 AS residentialState, d.dda19 as nationality, d.da8 AS stateoforigin
from
	sms_activation_request s, dynamic_data d, basic_data b  , state st, user_id u 
where s.unique_id = u.unique_id
and u.id = b.user_id_fk
and d.basic_data_fk = b.id 
and st.id = s.state_id
--and phone_number like '%08129913504%'
;



Dashboard Chart – Total Registration (Android & Windows)
A bar chart showing Mean Time to Activation
A bar chart showing Mean Time to Siebel
A bar chart showing Mean Time to Sync

select 'MTTC' Metric,
abs(round(avg((extract(epoch from bb.activation_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60 ), 2)) tat_in_mins
from sms_activation_request s , bfp_sync_log bb, bid_view bv , meta_data m
where s.unique_id = bb.unique_id
and bv.unique_id = s.unique_id
and bv.unique_id = bb.unique_id
and m.basic_data_fk  = bv.id
and  date(s.receipt_timestamp) = '2019-12-06'
;



select 'MTTS' Metric,
abs(round(avg((extract(epoch from bb.activation_date)::numeric - extract(epoch from BB.FILE_SYNC_DATE)::numeric)/60 ), 2)) tat_in_mins
from sms_activation_request s , bfp_sync_log bb, bid_view bv , meta_data m
where s.unique_id = bb.unique_id
and bv.unique_id = s.unique_id
and bv.unique_id = bb.unique_id
and m.basic_data_fk  = bv.id
and  date(s.receipt_timestamp) = '2019-12-06'
;

Dashboard Chart – Total Registrations (Android Devices)
A bar chart showing Mean Time to Activation
A bar chart showing Mean Time to Siebel
A bar chart showing Mean Time to Sync

 
select 'MTTC' Metric,
coalesce(abs(round(avg((extract(epoch from bb.activation_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60 ), 2)),0) tat_in_mins
from sms_activation_request s , bfp_sync_log bb, bid_view bv , meta_data m
where s.unique_id = bb.unique_id
and bv.unique_id = s.unique_id
and bv.unique_id = bb.unique_id
and m.basic_data_fk  = bv.id
and  date(s.receipt_timestamp) = '2019-12-06'
and M.app_version = '1.00'
;


select 'MTTS' Metric,
coalesce(abs(round(avg((extract(epoch from bb.activation_date)::numeric - extract(epoch from BB.FILE_SYNC_DATE)::numeric)/60 ), 2)),0) tat_in_mins
from sms_activation_request s , bfp_sync_log bb, bid_view bv , meta_data m
where s.unique_id = bb.unique_id
and bv.unique_id = s.unique_id
and bv.unique_id = bb.unique_id
and m.basic_data_fk  = bv.id
and  date(s.receipt_timestamp) = '2019-12-06'
and M.app_version = '1.00'
;


Dashboard Chart – Total Registrations (Windows)
A bar chart showing Mean Time to Activation
A bar chart showing Mean Time to Siebel
A bar chart showing Mean Time to Sync


select 'MTTC' Metric,
coalesce(abs(round(avg((extract(epoch from bb.activation_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60 ), 2)),0) tat_in_mins
from sms_activation_request s , bfp_sync_log bb, bid_view bv , meta_data m
where s.unique_id = bb.unique_id
and bv.unique_id = s.unique_id
and bv.unique_id = bb.unique_id
and m.basic_data_fk  = bv.id
and  date(s.receipt_timestamp) = '2019-12-06'
and M.app_version != '1.00'
;



 
select 'MTTS' Metric,
coalesce(abs(round(avg((extract(epoch from bb.activation_date)::numeric - extract(epoch from BB.FILE_SYNC_DATE)::numeric)/60 ), 2)),0) tat_in_mins
from sms_activation_request s , bfp_sync_log bb, bid_view bv , meta_data m
where s.unique_id = bb.unique_id
and bv.unique_id = s.unique_id
and bv.unique_id = bb.unique_id
and m.basic_data_fk  = bv.id
and  date(s.receipt_timestamp) = '2019-12-06'
and M.app_version != '1.00'
;


MIS Reports
SIM Registration Details
Input
oStart Date
oEnd Date
Output
oNETBOOK ID
oMSISDN
osurname
ofirstname
omiddlename
oDATEOFBIRTH
oGENDER
oRESIDENTIALSTATE
oREGISTRATION DATE
oDATA CAPTURE DATE
oREGISTRATIONCENTER
oIMSI
oSIM_SERIAL_NUMBER

select
	s.enrollment_ref as netbookid,	phone_number as msisdn, b.surname, b.firstname, b.othername as middlename, to_char(b.birthday, 'YYYY-MM-DD') as DATEOFBIRTH,
	b.gender, d.dda12 AS mothersMaidenName, d.dda5 AS residentialState, S.registration_timestamp as registration_date, registration_type, s.serial_number as SIM_SERIAL_NUMBER
from
	sms_activation_request s, dynamic_data d, basic_data b  , state st, user_id u 
where s.unique_id = u.unique_id
and u.id = b.user_id_fk
and d.basic_data_fk = b.id 
and st.id = s.state_id
and date(receipt_timestamp) >= '2020-02-01'
and date(receipt_timestamp) <= date(now())
;




Sample Dump of 7% of Registrations – For each of the result, the user would see just 7% of the total registrations within the date selected
	
Input 
oStart Date
oEnd Date
Output
oMSISDN
oNETBOOK_ID
oACTIVATIONDATE 
oREGISTRATION_DATE
oACT_DATE_DIFF


select * from (
select
	phone_number as msisdn,s.enrollment_ref as netbookid, b.activation_date,
	s.registration_timestamp as REGISTRATION_DATE, 
	coalesce(abs(round((extract(epoch from b.activation_date)::numeric - extract(epoch from s.registration_timestamp)::numeric)/60, 2)),0) oACT_DATE_DIFF
from
	sms_activation_request s, bfp_sync_log b  
where s.unique_id = b.unique_id
and b.msisdn = s.phone_number
and date(receipt_timestamp) >= '2020-02-01'
and date(receipt_timestamp) <= date(now())
--limit ((7/100)*3000)
) a 
order by 4
FETCH FIRST 
	((7/100)*(select count(1)
	from
		sms_activation_request s, bfp_sync_log b  
	where s.unique_id = b.unique_id
	and b.msisdn = s.phone_number
	and date(receipt_timestamp) >= '2020-02-01'
	and date(receipt_timestamp) <= date(now())))
ROWS ONLY
;


6.7	Other Reports

Device Details – This report would load without any input

Output
Date Device was tagged
Feedback of the last approver
Notebook Status i.e Channel + Device Type
Trade Code
Device Type
Device Serial Number
MSISDN
Server Status
Device ID

with er as (
select id, code, device_id 
from enrollment_ref e 
),
n as (
select id, enrollment_ref
from node
),
na as (
select node_fk, kyc_dealer_fk
from node_assignment
),
dtr as (
select pk, kit_tag , create_date
from device_tag_request
),
hbs as (
select tag, APP_version
from heart_beat_status
),
dt as (
select pk , "name"
from dealer_type
),
kd as (
select pk, dealer_type_fk, deal_code
from kyc_dealer
),
dtra as (
select tag_approval_status_enum, device_tag_request_fk 
from device_tag_request_approval
)
select 
	dtr.create_date as date_device_was_tagged, dtra.tag_approval_status_enum as feedback_of_last_approver,
	dt."name" ||' '|| case when hbs.app_version = '1.00' then 'DROID' else 'WIN' end as notebook_status,
	kd.deal_code as trade_code, case when hbs.app_version = '1.00' then 'DROID' else 'WIN' end as device_type,
	er.device_id
from er 
left join dtr on er.code = dtr.kit_tag 
left join dtra on dtr.pk = dtra.device_tag_request_fk
left join hbs on er.code = hbs.tag, 
n, na, dt, kd 
where er.id = n.enrollment_ref
and n.id = na.node_fk
and na.kyc_dealer_fk = kd.pk
and kd.dealer_type_fk = dt.pk
;




select 	create_date as date_device_was_tagged, tag_approval_status_enum as feedback_of_last_approver,
	"name" ||' '|| case when app_version = '1.00' then 'DROID' else 'WIN' end as notebook_status,
	deal_code as trade_code, case when app_version = '1.00' then 'DROID' else 'WIN' end as device_type,
	device_id from (
select * 
from (
	select er.id, er.code, er.device_id, dt."name", kd.deal_code
	from enrollment_ref er, node n, node_assignment na, kyc_dealer kd, dealer_type dt 
	where er.id = n.enrollment_ref
	and n.id = na.node_fk
	and na.kyc_dealer_fk = kd.pk
	and kd.dealer_type_fk = dt.pk
) a
left join (
select dtra.tag_approval_status_enum, dtr.kit_tag, dtr.create_date
from device_tag_request dtr
left join device_tag_request_approval dtra on  dtr.pk = dtra.device_tag_request_fk
) b  on b.kit_tag = a.code 
left join ( 
select app_version, tag
from heart_beat_status
) c on c.tag = a.code
) d 
;


Device Trade Code - This report would load without input
Trade Code
Dealer Name (Channel Name)
Channel
Device ID

SELECT deal_code as trade_code, kd."name" as dealer_name, dt."name" as channel, er.device_id
FROM enrollment_ref er, node n, node_assignment na, kyc_dealer kd, dealer_type dt 
	where er.id = n.enrollment_ref
	and n.id = na.node_fk
	and na.kyc_dealer_fk = kd.pk
	and kd.dealer_type_fk = dt.pk
;


SIM Registration Daily Activations
Input
oStart Date
oEnd Date
oKit Tag
Output
oDate
oKit Tag
oDevice ID
oCount





select date(receipt_timestamp) date, enrollment_ref kittag, device_id, count(1)
from sms_activation_request s, enrollment_ref e 
where s.enrollment_ref = e.code
and  date(receipt_timestamp) >= '2020-02-01'
and date(receipt_timestamp) <= date(now())
group by 1,2,3
order by 1