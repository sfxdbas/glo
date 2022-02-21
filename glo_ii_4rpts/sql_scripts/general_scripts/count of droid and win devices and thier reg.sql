select count(1) 
from sms_activation_request s 
where exists (
select tag --, app_version --, count(*) 
from heart_beat_status  h
-- group by 1 
	where h.tag = s.enrollment_ref
	and app_version = '1.00'
)
;


-- select * 
-- from device_tag_request limit 10





-- WITH T1 AS (
select 
	distinct(s.kittag),
	case 
		when h.app_version = '1.00' then 'DROID' 
		ELSE 'WIN' 
	END DEVICE_TYPE, max(date(h.create_date)) HEARTBEAT_DATE, "count" REG_COUNT
from sar_hb_03042020 s
left join heart_beat_status h on s.kittag = h.tag 
-- where  s.kittag = 'GLO-FR-352P'
group by 1,2,4
order by 1 -- DESC --)
-- SELECT kittag, count(1)
FROM T1
group by 1
having count(*)>1 
order by 2 desc 
;
 
 
-- select * from sms_activation_request where enrollment_ref = 'GLO-FR-352P'

-- 13212

-- select distinct(tag)
-- from heart_beat_status h
-- where exists (select enrollment_ref from sms_activation_request s where h.tag = s.enrollment_ref)