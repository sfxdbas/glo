SELECT
'update msisdn_provision_status s set unique_id = (select bsl_unique_id from update_mps_24052021 u where s.PK = u.PK and rank = 1 and u.pk between ' || MIN(pk) ||' and ' ||MAX(pk) ||')
where s.PK in (select PK from update_mps_24052021 where rank = 1 and pk between ' || MIN(pk) ||' and ' ||MAX(pk) ||' and s.pk between ' || MIN(pk) ||' and ' ||MAX(pk)||';'
FROM
  (SELECT
    pk,
    Ntile(2000) Over ( ORDER BY pk ) AS Nn
  FROM update_mps_24052021 
  )
GROUP BY Nn
ORDER BY nn ASC;




--update msisdn_provision_status s
set unique_id = (select bsl_unique_id from update_mps_24052021 u where s.PK = u.PK  and rank = 1 and u.pk = 2279421076 )
where s.PK in (select PK from update_mps_24052021 where rank = 1 and pk = 2279421076) and s.pk = 2279421076
;