insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113170403 and 1113182428 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113182429 and 1113194075 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113194076 and 1113205139 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113205141 and 1113216393 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113216394 and 1113227758 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113227759 and 1113250619 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113250626 and 1113279528 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113279537 and 1113307835 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113307841 and 1113331611 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113331616 and 1113355208 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113355211 and 1113377034 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113377035 and 1113397965 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113397966 and 1113418321 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113418322 and 1113436974 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113436977 and 1113453833 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113453834 and 1113469537 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113469538 and 1113485385 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113485386 and 1113501061 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113501062 and 1113516631 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113516633 and 1113531539 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113531540 and 1113545902 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113545903 and 1113559996 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113559998 and 1113573559 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113573562 and 1113586828 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113586829 and 1113600229 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113600230 and 1113613021 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113613022 and 1113625617 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113625618 and 1113638367 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113638368 and 1113650758 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113650759 and 1113662548 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113662549 and 1113674322 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113674323 and 1113686007 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113686008 and 1113697489 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113697490 and 1113709001 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113709002 and 1113720496 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113720497 and 1113731732 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113731733 and 1113742746 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113742747 and 1113753773 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113753774 and 1113764760 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113764761 and 1113775685 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113775686 and 1113786620 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113786621 and 1113797527 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113797528 and 1113808483 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113808484 and 1113819489 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113819490 and 1113830626 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113830628 and 1113841521 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113841522 and 1113852393 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113852394 and 1113863301 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113863302 and 1113874034 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113874035 and 1113884840 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113884841 and 1113895558 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113895559 and 1113906161 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113906162 and 1113916902 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113916903 and 1113927367 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113927368 and 1113938122 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113938123 and 1113948657 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113948658 and 1113959247 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113959248 and 1113969797 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113969798 and 1113980596 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113980597 and 1113991082 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1113991083 and 1114001610 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114001611 and 1114012212 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114012213 and 1114022763 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114022764 and 1114033120 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114033121 and 1114043686 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114043687 and 1114054067 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114054068 and 1114064381 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114064382 and 1114074808 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114074809 and 1114085842 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114085843 and 1114096627 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114096628 and 1114107235 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114107236 and 1114117798 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114117799 and 1114128256 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114128257 and 1114138870 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114138871 and 1114149540 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114149541 and 1114159963 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114159964 and 1114170545 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114170546 and 1114181022 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114181023 and 1114191535 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114191536 and 1114201993 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114201994 and 1114212902 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114212903 and 1114223452 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114223453 and 1114234109 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114234110 and 1114244992 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114244993 and 1114255621 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114255622 and 1114266337 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114266338 and 1114276938 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114276939 and 1114287780 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114287781 and 1114298809 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114298810 and 1114309606 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114309607 and 1114320307 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114320308 and 1114331868 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114331869 and 1114343739 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114343740 and 1114355640 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114355642 and 1114366986 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114366987 and 1114378426 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114378427 and 1114389658 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114389659 and 1114401612 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114401613 and 1114413565 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114413566 and 1114425505 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114425506 and 1114437390 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114437391 and 1114449072 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114449073 and 1114460943 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114460944 and 1114473385 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114473386 and 1114485303 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114485304 and 1114497244 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114497245 and 1114508949 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114508950 and 1114520606 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114520607 and 1114532264 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114532265 and 1114543874 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114543875 and 1114555156 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114555161 and 1114566151 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114566152 and 1114577242 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114577243 and 1114588369 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114588370 and 1114600218 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114600219 and 1114611877 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114611878 and 1114623563 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114623564 and 1114634995 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114634996 and 1114646404 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114646405 and 1114657722 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114657723 and 1114669108 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114669109 and 1114680191 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114680192 and 1114691116 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114691117 and 1114702135 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114702136 and 1114713097 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114713098 and 1114724326 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114724327 and 1114735577 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114735578 and 1114746752 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114746753 and 1114757922 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114757923 and 1114768863 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114768864 and 1114779699 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114779700 and 1114790766 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114790767 and 1114801691 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114801692 and 1114812582 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114812583 and 1114823550 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114823551 and 1114834390 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114834391 and 1114845151 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114845152 and 1114855861 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114855862 and 1114866551 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114866552 and 1114877203 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114877204 and 1114887878 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114887879 and 1114898428 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114898429 and 1114908923 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114908924 and 1114919407 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114919408 and 1114929996 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114929997 and 1114940680 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114940681 and 1114951345 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114951346 and 1114962107 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114962108 and 1114972852 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114972853 and 1114983407 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114983410 and 1114994105 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1114994106 and 1115005167 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115005168 and 1115016169 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115016170 and 1115027054 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115027055 and 1115037790 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115037791 and 1115048626 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115048627 and 1115059287 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115059288 and 1115070104 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115070105 and 1115080956 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115080957 and 1115091679 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115091680 and 1115102488 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115102489 and 1115113008 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115113009 and 1115123651 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115123652 and 1115134228 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115134229 and 1115144832 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115144837 and 1115155350 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115155351 and 1115165991 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115165992 and 1115176491 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115176492 and 1115187199 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115187200 and 1115197826 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115197827 and 1115208571 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115208572 and 1115219235 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115219236 and 1115230153 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115230154 and 1115240878 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115240879 and 1115251474 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115251475 and 1115262263 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115262264 and 1115272906 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115272907 and 1115283512 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115283513 and 1115294152 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115294153 and 1115304777 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115304778 and 1115315407 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115315408 and 1115326049 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115326050 and 1115336727 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115336728 and 1115347463 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115347464 and 1115358200 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115358201 and 1115368756 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115368757 and 1115379404 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115379405 and 1115389919 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115389920 and 1115400718 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115400719 and 1115411365 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115411366 and 1115422009 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115422010 and 1115432626 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115432627 and 1115443278 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115443279 and 1115453749 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115453750 and 1115464216 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115464217 and 1115474773 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115474774 and 1115485495 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115485498 and 1115496080 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115496081 and 1115506531 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115506532 and 1115516939 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115516940 and 1115527305 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115527306 and 1115537731 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115537732 and 1115548205 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115548206 and 1115558635 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115558636 and 1115569061 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115569062 and 1115579451 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115579452 and 1115589830 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115589831 and 1115600266 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115600267 and 1115610706 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115610707 and 1115621151 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115621152 and 1115631504 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115631505 and 1115641965 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115641966 and 1115652453 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115652454 and 1115662942 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115662943 and 1115673405 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115673406 and 1115683813 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115683814 and 1115694203 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115694204 and 1115704612 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115704613 and 1115715005 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115715006 and 1115725430 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115725432 and 1115735826 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115735827 and 1115746222 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115746223 and 1115756635 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115756636 and 1115767024 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115767025 and 1115777446 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115777447 and 1115787837 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115787838 and 1115798265 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115798266 and 1115808711 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115808712 and 1115819159 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115819160 and 1115829525 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115829526 and 1115839922 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115839923 and 1115850309 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115850310 and 1115860720 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115860721 and 1115871239 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115871240 and 1115881753 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115881754 and 1115892384 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115892385 and 1115902971 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115902972 and 1115913568 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115913569 and 1115924233 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115924234 and 1115934785 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115934786 and 1115945338 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115945339 and 1115955861 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115955862 and 1115966385 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115966386 and 1115976913 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115976914 and 1115987430 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115987433 and 1115997973 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1115997974 and 1116008525 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116008526 and 1116019070 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116019071 and 1116029578 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116029579 and 1116040065 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116040066 and 1116050637 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116050638 and 1116061156 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116061157 and 1116071717 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116071718 and 1116082338 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116082339 and 1116092764 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116092765 and 1116103285 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116103286 and 1116113768 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116113769 and 1116124280 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116124281 and 1116134731 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116134732 and 1116145256 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116145257 and 1116155779 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116155780 and 1116166266 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116166267 and 1116176755 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116176756 and 1116187235 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116187236 and 1116197646 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116197647 and 1116208078 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116208079 and 1116218616 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116218617 and 1116229072 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116229073 and 1116239575 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116239576 and 1116250143 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116250144 and 1116260645 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116260646 and 1116271173 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116271174 and 1116281650 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116281651 and 1116292142 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116292143 and 1116302575 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116302576 and 1116312994 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116312995 and 1116323530 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116323531 and 1116334018 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116334019 and 1116344490 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116344491 and 1116354955 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116354956 and 1116365422 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116365423 and 1116375872 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116375874 and 1116386285 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116386286 and 1116396720 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116396721 and 1116407161 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116407162 and 1116417596 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116417597 and 1116428003 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116428005 and 1116438428 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116438429 and 1116448827 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116448828 and 1116459226 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116459227 and 1116469648 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116469649 and 1116480124 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116480125 and 1116490558 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116490559 and 1116500915 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116500916 and 1116511268 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116511269 and 1116521717 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116521718 and 1116532109 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116532110 and 1116542536 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116542537 and 1116552906 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116552907 and 1116563247 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116563248 and 1116573636 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116573637 and 1116583983 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116583984 and 1116594378 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116594379 and 1116604858 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116604859 and 1116615365 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116615366 and 1116625870 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116625871 and 1116636413 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116636414 and 1116646924 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116646927 and 1116657330 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116657331 and 1116667800 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116667801 and 1116678162 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116678163 and 1116688504 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116688505 and 1116698861 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116698862 and 1116709207 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116709208 and 1116719600 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116719601 and 1116729928 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116729929 and 1116740378 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116740379 and 1116750805 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116750806 and 1116761217 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116761218 and 1116771656 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116771657 and 1116782056 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116782057 and 1116792488 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116792489 and 1116802925 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116802926 and 1116813370 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116813371 and 1116823817 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116823818 and 1116834178 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116834179 and 1116844629 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116844630 and 1116855144 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116855146 and 1116865581 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116865582 and 1116876024 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116876025 and 1116886463 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116886464 and 1116896938 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116896939 and 1116907435 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116907436 and 1116917910 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116917911 and 1116928327 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116928328 and 1116938741 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116938742 and 1116949197 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116949198 and 1116959644 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116959645 and 1116970066 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116970067 and 1116980469 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116980470 and 1116990951 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1116990952 and 1117001377 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117001378 and 1117011819 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117011820 and 1117022348 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117022349 and 1117032826 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117032827 and 1117043327 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117043328 and 1117053843 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117053844 and 1117064333 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117064334 and 1117074776 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117074777 and 1117085260 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117085261 and 1117095828 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117095829 and 1117106334 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117106335 and 1117116887 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117116888 and 1117127481 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117127482 and 1117137983 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117137984 and 1117148527 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117148528 and 1117159028 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117159029 and 1117169626 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117169627 and 1117180171 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117180172 and 1117190482 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117190483 and 1117200762 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117200763 and 1117211150 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117211151 and 1117221535 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117221536 and 1117231963 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117231964 and 1117242418 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117242419 and 1117252924 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117252925 and 1117263331 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117263333 and 1117273827 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117273828 and 1117284356 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117284357 and 1117294858 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117294859 and 1117305301 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117305302 and 1117315755 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117315756 and 1117326181 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117326182 and 1117336574 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117336575 and 1117347058 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117347059 and 1117357444 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117357445 and 1117367858 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117367859 and 1117378364 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117378365 and 1117388817 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117388818 and 1117399272 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117399273 and 1117409650 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117409651 and 1117420096 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117420097 and 1117430637 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117430638 and 1117441039 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117441040 and 1117451465 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117451466 and 1117461740 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117461741 and 1117472129 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117472130 and 1117482496 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117482497 and 1117492883 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117492884 and 1117503278 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117503279 and 1117513653 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117513654 and 1117524069 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117524070 and 1117534522 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117534523 and 1117545012 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117545013 and 1117555413 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117555414 and 1117565835 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117565836 and 1117576287 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117576288 and 1117586747 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117586749 and 1117597212 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117597213 and 1117607560 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117607561 and 1117617997 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117617998 and 1117628377 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117628378 and 1117638731 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117638733 and 1117649158 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117649159 and 1117659597 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117659598 and 1117670036 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117670037 and 1117680460 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117680461 and 1117690920 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117690921 and 1117701337 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117701338 and 1117711803 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117711804 and 1117722320 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117722321 and 1117732789 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117732790 and 1117743271 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117743272 and 1117753723 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117753724 and 1117764128 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117764129 and 1117774478 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117774479 and 1117784937 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117784938 and 1117795455 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117795456 and 1117805940 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117805941 and 1117816269 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117816270 and 1117826669 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117826670 and 1117837150 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117837151 and 1117847678 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117847679 and 1117858161 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117858162 and 1117868615 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117868616 and 1117879075 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117879076 and 1117889616 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117889617 and 1117900062 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117900063 and 1117910569 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117910570 and 1117920963 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117920967 and 1117931464 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117931465 and 1117941933 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117941934 and 1117952383 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117952384 and 1117962851 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117962854 and 1117973295 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117973296 and 1117983712 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117983713 and 1117994127 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1117994128 and 1118004613 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118004614 and 1118015083 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118015084 and 1118025582 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118025583 and 1118035999 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118036000 and 1118046450 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118046451 and 1118056940 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118056941 and 1118067386 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118067387 and 1118077928 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118077929 and 1118088353 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118088354 and 1118098802 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118098803 and 1118109259 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118109260 and 1118119751 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118119752 and 1118130287 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118130290 and 1118140802 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118140804 and 1118151277 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118151278 and 1118161724 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118161725 and 1118172197 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118172198 and 1118182598 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118182599 and 1118193069 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118193070 and 1118203520 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118203521 and 1118213967 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118213968 and 1118224459 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118224460 and 1118234889 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118234890 and 1118245328 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118245329 and 1118255689 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118255690 and 1118266178 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118266179 and 1118276615 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118276616 and 1118287046 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118287047 and 1118297528 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118297531 and 1118307957 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118307958 and 1118318408 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118318409 and 1118329013 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118329014 and 1118339508 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118339509 and 1118350043 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118350044 and 1118360569 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118360570 and 1118371055 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118371056 and 1118381613 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118381614 and 1118392142 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118392143 and 1118402644 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118402645 and 1118413127 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118413128 and 1118423561 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118423562 and 1118434021 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118434022 and 1118444489 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118444490 and 1118454970 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118454971 and 1118465497 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118465498 and 1118475976 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118475977 and 1118486489 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118486490 and 1118496982 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118496983 and 1118507464 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118507465 and 1118517895 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118517896 and 1118528320 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118528321 and 1118538691 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118538692 and 1118549103 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118549104 and 1118559498 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118559499 and 1118569943 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118569944 and 1118580318 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118580319 and 1118590758 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118590759 and 1118601225 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118601226 and 1118611612 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118611613 and 1118622010 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118622011 and 1118632479 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118632480 and 1118642903 ;
insert into nimc_nin_sim_reg_table_ri_v2 select  record_number, nin, firstname, middlename, lastname, phone_number, registrationlga,  loread( lo_open( photo , 262144 ), 1000000 ) photo,
	finger_posititon as finger_position,  loread( lo_open( fingerprint , 262144 ), 1000000 ) fingerprint 
from nimc_nin_sim_reg_table_v2
where finger_posititon = 'RIGHT_INDEX_FINGER'
and photo in (select loid from pg_largeobject)
and fingerprint in (select loid from pg_largeobject)
AND PHOTO IN (select oid from pg_largeobject_METADATA)
and fingerprint in (select oid from pg_largeobject_METADATA)
and record_number  between  1118642904 and 1118653305 ;