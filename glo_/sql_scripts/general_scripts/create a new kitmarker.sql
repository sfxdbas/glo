
  insert into kit_marker
 	select hibernate_sequence.nextval,
 	1.1,
 	now(),
 	enrollment_ref.device_id,
 	enrollment_ref.mac_address,
 	enrollment_ref.code,
 	990
 	from enrollment_ref where code in ('GLO-HH-SFX001-LAG-ETI-098S','GLO-DH-557W');
	