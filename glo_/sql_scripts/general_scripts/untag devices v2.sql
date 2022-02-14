--> Function to untag
SELECT public.untag(
'{GLO-SFX-00001
}'
)



--> New sript to untag 

-- *check data 
select hibernate_sequence.nextval pk, device_id er_device_id, code er_kittag, requested_device_id dtr_device_id, kit_tag dtr_kittag, date(now())
from enrollment_ref er 
right join device_tag_request dtr on er.code = dtr.kit_tag
where dtr.kit_tag in 
(
 -- paste kittags here 
''
);





--	*Back up tag devices from enrollment_ref
insert into untagging_history
select hibernate_sequence.nextval pk, device_id, code, date(now())
from enrollment_ref
where code in 
(
 -- paste kittags here 

);




--	*Untag devices from enrollment_ref
update enrollment_ref 
set device_id = null 
where code in (
 -- paste kittags here 


); 


--	*Untag devices from device_tag_request
update device_tag_request 
set requested_device_id = null
where kit_tag in 
(
 -- paste kittags here 

);





-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> --




--> Former script to untag

--	*untag from enrollment_ref table 

/*
	--> Back up table
	 create table enrollment_ref_bkup_dd_mm_yyyy as  -- replace (dd-mm-yyyy) with the date, month & year of the request
	 select * from enrollment_ref
	 where code in (
	 -- paste kittags here 
	 )
	 ;
	 
	 --> Untag kittags
	 update enrollment_ref set device_id = null 
	 where code in (
	 -- paste kittags here 
	 )
	 ;
*/

--	*untag from device_tag_request table 

/*  
	--> Back up table 
	 create table device_tag_request_dd_mm_yyyy as  -- replace (dd-mm-yyyy) with the date, month & year of the request
	 select * from device_tag_request
	 where enrollment_ref_fk in (
	 select id from enrollment_ref where code in 
	 (
	  -- paste kittags here 
	 )	)
	 ;
	 
	 --> Untag kittags
	 update device_tag_request set requested_device_id = null
	 where enrollment_ref_fk in (
	 select id from enrollment_ref where code in 
	 (
	  -- paste kittags here 
	 )	)
	 ;
*/
