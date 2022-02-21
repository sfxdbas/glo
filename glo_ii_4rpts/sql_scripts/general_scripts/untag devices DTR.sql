--   create table device_tag_request_26_03_2020 as 
--   select * from device_tag_request
--     update device_tag_request set requested_device_id = null
where enrollment_ref_fk in (
select id from enrollment_ref where code in 
(
)	)
;
