--> 
image should be little big, 
pls include LGA and STATE of residence as well


-->
1. script to get all devices
2. script to get white listed devices 
3. script to get black listed devices 
4. How many being active/inactive on a daily basis
5. how many devices are not doing anything at all?


---list of all the devices in different category

--1. active devices                                                 
select id, code,name                                                
from enrollment_ref er                                              
where exists                                                        
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk)
;  

--2. inactive devices                                                                                                                
select id, code,name                                                
from enrollment_ref er                                              
where not exists                                                    
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk)
;

--3. active and uploading since the last 3 months                  
select id, code,name                                               
from enrollment_ref er                                             
where exists                                                       
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk
and date(bsl.create_date) >= date(now) - interval '3 months'       
)                                                                  
;

--1. active devices (white-listed)
select er.id, code,name 
from enrollment_ref er 
join node n on er.id = n.enrollment_ref 
where n.black_listed is false 
and  exists 
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk)
;


--2. inactive devices (white-listed)
select er.id, code,name 
from enrollment_ref er 
join node n on er.id = n.enrollment_ref 
where n.black_listed is false 
and    not exists 
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk)
;