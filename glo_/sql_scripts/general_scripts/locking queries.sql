explain analyze select count(bsl.pk) as rowCount 
from bfp_sync_log bsl where bsl.bfpsyncstatusenum = 'SUCCESS';

SELECT bd.id AS basicDataId, dd.id AS dynamicDataId, bd.surname AS surname, 
bd.firstname AS firstName, bd.gender AS gender, dd.dda12 AS mothersMaidenName, 
bd.birthday AS dob, dd.da5 AS idType, dd.da3 AS residentialAddress, dd.dda7 AS postalCode,
 dd.dda6 AS lgaOfRes, dd.dda5 AS stateOfRes, dd.da9 AS lgaOfOrigin, dd.da8 AS stateOfOrigin,
 dd.dda9 AS lgaOfReg, dd.dda20 AS portraitOverrideReason, dd.dda36 AS ninStatus, bd.othername;

select qrr.description , quarantined_reg_fk as quarantineRegPk 
from quarantined_rejection_reason qrr where quarantined_reg_fk 
in ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, 
$21, $22, $23, $24, $25, $26, $27, $28, $29, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39,
 $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $50, $51, $52, $53, $54, $55, $56, $57, $58,
 $59, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $70, $71, $72, $73, $74, $75, $76, $77,
 $78, $79, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $90, $91, $92, $93, $94, $95, $96,
 $97, $98, $99, $100, $101, $102, $103, $104, $105, $106, $107, $108, $109, $110, $111, $112, 
 $113, $114, $115, $116, $117, $118, $119, $120, $121, $122, $123, $124, $125, $126, $127, 
 $128, $129, $130, $131, $132, $133, $134, $135, $136, $137, $138, $139, $140, $141, $142,
 $143, $144, $145, $146, $147, $148, $149, $150, $151, $152, $153, $154, $155, $156, $157,
 $158, $159, $160, $161, $162, $163, $164, $165, $166, $167;

with t1 as ( select qr.release_status as releaseStatus 
from quarantined_registration qr 
left join quarantined_msisdn_detail qmd on qr.pk = qmd.quarantined_reg_fk
 where exists (select 1 from quarantined_rejection_reason qrr
 where qrr.quarantined_reg_fk= qr.pk ) ) 
 select sum(releaseStatus = 'RELEASED') as totalReleased, 
 sum(releaseStatus = 'QUARANTINED') as totalQuarantined,
 sum(releaseStatus = 'REJECTED') as totalRejected from t1;

