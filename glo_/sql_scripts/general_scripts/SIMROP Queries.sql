-- > 1.
select
	qr.pk as quarantineRegPk,
	qmd.msisdn_category as msisdnCategory,
	da6 as email,
	da10 as alternatePhoneNumber,
	da2 as occupation,
	da3 as residentialAddress,
	da5 as idType,
	dda6 as lgaOfRes,
	da8 as stateOfOrigin,
	da9 as lgaOfOrigin,
	birthday as dob,
	dda11 as regType,
	dda12 as mothersMaidenName,
	dda14 as companyId,
	dda15 as companyAddress,
	da13 as city,
	dda16 as companyState,
	dda17 as companyLga,
	dda18 as companyPostalCode,
	dda19 as nationality,
	dda20 as portraitOverrideReason,
	dda34 as nin,
	dda5 as stateOfRes,
	dda7 as postalCode,
	dda8 as companyName,
	dda9 as lgaOfReg,
	first_name as firstName,
	gender ,
	kit_tag as kitTag,
	other_name as otherName,
	passport_expiry_date as passportExpiryDate,
	passport_issue_country as passportIssueCountry,
	feedback as feedback,
	passport_number as passportNumber,
	qmd.msisdn as phoneNumber,
	qmd.serial as serialNumber,
	quarantine_reason as quarantineReason ,
	registration_agent as regAgent ,
	registration_date as regDate,
	residency_status as nigerianResidency,
	surname ,
	qr.unique_id as uniqueId,
	qr.eye_balling_km_user_fk as kmUserPk,
	qr.release_status as releaseStatus,
	rr.name as eyeballingRejectionReason,
	qr.dda36 as ninStatus,
	qr.dda23 as transactionId,
	qr.dda51 as partiallyActivated
from	quarantined_registration qr
left join quarantined_msisdn_detail qmd on	qr.pk = qmd.quarantined_reg_fk
left join eyeballing_rejection_reason rr on	rr.pk = qr.eyeballing_rejection_reason_fk
where
	(qmd.msisdn = '08055601277'
	or qmd.serial = '8923450410087667490')
	and exists (
	select
		1
	from
		quarantined_rejection_reason qrr
	where
		qrr.quarantined_reg_fk = qr.pk )
order by
	registration_date desc;
	
	
	
	
	
-- > 2.
select
	qr.pk as quarantineRegPk,
	qmd.msisdn_category as msisdnCategory,
	da6 as email,
	da10 as alternatePhoneNumber,
	da2 as occupation,
	da3 as residentialAddress,
	da5 as idType,
	dda6 as lgaOfRes,
	da8 as stateOfOrigin,
	da9 as lgaOfOrigin,
	birthday as dob,
	dda11 as regType,
	dda12 as mothersMaidenName,
	dda14 as companyId,
	dda15 as companyAddress,
	da13 as city,
	dda16 as companyState,
	dda17 as companyLga,
	dda18 as companyPostalCode,
	dda19 as nationality,
	dda20 as portraitOverrideReason,
	dda34 as nin,
	dda5 as stateOfRes,
	dda7 as postalCode,
	dda8 as companyName,
	dda9 as lgaOfReg,
	first_name as firstName,
	gender ,
	kit_tag as kitTag,
	other_name as otherName,
	passport_expiry_date as passportExpiryDate,
	passport_issue_country as passportIssueCountry,
	feedback as feedback,
	passport_number as passportNumber,
	qmd.msisdn as phoneNumber,
	qmd.serial as serialNumber,
	quarantine_reason as quarantineReason ,
	registration_agent as regAgent ,
	registration_date as regDate,
	residency_status as nigerianResidency,
	surname ,
	qr.unique_id as uniqueId,
	qr.eye_balling_km_user_fk as kmUserPk,
	qr.release_status as releaseStatus,
	rr.name as eyeballingRejectionReason,
	qr.dda36 as ninStatus,
	qr.dda23 as transactionId,
	qr.dda51 as partiallyActivated
from	quarantined_registration qr
left join quarantined_msisdn_detail qmd on	qr.pk = qmd.quarantined_reg_fk
left join eyeballing_rejection_reason rr on	rr.pk = qr.eyeballing_rejection_reason_fk
where
	to_char(registration_date, 'yyyy-MM-dd') >= '2021-01-01'
	and exists (
	select
		1
	from
		quarantined_rejection_reason qrr
	where
		qrr.quarantined_reg_fk = qr.pk )
order by
	registration_date desc;
	
	
	
-- > 3.
select
	qr.pk as quarantineRegPk,
	qmd.msisdn_category as msisdnCategory,
	da6 as email,
	da10 as alternatePhoneNumber,
	da2 as occupation,
	da3 as residentialAddress,
	da5 as idType,
	dda6 as lgaOfRes,
	da8 as stateOfOrigin,
	da9 as lgaOfOrigin,
	birthday as dob,
	dda11 as regType,
	dda12 as mothersMaidenName,
	dda14 as companyId,
	dda15 as companyAddress,
	da13 as city,
	dda16 as companyState,
	dda17 as companyLga,
	dda18 as companyPostalCode,
	dda19 as nationality,
	dda20 as portraitOverrideReason,
	dda34 as nin,
	dda5 as stateOfRes,
	dda7 as postalCode,
	dda8 as companyName,
	dda9 as lgaOfReg,
	first_name as firstName,
	gender ,
	kit_tag as kitTag,
	other_name as otherName,
	passport_expiry_date as passportExpiryDate,
	passport_issue_country as passportIssueCountry,
	feedback as feedback,
	passport_number as passportNumber,
	qmd.msisdn as phoneNumber,
	qmd.serial as serialNumber,
	quarantine_reason as quarantineReason ,
	registration_agent as regAgent ,
	registration_date as regDate,
	residency_status as nigerianResidency,
	surname ,
	qr.unique_id as uniqueId,
	qr.eye_balling_km_user_fk as kmUserPk,
	qr.release_status as releaseStatus,
	rr.name as eyeballingRejectionReason,
	qr.dda36 as ninStatus,
	qr.dda23 as transactionId,
	qr.dda51 as partiallyActivated
