-- PROCEDURE: public.insert_missing_record_into_bio_demo_pcd()

-- DROP PROCEDURE public.insert_missing_record_into_bio_demo_pcd();

CREATE OR REPLACE PROCEDURE public.insert_missing_record_into_bio_demo_pcd(
	)
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 
BEGIN

truncate biodata_demographics_replica;

commit;


insert into biodata_demographics_replica
SELECT hibernate_sequence.nextval as bid, b.id,b.firstname, b.surname,  b.othername,  b.birthday,  b.gender,
dd.dda19 as nationality,
dd.da8 AS stateoforigin,  dd.da2 AS occupation,  dd.da19 AS subscriberType, dd.dda9 AS registrationlga,
dd.da3 AS residentialAddress,dd.dda6 AS residentialAddressLGA ,
dd.dda5 AS residentialAddressState, dd.da6 AS email,  dd.dda2,  dd.dda3,  dd.dda1,
dd.dda11 AS registrationType, dd.dda14 AS companyId,  dd.dda8 AS companyName,  dd.dda4 AS resident,
dd.dda7 AS postalCode,  dd.dda15 AS companyAddress,  dd.dda17 AS companyAddressLGA, dd.dda16 AS companyAddressState,
dd.dda18 AS companyAddressPostalCode, b.ID AS basicdataId,  s.phone_number,  u.unique_id,  dd.dda12 AS mothersMaidenName,
s.enrollment_ref as clientId,  e.mac_address,  s.receipt_timestamp , pd.EXPIRY_DATE,
pd.ISSUE_COUNTRY as coutryissuedcode , pd.PASSPORT_NUMBER,
 kam.confirmation_timestamp, dd.dda20, S.SERIAL_NUMBER, DD.da9 AS LGAOFORIGIN,DD.DDA2 AS AREAOFRESIDENCE,
DD.DA5 AS IDENTIFICATIONTYPE,DD.DA10 AS ALTERNATEPHONENUMBER, S.REGISTRATION_TIMESTAMP,null, kam.confirmation_status
FROM basic_data b left join signature sg on b.id = sg.basic_data_fk left join passport_detail pd on pd.signature_fk = sg.id
LEFT JOIN kyc_agility_mapper kam ON kam.basic_data_fk = b.ID , dynamic_data dd , sms_activation_request s, user_id u, enrollment_ref e
WHERE u.ID = b.user_id_fk 
AND u.unique_id = s.unique_id  AND b.ID = dd.basic_data_fk AND e.code = s.enrollment_ref
-- and b.id > (select max(id) from biodata_demographics)
and not exists (select id from biodata_demographics bb where b.id = bb.id)
;


insert into biodata_demographics
select * from biodata_demographics_replica br 
where not exists (select id from biodata_demographics bd where br.id = bd.id )

;


commit;


commit;

END insert_missing_record_into_bio_demo_pcd$BODY$;



