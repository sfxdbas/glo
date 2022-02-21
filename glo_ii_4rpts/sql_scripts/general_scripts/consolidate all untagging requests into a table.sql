-- > get the names of the backed up tables

select * 
from information_schema."tables"
where table_catalog = 'biocapture'
and table_schema = 'public'
and table_name like 'device_tag_request_%'
-- and table_name like 'enrollment_ref_%'
order by table_name;


-- > Consolidate into a single table

create table untagging_history as 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-02'
from device_tag_request_02_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-05-02'
from device_tag_request_02_05_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-03'
from device_tag_request_03_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-03'
from device_tag_request_03_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-05-04'
from device_tag_request_04_05_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-05-05'
from device_tag_request_05_05_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-06'
from device_tag_request_06_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-06'
from device_tag_request_06_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-06'
from device_tag_request_06_04_2020c;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-07'
from device_tag_request_07_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-07'
from device_tag_request_07_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-07'
from device_tag_request_07_04_2020c;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-07'
from device_tag_request_07_04_2020d;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-05-07'
from device_tag_request_07_05_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-08'
from device_tag_request_08_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-05-08'
from device_tag_request_08_05_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-11'
from device_tag_request_11_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-11'
from device_tag_request_11_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-14'
from device_tag_request_14_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-17'
from device_tag_request_17_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-17'
from device_tag_request_17_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-21'
from device_tag_request_21_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-22'
from device_tag_request_22_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-24'
from device_tag_request_24_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-24'
from device_tag_request_24_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-24'
from device_tag_request_24_04_2020c;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-24'
from device_tag_request_24_04_2020d;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-25'
from device_tag_request_25_03_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-25'
from device_tag_request_25_03_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-25'
from device_tag_request_25_03_2020c;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-25'
from device_tag_request_25_03_2020d;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-26'
from device_tag_request_26_03_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-27'
from device_tag_request_27_03_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-27'
from device_tag_request_27_03_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-27'
from device_tag_request_27_03_2020c;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-27'
from device_tag_request_27_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-28'
from device_tag_request_28_03_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-28'
from device_tag_request_28_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-28'
from device_tag_request_28_04_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-29'
from device_tag_request_29_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-30'
from device_tag_request_30_03_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-30'
from device_tag_request_30_03_2020b;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-04-30'
from device_tag_request_30_04_2020;

insert into untagging_history 
select hibernate_sequence.nextval, requested_device_id, kit_tag, '2020-03-24'
from device_tag_request_bkup_03_24_2020;



-- > Drop all backed up tables to clean the db

-- v1

drop table device_tag_request_02_04_2020          ;
drop table device_tag_request_02_05_2020          ;
drop table device_tag_request_03_04_2020          ;
drop table device_tag_request_03_04_2020b         ;
drop table device_tag_request_04_05_2020          ;
drop table device_tag_request_05_05_2020          ;
drop table device_tag_request_06_04_2020          ;
drop table device_tag_request_06_04_2020b         ;
drop table device_tag_request_06_04_2020c         ;
drop table device_tag_request_07_04_2020          ;
drop table device_tag_request_07_04_2020b         ;
drop table device_tag_request_07_04_2020c         ;
drop table device_tag_request_07_04_2020d         ;
drop table device_tag_request_07_05_2020          ;
drop table device_tag_request_08_04_2020          ;
drop table device_tag_request_08_05_2020          ;
drop table device_tag_request_11_04_2020          ;
drop table device_tag_request_11_04_2020b         ;
drop table device_tag_request_14_04_2020          ;
drop table device_tag_request_17_04_2020          ;
drop table device_tag_request_17_04_2020b         ;
drop table device_tag_request_21_04_2020          ;
drop table device_tag_request_22_04_2020          ;
drop table device_tag_request_24_04_2020          ;
drop table device_tag_request_24_04_2020b         ;
drop table device_tag_request_24_04_2020c         ;
drop table device_tag_request_24_04_2020d         ;
drop table device_tag_request_25_03_2020          ;
drop table device_tag_request_25_03_2020b         ;
drop table device_tag_request_25_03_2020c         ;
drop table device_tag_request_25_03_2020d         ;
drop table device_tag_request_26_03_2020          ;
drop table device_tag_request_27_03_2020          ;
drop table device_tag_request_27_03_2020b         ;
drop table device_tag_request_27_03_2020c         ;
drop table device_tag_request_27_04_2020          ;
drop table device_tag_request_28_03_2020          ;
drop table device_tag_request_28_04_2020          ;
drop table device_tag_request_28_04_2020b         ;
drop table device_tag_request_29_04_2020          ;
drop table device_tag_request_30_03_2020          ;
drop table device_tag_request_30_03_2020b         ;
drop table device_tag_request_30_04_2020          ;
drop table device_tag_request_bkup_03_24_2020     ;



