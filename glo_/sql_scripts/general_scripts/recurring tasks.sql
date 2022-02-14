-- create function for setting 
	-->> call function for setting 
	
	SELECT public.create_setting('{device_ids}')
	e.g. SELECT public.create_setting('{ALPS-356624090147809,
		 DELLINC.-11GPFC2,
		 DELLINC.-1Q10PJ2,
		 DELLINC.-59FHY32,
		 DELLINC.-835WKR2,
		 DELLINC.-GC6NNN2,
		 HEWLETT-PACKARD-CNC0264JJ4,
		 HEWLETT-PACKARD-CNF016607P}');
	

-- create function for km_user creation
	-->> TBD
	
-- create function for uniqueid replacemet
	-->> call function 
	
	select public.change_status_unique_id(status, uniqueid, msisdn);
	e.g. select public.change_status_unique_id('Available', '3CB', '23456789095');
	
	
-- create function for swapped successfully 
	-->> call function 
	
	select set_swap_status('2020-10-26', '{08055931257}');
	
-- create function to update equivalent entry of users & dealers on km_user and kyc_dealer respectively 
	-->> call function 
	

-- create function for inserting into Activation Retry Log 