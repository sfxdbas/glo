
create table temp_registration_v_log_12072020 as 
SELECT *
FROM public.registration_v_log;

create table temp_rejection_reason_v_log_12072020 as 
SELECT *
FROM public.rejection_reason_v_log;

create table temp_msisdn_detail_v_log_12072020 as 
SELECT *
FROM public.msisdn_detail_v_log;

create  table temp_special_data_v_log_12072020 as 
SELECT *
FROM public.special_data_v_log;

create  table temp_wsq_image_v_log_12072020 as 
SELECT *
FROM public.wsq_image_v_log;


--create table temp_schema.temp_reg_pk as 
select reg_v_log_fk
from rejection_reason_v_log
where code = 'PSE'
;

select * from temp_schema.temp_reg_pk;

delete 
from msisdn_detail_v_log
where reg_v_log_fk in (
select reg_v_log_fk from temp_schema.temp_reg_pk
);

delete 
from rejection_reason_v_log
where reg_v_log_fk in (
select reg_v_log_fk from temp_schema.temp_reg_pk
);

delete 
from special_data_v_log
where reg_v_log_fk in (
select reg_v_log_fk from temp_schema.temp_reg_pk
);

delete 
from wsq_image_v_log
where reg_v_log_fk in (
select reg_v_log_fk from temp_schema.temp_reg_pk
);

delete 
from registration_v_log
where pk  in (
select reg_v_log_fk from temp_schema.temp_reg_pk
);