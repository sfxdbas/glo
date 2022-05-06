select 
'update msisdn_provision_status mps set mps.imsi = ssd.imsi,mps.status = ssd.status, mps.platform = ssd.platform FROM public.seamfix_full_siebel_dump_31052021 ssd 
where mps.msisdn = 0||ssd.msisdn and mps.sim_serial = ssd.serial and ssd.pkid between ' || min(pkid) ||' and ' || max(pkid) ||' ; ' as tt
FROM
  (SELECT
    /*+ parallel*/
    pkid,
    Ntile(2000) Over ( ORDER BY pkid ) AS Nn
  FROM seamfix_full_siebel_dump_31052021
  )
GROUP BY Nn
ORDER BY nn ASC;