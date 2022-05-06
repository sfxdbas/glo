select * from update_user_details_09082021;

select id,dda34 from dynamic_data dd where basic_data_fk = 190658546;

with t1 as (
select nsd.nin, dda34, sar.phone_number , sar.customer_name , sar.receipt_timestamp,bd.id,
dda23,da40,da1,bd.birthday ,da2,DDA12,
da6,bd.firstname,bd.gender,da27,bd.othername,dda27,da11,
da28,dda2,dda6,dda7,dda5,da9,da8,bd.surname,da38,dda25,da34,p.passport_data 
,row_number()over(partition by sar.phone_number order by sar.receipt_timestamp desc )
from sms_activation_request sar --on uud.msisdn = sar.phone_number
join user_id ui on ui.unique_id = sar.unique_id
join basic_data bd on ui.id = bd.user_id_fk
join dynamic_data dd on bd.id = dd.basic_data_fk
left join passport p on p.basic_data_fk = bd.id  
join user_details_update_24082021 nsd on nsd.msisdn = sar.phone_number 
), t2 as (
select 
row_number()over(partition by nvl.nin order by nvl.create_date desc ),
nvl.nin, nvl.create_date,TRANSACTION_ID,BIRTH_COUNTRY,BIRTH_DATE,
to_char(BIRTH_DATE::timestamp, 'yyyy-mm-dd') as b2,
BIRTH_LGA,BIRTH_STATE,DOCUMENT_NO,
EDUCATIONAL_LEVEL,EMAIL,EMPLOYMENT_STATUS,FIRST_NAME,
GENDER,HEIGTH,MAIDEN_NAME,MATERIAL_STATUS,
MIDDLE_NAME,/*nvl.NIN,*/NOK_ADDRESS_1,NOK_ADDRESS_2,
NOK_FIRST_NAME,NOK_LGA,NOK_MIDDLE_NAME,NOK_POSTAL_CODE,
NOK_STATE,NOK_SURNAME,NOK_TOWN,N_SPOKEN_LANG,O_SPOKEN_LANG,
OTHER_NAME,P_FIRST_NAME,PHOTO,P_MIDDLE_NAME,PROFESSION,
P_SURNAME,RELIGION,RESIDENCE_ADDRESS_LINE_1,RESIDENCE_ADDRESS_LINE_2,
RESIDENCE_TOWN,RESIDENCE_LGA,RESIDENCE_POSTAL_CODE,RESIDENCE_STATE,
RESIDENCE_STATUS,SELF_ORIGIN_LGA,SELF_ORIGIN_PLACE,SELF_ORIGIN_STATE,
SIGNATURE,SURNAME,TELEPHONE_NO,TITLE,TRACKING_ID
from  nimc_verification_log nvl 
join user_details_update_24082021 nsd on nsd.nin = nvl.nin
--and nvl.nin ='72987951721'
where nvl.birth_date not like '*%'
) 
select t1.id,passport_data,photo,
--loread( lo_open( passport_data, 262144 ), 1000000 ) passport_data,
--loread( lo_open( photo, 262144 ), 1000000 ) photo,
'update passport set passport_data = '||''''||photo||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda23 = '||''''||TRANSACTION_ID||''''||' where basic_data_fk = '||t1.id||';',
-- 'update dynamic_data set da40  = '||''''||BIRTH_COUNTRY ||''''||' where basic_data_fk = '||t1.id||';',
'update dynamic_data set da1   = '||''''||BIRTH_DATE    ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set da6   = '||''''||EMAIL         ||''''||' where basic_data_fk = '||t1.id||';',
-- 'update dynamic_data set da27  = '||''''||HEIGTH        ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda34 = '||''''||t2.NIN        ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set da2   = '||''''||PROFESSION    ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda27 = '||''''||RELIGION      ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set da11  = '||''''||RESIDENCE_ADDRESS_LINE_1||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set da28  = '||''''||RESIDENCE_ADDRESS_LINE_2||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda2  = '||''''||RESIDENCE_TOWN          ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda6  = '||''''||RESIDENCE_LGA           ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda7  = '||''''||RESIDENCE_POSTAL_CODE   ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda5  = '||''''||RESIDENCE_STATE         ||''''||' where basic_data_fk = '||t1.id||';',
-- 'update dynamic_data set da9   = '||''''||SELF_ORIGIN_LGA         ||' where basic_data_fk = '||t1.id||';',
-- 'update dynamic_data set da8   = '||''''||SELF_ORIGIN_STATE       ||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set da38  = '||''''||t2.TELEPHONE_NO         ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set dda25 = '||''''||TITLE                   ||''''||' where basic_data_fk = '||t1.id||';',
--'update dynamic_data set da34  = '||''''||TRACKING_ID             ||''''||' where basic_data_fk = '||t1.id||';',
'update dynamic_data set DDA12  = '||''''||MAIDEN_NAME             ||''''||' where basic_data_fk = '||t1.id||';',
'update basic_data set birthday = '||''''||b2::timestamp||''''||' where id = '||t1.id||';',
'update basic_data set othername ='||''''||MIDDLE_NAME  ||''''||' where id = '||t1.id||';',
'update basic_data set firstname ='||''''||FIRST_NAME   ||''''||' where id = '||t1.id||';',
'update basic_data set surname   ='||''''||t2.SURNAME   ||''''||' where id = '||t1.id||';',
 'update basic_data set gender    ='||''''||case when t2.GENDER = 'm' then 'MALE' else 'FEMALE' end||''''|| ' where id = '||t1.id||';',
TRANSACTION_ID,	dda23,MAIDEN_NAME,dda12,
BIRTH_COUNTRY,	da40,birthday,b2::timestamp,
BIRTH_DATE,	da1,
EMAIL,	da6,
FIRST_NAME,	firstname,
t2.GENDER,	t1.gender,
HEIGTH,	da27,
MIDDLE_NAME,	t1.othername,
t2.NIN,	dda34,
OTHER_NAME,	t1.othername,
PROFESSION,	da2,
RELIGION,	dda27,
RESIDENCE_ADDRESS_LINE_1,	da11,
RESIDENCE_ADDRESS_LINE_2,	da28,
RESIDENCE_TOWN,	dda2,
RESIDENCE_LGA,	dda6,
RESIDENCE_POSTAL_CODE,	dda7,
RESIDENCE_STATE,	dda5,
SELF_ORIGIN_LGA,	da9,
SELF_ORIGIN_STATE,	da8,
t2.SURNAME,	t1.surname,
t2.TELEPHONE_NO,	da38,
TITLE,	dda25,
TRACKING_ID,	da34 
from t1,t2 
where t1.nin = t2.nin 
and t2.row_number = 1
and t1.row_number = 1
--and id != 811446228
;