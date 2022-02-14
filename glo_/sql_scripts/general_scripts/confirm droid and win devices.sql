-- select distinct left(e.device_id, strpos(device_id, '-')) --,device_id, device_type,*
-- from node n, enrollment_ref e 
-- where e.id = n.enrollment_ref
-- -- and device_type is null
--  and device_id is not null
-- ORDER BY 1 


-- SELECT * FROM ENROLLMENT_REF WHERE ID = 477434917


-- select device_id, device_type,N.*
-- from node n, enrollment_ref e 
-- where e.id = n.enrollment_ref 
-- AND E.ID IN (
--  select ENROLLMENT_REF from 
-- -- 	UPDATE 
-- 	node 
-- -- 	SET DEVICE_TYPE = 173214132
-- where enrollment_ref in (
-- select id from enrollment_ref where device_id ilike any (array['INFINIX%',
-- 															   'TEC%',
-- 															   'GIONEE%'])
-- )
-- AND ( DEVICE_TYPE IS NULL OR DEVICE_TYPE IN (173214133)))

--  select * from device_type dt order by 3,1;
-- with t1 as (
-- select distinct left(device_id, strpos(device_id, '-')-1) as left_
-- from enrollment_ref er 
-- where device_id is not null 
-- )
-- select ''''||left_||'%'',' from t1 
-- order by 1 


WITH T1 AS (
select code, device_id, 
case when device_id ilike any (array['AFRIONE%',
'ANDROID%'
'BLACKBERRY%',
'DROI%',
'FERO%',
'FIREFLY_MOBILE%',
'GIDIPLUS%',
'GIONE%',
'GIONEE%',
'HENA%',
'HMDGLOBA%',
'HMDGLOBAL%',
'HOT8%',
'HUAWE%',
'HUAWEI%',
'HYD%',
'IMOS%',
'IMOSE%',
'INFINIX%',
'INFINIXMOBILITYLIMITE%',
'INFINIXMOBILITYLIMITED%',
'INNJOO%',
'ITE%',
'ITEL%',
'ITELMOBILELIMITED%',
'JLINKSZ%',
'KMOUS%',
'KOOBEE%',
'LAVA%',
'LB8%',
'LEAGOO%',
'LEIMIN%',
'LEMOBILE%',
'LGE%',
'MOBIWIRE%',
'MOTOROLA%',
'OAL%',
'OALE%',
'OLLA%',
'ONEPLUS%',
'OPAY%',
'OPPO%',
'OUKITEL%',
'P2%',
'P3%',
'P8%',
'PARTNER%',
'PARTNER_MOBILE%',
'PLUM%',
'QUBO%',
'R30PRO%',
'REALM%',
'ROCKCHIP%',
'SAMSUN%',
'SAMSUNG%',
'SANM%',
'SODA%',
'SONY%',
'TECHNOCRAT%',
'TECN%',
'TECNO%',
'TECNOD8%',
'TECNOMOBILELIMITE%',
'TECNOMOBILELIMITED%',
'TRIFONE%',
'TXD%',
'ULEFONE%',
'UMIDIG%',
'UMIDIGI%',
'VIVO%',
'WIND%',
'XIAOM%',
'XIAOMI%',
'ZPAD%',
'ZT%',
'ZTE%',
'COOLPAD%',
'EASTAEON%',
'A16%',
'A5%',
'A6%',
'A8%',
'EASTA%',
'PHOENIX%'
]) then '173214132 DROID' ELSE '173214133 WIN' END AS DEVICE_TYPE, DEVICE_TYPE AS DEVICE_TYPE2
from enrollment_ref  E, NODE N
WHERE E.ID = N.enrollment_ref AND  DEVICE_ID IS NOT NULL
) SELECT distinct left(device_id, strpos(device_id, '-')-1) FROM T1 WHERE DEVICE_TYPE ILIKE '%droid%'
order by 1 