from	quarantined_registration qr
left join quarantined_msisdn_detail qmd on	qr.pk = qmd.quarantined_reg_fk
left join eyeballing_rejection_reason rr on	rr.pk = qr.eyeballing_rejection_reason_fk
where
	to_char(registration_date, 'yyyy-MM-dd') <= '2021-01-01'
	and exists (
	select
		1
	from
		quarantined_rejection_reason qrr
	where
		qrr.quarantined_reg_fk = qr.pk )
order by
	registration_date desc;
	
	
-- > 4.
select
	qr.pk as quarantineRegPk,
	qmd.msisdn_category as msisdnCategory,
	da6 as email,
	da10 as alternatePhoneNumber,
	da2 as occupation,
	da3 as residentialAddress,
	da5 as idType,
	dda6 as lgaOfRes,
	da8 as stateOfOrigin,
	da9 as lgaOfOrigin,
	birthday as dob,
	dda11 as regType,
	dda12 as mothersMaidenName,
	dda14 as companyId,
	dda15 as companyAddress,
	da13 as city,
	dda16 as companyState,
	dda17 as companyLga,
	dda18 as companyPostalCode,
	dda19 as nationality,
	dda20 as portraitOverrideReason,
	dda34 as nin,
	dda5 as stateOfRes,
	dda7 as postalCode,
	dda8 as companyName,
	dda9 as lgaOfReg,
	first_name as firstName,
	gender ,
	kit_tag as kitTag,
	other_name as otherName,
	passport_expiry_date as passportExpiryDate,
	passport_issue_country as passportIssueCountry,
	feedback as feedback,
	passport_number as passportNumber,
	qmd.msisdn as phoneNumber,
	qmd.serial as serialNumber,
	quarantine_reason as quarantineReason ,
	registration_agent as regAgent ,
	registration_date as regDate,
	residency_status as nigerianResidency,
	surname ,
	qr.unique_id as uniqueId,
	qr.eye_balling_km_user_fk as kmUserPk,
	qr.release_status as releaseStatus,
	rr.name as eyeballingRejectionReason,
	qr.dda36 as ninStatus,
	qr.dda23 as transactionId,
	qr.dda51 as partiallyActivated
from
	quarantined_registration qr
left join quarantined_msisdn_detail qmd on
	qr.pk = qmd.quarantined_reg_fk
left join eyeballing_rejection_reason rr on
	rr.pk = qr.eyeballing_rejection_reason_fk
where
	kit_tag = 'GLO-HH-909H'
	and exists (
	select
		1
	from
		quarantined_rejection_reason qrr
	where
		qrr.quarantined_reg_fk = qr.pk )
order by
	registration_date desc;
	
	

-- > 5.
select
	qr.pk as quarantineRegPk,
	qmd.msisdn_category as msisdnCategory,
	da6 as email,
	da10 as alternatePhoneNumber,
	da2 as occupation,
	da3 as residentialAddress,
	da5 as idType,
	dda6 as lgaOfRes,
	da8 as stateOfOrigin,
	da9 as lgaOfOrigin,
	birthday as dob,
	dda11 as regType,
	dda12 as mothersMaidenName,
	dda14 as companyId,
	dda15 as companyAddress,
	da13 as city,
	dda16 as companyState,
	dda17 as companyLga,
	dda18 as companyPostalCode,
	dda19 as nationality,
	dda20 as portraitOverrideReason,
	dda34 as nin,
	dda5 as stateOfRes,
	dda7 as postalCode,
	dda8 as companyName,
	dda9 as lgaOfReg,
	first_name as firstName,
	gender ,
	kit_tag as kitTag,
	other_name as otherName,
	passport_expiry_date as passportExpiryDate,
	passport_issue_country as passportIssueCountry,
	feedback as feedback,
	passport_number as passportNumber,
	qmd.msisdn as phoneNumber,
	qmd.serial as serialNumber,
	quarantine_reason as quarantineReason ,
	registration_agent as regAgent ,
	registration_date as regDate,
	residency_status as nigerianResidency,
	surname ,
	qr.unique_id as uniqueId,
	qr.eye_balling_km_user_fk as kmUserPk,
	qr.release_status as releaseStatus,
	rr.name as eyeballingRejectionReason,
	qr.dda36 as ninStatus,
	qr.dda23 as transactionId,
	qr.dda51 as partiallyActivated
from
	quarantined_registration qr
left join quarantined_msisdn_detail qmd on	qr.pk = qmd.quarantined_reg_fk
left join eyeballing_rejection_reason rr on	rr.pk = qr.eyeballing_rejection_reason_fk
where	/*to_char(registration_date, 'yyyy-MM-dd') >= 
	and*/ exists (
	select		1
	from		quarantined_rejection_reason qrr
	where		qrr.quarantined_reg_fk = qr.pk )
	and(exists (
	select		*
	from		work_assignment wa ,		state s,		lga lg,		region r
	where 		r.id = wa.assignment_fk
		and r.id = s.region_fk
		and lg.state_fk = s.id
		and upper(qr.dda9) = upper(lg.name)
		and wa.km_user_fk = 901303396
		and wa.assignment_category = 'REGION'
		and wa.deleted = false))
order by	registration_date desc;


-- 6.