-- v2

drop table enrollment_ref_bkup_02_04_2020                 ;
drop table enrollment_ref_bkup_02_04_2020b                ;
drop table enrollment_ref_bkup_03_04_2020                 ;
drop table enrollment_ref_bkup_03_04_2020b                ;
drop table enrollment_ref_bkup_03_04_2020c                ;
drop table enrollment_ref_bkup_03_24_2020                 ;
drop table enrollment_ref_bkup_03_25_2020                 ;
drop table enrollment_ref_bkup_03_25_2020b                ;
drop table enrollment_ref_bkup_03_25_2020c                ;
drop table enrollment_ref_bkup_03_25_2020d                ;
drop table enrollment_ref_bkup_03_26_2020                 ;
drop table enrollment_ref_bkup_03_27_2020                 ;
drop table enrollment_ref_bkup_03_27_2020b                ;
drop table enrollment_ref_bkup_03_27_2020c                ;
drop table enrollment_ref_bkup_03_28_2020                 ;
drop table enrollment_ref_bkup_03_30_2020                 ;
drop table enrollment_ref_bkup_03_30_2020b                ;
drop table enrollment_ref_bkup_04_07_2020                 ;
drop table enrollment_ref_bkup_04_07_2020c                ;
drop table enrollment_ref_bkup_04_14_2020                 ;
drop table enrollment_ref_bkup_04_17_2020                 ;
drop table enrollment_ref_bkup_04_17_2020b                ;
drop table enrollment_ref_bkup_04_21_2020                 ;
drop table enrollment_ref_bkup_04_22_2020                 ;
drop table enrollment_ref_bkup_04_24_2020                 ;
drop table enrollment_ref_bkup_04_24_2020b                ;
drop table enrollment_ref_bkup_04_24_2020c                ;
drop table enrollment_ref_bkup_04_24_2020d                ;
drop table enrollment_ref_bkup_04_27_2020                 ;
drop table enrollment_ref_bkup_04_28_2020                 ;
drop table enrollment_ref_bkup_04_28_2020b                ;
drop table enrollment_ref_bkup_04_29_2020                 ;
drop table enrollment_ref_bkup_04_30_2020                 ;
drop table enrollment_ref_bkup_05_04_2020                 ;
drop table enrollment_ref_bkup_05_05_2020                 ;
drop table enrollment_ref_bkup_05_07_2020                 ;
drop table enrollment_ref_bkup_05_08_2020                 ;
drop table enrollment_ref_bkup_06_04_2020                 ;
drop table enrollment_ref_bkup_06_04_2020b                ;
drop table enrollment_ref_bkup_06_04_2020c                ;
drop table enrollment_ref_bkup_07_04_2020                 ;
drop table enrollment_ref_bkup_07_04_2020b                ;
drop table enrollment_ref_bkup_08_04_2020                 ;
drop table enrollment_ref_bkup_11_04_2020                 ;
drop table enrollment_ref_bkup_11_04_2020b                ;
