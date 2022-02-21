jdbc:postgresql://10.152.89.167:5445/biocapture





"1.1"
"1.0"
"1.2"
"2.21"
"1.00"




union all
Select Count(*), 'TOTAL ANDROID DEVICES' 
From Enrollment_Ref E left join  heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.00'

---
-- select count(distinct enrollment_ref) as total
-- from sms_activation_request s, heart_beat_status h
-- where s.enrollment_ref = h.tag
--  and   h.app_version = '1.00'
-- -- and enrollment_ref NOT LIKE 'DROID%'
-- and date(s.receipt_timestamp) = date(current_date)

-- -- 1197 959+275

-- select distinct(app_version) from heart_beat_status
-- select distinct(Last_Installed_Update) from node


Select Count(1), 'TOTAL WINDOWS DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version != '1.00'
union all
Select Count(1), 'VERSION 1.0 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.0'
UNION ALL
Select Count(1), 'VERSION 1.1 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version != '1.00'
