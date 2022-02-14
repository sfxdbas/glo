SELECT sar.phone_number as msidn, sar.receipt_timestamp as receiveddate, sar.serial_number as simserial,
	   s.name as locationstate,  dd.DDA9 as locationlga, bd.surname, bd.firstname, bd.othername as middlename,
	   bd.birthday as dateofbirth, bd.gender, dd.dda12 as mothermaidenname, dd.da3 AS residentialAddress,
	   dd.dda6 AS residentialLGA,dd.dda5 AS residentialState, dd.da8 as stateoforigin, da36 as nationality
from sms_activation_request sar, basic_data bd, state s, dynamic_data dd, user_id ui 
where sar.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and bd.id = dd.basic_data_fk 
and sar.state_id = s.id 
and sar.phone_number in (/* Create table to accomdate MSISDNs */)
;


SELECT sar.phone_number as msisdn, sar.serial_number as simserial,sar.unique_id, sar.receipt_timestamp as receiveddate, 
	    bd.surname, bd.firstname, bd.othername as middlename, bd.birthday as dateofbirth, bd.gender, dd.dda12 as mothermaidenname,
	    dd.da3 AS residentialAddress,  dd.dda6 AS residentialLGA,dd.dda5 AS residentialState, dd.da8 as stateoforigin,
	    dd.da9 as LGA_OF_ORIGIN, dd.dda19 as nationality,s.name as REGISTRATION_STATE,  dd.DDA9 as REGISTRATION_LGA,
	    DDA11 as Registration_Type,DA10 Alternate_Phone_Numbers
from sms_activation_request sar, basic_data bd, state s, dynamic_data dd, user_id ui
where sar.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and bd.id = dd.basic_data_fk 
and sar.state_id = s.id 
and sar.phone_number in (/* Create table to accomdate MSISDNs */)
;