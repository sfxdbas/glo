

unverified -> (glo - nin) 
invalid nin -> (notfound&invalid)
nin validated -> (valid) 
validation failed -> (invalid demo match
 



select verification_status, count(1) from nin_link_log
group by verification_status



1. Breakdown of verified records( Total,Valid, invalid, Demo mismatch etc)
2. Breakdown by Fingerprint for verififed records
3.Demographics and MSISDN and NIN for records with Demo-mismatch from NIMC


--1.
select CASE 
		WHEN verification_status IN ('NOT_FOUND', 'INVALID_NIN_INPUT') THEN 'INVALID NIN'
		WHEN verification_status IN ('INVALID_DEMO_MATCH_NIMC','INVALID_DEMO_MATCH_SFX') THEN 'VALIDATION FAILED'
		WHEN verification_status = 'VALID' THEN 'NIN VALIDATED'
	   ELSE verification_status END AS verification_status,
count(1)
from external_nin_link_log
where verification_status in ('NOT_FOUND','VALID','INVALID_NIN_INPUT', 
							 'INVALID_DEMO_MATCH_NIMC','INVALID_DEMO_MATCH_SFX')
group by 1-- limit 20
ORDER BY 1 
;

--2.
select NV.VERIFICATION_METHOD, COUNT(1)
from external_nin_link_log EL, NIMC_VERIFICATION_LOG NV
where TRANSACTION_ID = VERIFICATION_TRANSACTION_ID 
AND verification_status = 'VALID'
GROUP BY 1 
;

--3.
select EL.FIRST_NAME AS SIMREGFIRSTNAME, EL.SURNAME AS SIMREGLASTNAME, NV.FIRST_NAME AS NIMCFIRSTNAME,
	NV.SURNAME AS NIMCLASTNAME, EL.MSISDN, EL.NIN
from external_nin_link_log EL, NIMC_VERIFICATION_LOG NV
where TRANSACTION_ID = VERIFICATION_TRANSACTION_ID 
AND verification_status = 'INVALID_DEMO_MATCH_NIMC'
-- GROUP BY 1 
;

--4.
WITH T1 AS (
SELECT CASE 
		WHEN verification_status IN ('NOT_FOUND', 'INVALID_NIN_INPUT') THEN 'INVALID NIN'
		WHEN verification_status IN ('INVALID_DEMO_MATCH_NIMC','INVALID_DEMO_MATCH_SFX') THEN 'VALIDATION FAILED'
		WHEN verification_status = 'VALID' THEN 'NIN VALIDATED'
	   ELSE verification_status END AS verification_status, 
	round((extract(epoch from RESPONSE_TIME)::numeric - extract(epoch from REQUEST_TIME)::numeric)/60,2) 
	  AS DIFF 
FROM AGILITY_INTEGRATION_LOG_ AL, external_nin_link_log EL 
WHERE AL.MSISDN = EL.NIN
-- WHERE DATE(CREATE_DATE) = DATE(NOW) 
AND verification_status in ('NOT_FOUND','VALID','INVALID_NIN_INPUT', 
							 'INVALID_DEMO_MATCH_NIMC','INVALID_DEMO_MATCH_SFX')
) SELECT verification_status, MAX(DIFF), MIN(DIFF), ROUND(AVG(DIFF),2) AS AVG_ FROM T1
GROUP BY 1 
;

