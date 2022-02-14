with t1 as (
SELECT  
dd.dda9 as placeofreg,DDA34 as nin, b.id, s.phone_number, s.receipt_timestamp,  S.REGISTRATION_TIMESTAMP,null, b.firstname, b.surname,  b.othername,  b.birthday,  b.gender,
dd.dda19 as nationality,
dd.da8 AS stateoforigin,  dd.da2 AS occupation,  dd.da19 AS subscriberType, dd.dda9 AS registrationlga,
dd.da3 AS residentialAddress,dd.dda6 AS residentialAddressLGA ,
dd.dda5 AS residentialAddressState, dd.da6 AS email,  dd.dda2,  dd.dda3,  dd.dda1,
dd.dda11 AS registrationType, dd.dda14 AS companyId,  dd.dda8 AS companyName,  dd.dda4 AS resident,
dd.dda7 AS postalCode,  dd.dda15 AS companyAddress,  dd.dda17 AS companyAddressLGA, dd.dda16 AS companyAddressState,
dd.dda18 AS companyAddressPostalCode, b.ID AS basicdataId, u.unique_id,  dd.dda12 AS mothersMaidenName,
s.enrollment_ref as clientId, pd.EXPIRY_DATE,
pd.ISSUE_COUNTRY as coutryissuedcode , pd.PASSPORT_NUMBER,
 kam.confirmation_timestamp, dd.dda20, S.SERIAL_NUMBER, DD.da9 AS LGAOFORIGIN,DD.DDA2 AS AREAOFRESIDENCE,
DD.DA5 AS IDENTIFICATIONTYPE,DD.DA10 AS ALTERNATEPHONENUMBER, kam.confirmation_status
--s.phone_number,receipt_timestamp,
,rank() over (partition by s.phone_number order by s.receipt_timestamp desc  ) as rank_
FROM basic_data b 
left join signature sg on b.id = sg.basic_data_fk 
left join passport_detail pd on pd.signature_fk = sg.id
LEFT JOIN kyc_agility_mapper kam ON kam.basic_data_fk = b.ID ,
dynamic_data dd , bfp_sync_log bb, user_id u, sms_activation_request s 
WHERE u.ID = b.user_id_fk 
AND u.unique_id = s.unique_id  
AND b.ID = dd.basic_data_fk 
and bb.unique_id = u.unique_id 
AND bb.msisdn = s.phone_number
and bb.bfpsyncstatusenum = 'SUCCESS'
and bb.reg_type like 'NM%' -- commenting shows New reg & Re reg
and date(s.receipt_timestamp) between '2021-04-01' and '2021-05-31'
) select * from t1 
where rank_=1
--limit 10
;