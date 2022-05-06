select * 
from assign_role_27042022 ar
where not exists 
(select 1 from km_user ku where lower(ku.email_address)=lower(ar.email_address))
;

--insert into user_role 
select ku.pk, 2088652078
from assign_role_27042022 ar 
join km_user ku on lower(ku.email_address)=lower(ar.email_address)
--join user_role ur on ur.user_fk = ku.pk 
--join km_role kr on kr.pk = ur.role_fk 
--where role_fk = 2088652078
--order by ur.user_fk ,ur.role_fk 
and not  exists 
(select 1 from user_role u where u.user_fk=ku.pk and u.role_fk= 2088652078
)
;
--except is 
--create table user_role_bkup_27042022 as 
select role_fk,count(1) 
from user_role a 
where exists 
(select ur.*,* 
from assign_role_27042022 ar 
join km_user ku on lower(ku.email_address)=lower(ar.email_address)
join user_role ur on ur.user_fk = ku.pk 
join km_role kr on kr.pk = ur.role_fk
where ku.pk = a.user_fk) 
--and role_fk in (1066,
--60833784,
--64826198,
--940696707,
----2088652078
--2819702092)
group by  1
--order by 1,2
;