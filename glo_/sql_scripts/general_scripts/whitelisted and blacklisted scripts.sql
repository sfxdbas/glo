--1. script to get all devices
select distinct er."name" 
from enrollment_ref er 
join node n on er.id = n.enrollment_ref
where er."name"  !~ '^[0-9.]+$'
;

--2. script to get white listed devices 
select distinct er."name"  
from enrollment_ref er 
join node n on er.id = n.enrollment_ref 
where er."name"  !~ '^[0-9.]+$'
and n.black_listed is false
;

--3. script to get black listed devices 
select distinct er."name"  
from enrollment_ref er 
join node n on er.id = n.enrollment_ref 
where er."name"  !~ '^[0-9.]+$'
and n.black_listed is true
;

--4. How many being active on a daily basis
select  distinct er."name"                                                 
from enrollment_ref er 
join node n on er.id = n.enrollment_ref 
where er."name"  !~ '^[0-9.]+$'                                             
and exists                                                        
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk and date(create_date)=date(now))
;

--5. how many devices are not doing anything at all?
select distinct er."name"                                                
from enrollment_ref er                                              
join node n on er.id = n.enrollment_ref 
where er."name"  !~ '^[0-9.]+$'                                             
and not exists                                                    
(select 1 from bfp_sync_log bsl where er.id = bsl.enrollment_ref_fk)
;