WITH bsl AS (SELECT bsl.msisdn AS phoneNumber, bsl.activation_date AS activationDate, 
bsl.sim_serial AS serialNumber, bsl.activationstatusenum AS activationStatus,
 bsl.deactivation_reason AS deactivationReason, bsl.capture_mode AS captureMode,
 bsl.unique_id AS uniqueId, bsl.agent_email_address AS regAgent, bsl.reg_type AS regType,
 bsl.file_sync_date AS regDate, bsl.pk AS bfpSyncLogPk, bsl.create_date AS createDate,
 e.code AS kitTag, e.id AS enrollmentRefId
 FROM bfp_sync_log bsl
 left join enrollment_ref e on e.id = bsl.enrollment_ref_fk 
 WHERE bsl.bfpsyncstatusenum = $1 ), 
 eyeball AS (SELECT eb.bfp_sync_log_fk AS bslPk, eb.status AS eye

SELECT ssd.check_status, ssd.swap_status, ssd.reg_status_description, ssd.unique_id, 
ssd.msisdn, 
(select sa.feedback from simswap_approval sa
 where sa.sim_swap_demographics_fk = ssd.pk 
 order by create_date desc limit 1 ) 
 from sim_swap_demographic ssd
 where CONCAT(ssd.msisdn, '_', ssd.unique_id) in ($1, $2) 
 ORDER by ssd.last_modified

select COALESCE(count(na.pk),0) as rowCount
 from node_assignment na 
 left join node nd on nd.id = na.node_fk 
 where na.kyc_dealer_fk NOT IN (SELECT distinct(DEALER_FK) 
 from DEALER_EXCLUSION_LIST) 
 and exists (select 1 from simrop_registration_trend srt
 where srt.node_id = na.node_fk 
 AND TRUNC(srt.SYNC_DATE) >= $1) 
 and (nd.deleted is null or nd.deleted = $2)

	---- work
		select
			coalesce(count(na.pk), 0) as rowcount
		from
			node_assignment na
		left join node nd on			nd.id = na.node_fk
		where			na.kyc_dealer_fk not in (
			select
				distinct(DEALER_FK)
			from				DEALER_EXCLUSION_LIST)
			and exists (
			select				1
			from				simrop_registration_trend srt
			where				srt.node_id = na.node_fk
				and TRUNC(srt.SYNC_DATE) >= $1)
			and (nd.deleted is null	or nd.deleted = $2)
			;

select 
sum(upper(status) = 'ACTIVE') as activeMsisdn, 
sum(upper(status) = 'AVAILABLE') as availableMsisdn, 
sum(upper(other_status) = 'BLOCKED') as blockedMsisdn 
from msisdn_provision_status mps

select qr.pk as quarantineRegPk, qmd.msisdn_category as msisdnCategory, da6 as email, 
da10 as alternatePhoneNumber, da2 as occupation, da3 as residentialAddress, da5 as idType, 
dda6 as lgaOfRes, da8 as stateOfOrigin, da9 as lgaOfOrigin, birthday as dob, dda11 as regType, 
dda12 as mothersMaidenName, dda14 as companyId, dda15 as companyAddress, da13 as city,
 dda16 as companyState, dda17 as companyLga, dda18 as companyPostalCode, dda19 as nationality,
 dda20 as portraitOverrideReason, dda34 as nin, dda5 as stateOfRes, dda7 as postalCode,
 dda8 as companyName, dda9 as lgaOfReg, qr.first_name as firstName, gender , kit_tag as kitTag, 
 other_name as otherName, passport_expiry_date as passportExpiryDate, 
 passport_issue_country as passportIssueCountry, feedback as feedback, 
 passport_number as passportNumber, qmd.msisdn as phoneNumber, qmd.serial as serialNumber, 
 quarantine_reason as quarantineReason , registration_agent as regAgent , 
 registration_date as regDate, residency_status as nigerianResidency, surname ,


select glonimcver0_.PK as PK1_16_, glonimcver0_.ACTIVE as ACTIVE2_16_, 
glonimcver0_.CREATE_DATE as CREATE_D3_16_, glonimcver0_.DELETED as DELETED4_16_, 
glonimcver0_.LAST_MODIFIED as LAST_MOD5_16_, glonimcver0_.AGENT_EMAIL as AGENT_EM6_16_, 
glonimcver0_.CAPTURE_SESSION_ID as CAPTURE_7_16_, glonimcver0_.CHANNEL as CHANNEL8_16_,
 glonimcver0_.DEVICE_ID as DEVICE_I9_16_, glonimcver0_.KIT_TAG as KIT_TAG10_16_, 
 glonimcver0_.MSISDN as MSISDN11_16_, glonimcver0_.NIN as NIN12_16_,
 glonimcver0_.PROCESS_TYPE as PROCESS13_16_, glonimcver0_.SIM_SERIAL as SIM_SER14_16_,
 glonimcver0_.TRANSACTION_ID as TRANSAC15_16_, 
 glonimcver0_.VERIFICATION_METHOD as VERIFIC16_16_
 from NIMC_VERIFICATION_FAILURE_LOG glonimcver0_ 
 where glonimcver0_.DELETED=false 
 and glonimcver0_.MSISDN=$1
 order by glonimcver0_.CREATE_DATE desc limit $2
