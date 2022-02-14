--genrate scripts for update of device id 

SELECT
'update dynamic_data a set dda72 = ''PENDING'' where id between '|| MIN(id) ||' and ' ||MAX(id)||' and exists (select 1 from update_dda72_28012022 b where a.id = b.id and b.id between  '|| MIN(id) ||' and '  ||MAX(id) || ') ;' AS t
FROM
  (SELECT
    /*+ parallel*/
    id,
    Ntile(1000) Over ( ORDER BY id ) AS Nn
  FROM update_dda72_28012022
  )
GROUP BY Nn
ORDER BY nn ASC;