-- select * from exclusive_eyeballing_pool
-- select * from registration_v_log

SELECT distinct(target_path), INSTANCE_IP
--, COUNT(1) 
FROM BFP_SYNC_LOG 
WHERE INSTANCE_IP IN 
(
'10.152.89.164', --10.152.89.174
'10.152.89.162', --10.152.89.175
'10.152.89.163'  --10.152.89.173
)
-- GROUP BY 1
ORDER BY 2 --DESC
;



SELECT
  MIN(pk) ,  MAX(pk) 
FROM
  (SELECT
    pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM bfp_sync_log
   where instance_ip = '10.152.89.164'
  )
GROUP BY Nn
ORDER BY nn ASC;



create table temp_bfp_sync_log as 
select * from bfp_sync_log bsl ;



SELECT
  'update BFP_SYNC_LOG set instance_ip = ''10.152.89.173'' where instance_ip = ''10.152.89.163'' and pk between ' || MIN(pk) ||' and '  ||MAX(pk) || ';'
FROM
  (SELECT
    pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM bfp_failure_log
   where 
   instance_ip = 
   '10.152.89.163'
   --'10.152.89.162'
   -- '10.152.89.164'
  )
GROUP BY Nn
ORDER BY nn ASC;




SELECT
  'update bfp_failure_log set instance_ip = ''10.152.89.173'' where instance_ip = ''10.152.89.164'' and pk between ' || MIN(pk) ||' and '  ||MAX(pk) || ';'
FROM
  (SELECT
    pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM bfp_failure_log
   where 
   instance_ip = 
--    '10.152.89.163'
--    '10.152.89.162'
    '10.152.89.164'
  )
GROUP BY Nn
ORDER BY nn ASC;