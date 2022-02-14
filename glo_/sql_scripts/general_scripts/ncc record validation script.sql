-- create table ncc_record_16122020 as 
select * from ncc_record
;

truncate ncc_record ;

select * from ncc_record_16122020 nr ;
select * from ncc_record nr ;

truncate table TEST_NCC4;

truncate table TEMP_NCC_RECORD;

truncate table TEMP_NCC_RECORD_valid_new;



insert /*+ parallel(50) */ into TEMP_NCC_RECORD (phone_number, kyc_date, unique_id, p, id, cat_status)
select 
/*+ parallel(50) */
phone_number, receipt_timestamp AS kyc_date, s.unique_id, 
(row_number() OVER (partition by  phone_number ORDER BY receipt_timestamp DESC)) AS p ,b.id, '1010103'
from sms_activation_request s,user_id u,basic_data b
where S.UNIQUE_ID = u.unique_id
and B.USER_ID_FK = u.id
and date(s.receipt_timestamp) between '2020-01-01' and '2020-03-31'
;

 commit;
 

insert into TEMP_NCC_RECORD_VALID_NEW 
select n.*, (row_number() OVER (partition by  unique_id ORDER BY unique_id DESC)) AS p3  from TEMP_NCC_RECORD n;

commit;

update  TEMP_NCC_RECORD_VALID_NEW set cat_status = 0 where p3 > 1; --Filter Duplicate unique_ids (multiple registrations)


commit;

 insert /* parallel(50) */ into NCC_RECORD  (id,unique_id, phone_number,cat_status,basic_data_id,nr_part_key,bucket_status , sync_time)
 select /* parallel(50) */ hibernate_sequence.nextval, unique_id, phone_number, cat_status, id, sysdate as date_ ,0,kyc_date from TEMP_NCC_RECORD_VALID_NEW;

 commit;
 
select count(id) from ncc_record;