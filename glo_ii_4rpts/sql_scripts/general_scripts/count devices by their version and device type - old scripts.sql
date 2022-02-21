--> old script 
Select Count(*), 'TOTAL WINDOWS DEVICES' 
From Enrollment_Ref E,Node N,Node_Assignment Na 
Where E.Id=N.Enrollment_Ref And N.Id=Na.Node_Fk
and UPPER(CODE) NOT LIKE 'DROID%' 
and na.KYC_DEALER_FK not in (SELECT distinct(DEALER_FK) from DEALER_EXCLUSION_LIST)
union all
Select Count(e.id), 'VERSION 1.0 DEVICES'  From  Enrollment_Ref E  Join Node N
On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '1'
And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.0 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.0'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.1 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.1'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.2 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.2'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.3 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.3'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 4.0 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '4'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--Union All
--Select Count(e.id), 'TOTAL BLACKLISTED ITEM'  as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code Not Like 'DROID%' and n.active=false
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List) 
--union all


--> new script 
Select Count(1), 'TOTAL WINDOWS DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version != '1.00'
union all
Select Count(1), 'VERSION 1.0 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.0'
UNION ALL
Select Count(1), 'VERSION 1.1 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.1'
union all 
Select Count(1), 'VERSION 1.2 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.2'
union all
Select Count(1), 'VERSION 2.21 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '2.21'
order by 1 




-->old script
--select count(1), 'ANDROID KITS' from enrollment_ref where lower(code)  like '%droid%'
--and mac_address is not null and libo = 0
--and lower(code)  not in (select lower(blacklisted_item) from kyc_blacklist where active = 1)
Select Count(*), 'TOTAL ANDROID DEVICES' 
From Enrollment_Ref E,Node N,Node_Assignment Na Where E.Id=N.Enrollment_Ref And N.Id=Na.Node_Fk
and UPPER(CODE) LIKE 'DROID%' and na.KYC_DEALER_FK not in (SELECT distinct(DEALER_FK) from DEALER_EXCLUSION_LIST)
UNION ALL
Select Count(e.id), 'VERSION 1.0 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
Where  E.Code Like 'DROID%'  And Last_Installed_Update = '2.0'
And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.0 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.0'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.1 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.1'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.2 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.2'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 3.3 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '3.3'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--union all
--Select Count(e.id), 'VERSION 4.0 DEVICES' as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code NOT Like 'DROID%'  And Last_Installed_Update = '4'
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List)
--Union All
--Select Count(e.id), 'TOTAL BLACKLISTED ITEM'  as Type_ From  Enrollment_Ref E  Join Node N
--On N.Enrollment_Ref = E.Id Join  Node_Assignment Na On Na.Node_Fk=N.Id
--Where  E.Code Not Like 'DROID%' and n.active=false
--And Na.Kyc_Dealer_Fk Not In (Select Distinct(Dealer_Fk) From Dealer_Exclusion_List) 



--> new script

Select Count(1), 'VERSION 1.00 DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.00'
UNION ALL
Select Count(1), 'TOTAL ANDROID DEVICES' 
From Enrollment_Ref E left join heart_beat_status h 
on e.code = h.tag
where h.app_version = '1.00'