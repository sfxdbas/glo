select * 
from simreg_analysis_tbl_3;

select case 
 when duration = '0-5mins'		then 'a:0-5mins'
 when duration = '6-10mins'		then 'b:6-10mins'
 when duration = '11-30mins'	then 'c:11-30mins'
 when duration = '31mins-1hr'	then 'd:31mins-1hr'
 when duration = '1-2hrs'		then 'e:1-2hrs'
 when duration = '2-3hrs'		then 'f:2-3hrs'
 when duration = '3-4hrs'		then 'g:3-4hrs'
 when duration = '4-5hrs'		then 'h:4-5hrs'
 when duration = '5-6hrs'		then 'i:5-6hrs'
 when duration = '6-7hrs'		then 'j:6-7hrs'
 when duration = '7-8hrs'		then 'k:7-8hrs'
 when duration = '8-9hrs'		then 'l:8-9hrs'
 when duration = '9-10hrs'		then 'm:9-10hrs'
 when duration = '10-11hrs'		then 'n:10-11hrs'
 when duration = '11-12hrs'		then 'o:11-12hrs'
 when duration = '12-13hrs'		then 'p:12-13hrs'
 when duration = '13-14hrs'		then 'q:13-14hrs'
 when duration = '14-15hrs'		then 'r:14-15hrs'
 when duration = '15-16hrs'		then 's:15-16hrs'
 when duration = '16-17hrs'		then 't:16-17hrs'
 when duration = '17-18hrs'		then 'u:17-18hrs'
 when duration = '18-19hrs'		then 'v:18-19hrs'
 when duration = '19-20hrs'		then 'w:19-20hrs'
 when duration = '20-21hrs'		then 'x:20-21hrs'
 when duration = '21-22hrs'		then 'y:21-22hrs'
 when duration = '22-23hrs'		then 'z:22-23hrs'
 when duration = '23-24hrs'		then 'zz:23-24hrs'
 when duration = 'gt 24 hrs'	then 'zzz:gt 24 hrs'
else duration end as duration 
, count(1)
from simreg_analysis_tbl_3 sat 
group by 1 
order by 1 
;

--select * from msisdn_provision_status mps where msisdn = '08156686409';