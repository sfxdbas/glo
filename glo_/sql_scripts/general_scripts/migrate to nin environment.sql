GRANT SELECT ON nimc_nin_sim_reg_table_li  TO nimc;
GRANT SELECT ON nimc_nin_sim_reg_table_ri  TO nimc;


select count(1)
from nimc_nin_sim_reg_table_LI
where finger_posititon = 'LEFT_INDEX_FINGER'
 ;

 select count(1)
 from nimc_nin_sim_reg_table_RI
 where finger_posititon = 'RIGHT_INDEX_FINGER'
 ;

-- li - 999,374 -- 999,381 --- 999,368
-- ri - 1,004,703 -- 1,004,709 --- 1,004,697

-- create table nimc_nin_sim_reg_table_li as 
select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table
where finger_posititon = 'LEFT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
limit 2000
;


select 'insert into nimc_nin_sim_reg_table_li select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table
where finger_posititon = ''LEFT_INDEX_FINGER''
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  '|| min(record_number)||' and '  ||MAX(record_number)  ||' ;'
FROM
  (SELECT
    /*+ parallel*/
    record_number,
    Ntile(500) Over ( ORDER BY record_number ) AS Nn
  FROM nimc_nin_sim_reg_table
where finger_posititon = 'LEFT_INDEX_FINGER'
  )
GROUP BY Nn
ORDER BY nn ASc
;




select 'insert into nimc_nin_sim_reg_table_ri select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table
where finger_posititon = ''RIGHT_INDEX_FINGER''
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  '|| min(record_number)||' and '  ||MAX(record_number)  ||' ;'
FROM
  (SELECT
    /*+ parallel*/
    record_number,
    Ntile(500) Over ( ORDER BY record_number ) AS Nn
  FROM nimc_nin_sim_reg_table
where finger_posititon = 'RIGHT_INDEX_FINGER'
  )
GROUP BY Nn
ORDER BY nn ASc
;


select * from nimc_nin_sim_reg_table_ri;
select count(1) from nimc_nin_sim_reg_table_li;
