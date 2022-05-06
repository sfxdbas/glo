--select user_id,simreg_device_id, mobile, sc_ui , first_name ,surname ,left(user_id,2),case when substring(user_id, 3,1) != '0' then '0'
-- else substring(user_id, 3,1) end,
--substring(user_id, 3),
--left(user_id,2)||case when substring(user_id, 3,1) != '0' then '0' else substring(user_id, 3,1) end||substring(user_id,3),
----'update km_user set user_id = '||''''||left(user_id,2)||case when substring(user_id, 3,1) != '0' then '0' else substring(user_id, 3,1) end||substring(user_id,3)||''''||' where pk ='||kupk||';' cc
----avg(rank) over (partition by SC_UI order by KDPK),rank,
--'update km_user set user_id = '||''''|| sc_ui||rank+latest_user_id_serial ||''''||' where pk = '||kupk||';' --, * 
--,'update kyc_dealer set latest_user_id_serial = '||rank+latest_user_id_serial||' where pk = '||kdpk||';' --, *rank+latest_user_id_serial,kdpk 
----where substring(user_id, 3,1) =0
----where sim_reg_device_id ='GLO-FR-959J'
-- from ( /*select * from kyc_dealer kd3 where pk = 110614*/
--with tab as (
--select kd.pk as kdpk, ku.pk  as kupk,simreg_device_id, user_id ,kd."name" ,kd.latest_user_id_serial ,kd.email_address
--from km_user ku 
--join kyc_dealer kd on kd.pk = ku.dealer_fk 
--join generate_user_id_01112021 gui on gui.simreg_device_id = upper(left(ku.email_address, 11))
--) 
--select t.*,ku2.email_address, ku2.first_name, ku2.surname, ku2.create_date,
--upper(left(ku2.first_name ,1))||upper(left(ku2.surname ,1))||ku2.mobile||'_0000' as sc_ui,
--ku2.user_id as ui2, ku2.mobile 
----,case when latest_user_id_serial is null then '0' else latest_user_id_serial end as latest_user_id_serial 
--,row_number () over(partition by t.email_address order by  ku2.first_name ) as rank
--from tab t, km_user ku2 --, kyc_dealer kd2
--where t.email_address = ku2.email_address 
----and kd2.email_address = ku2.email_address 
--) t1 
----where user_id is  null
----order by length(substring(user_id, 3))
--;

with t1 as (
select distinct upper(left(du.partner_first_name,1))||upper(left(du.partner_surname,1))||du.partner_phone ||'_000' as sc_ui,
du.channel operatorpartner_biz_name,du.partner_first_name fn, du.partner_surname ln,ku.user_id,
case when kd.latest_user_id_serial is null then '0' else kd.latest_user_id_serial end as latest_user_id_serial ,
/*du.partner_email_id email,*/ du.partner_phone phone  ,du.seam_fix_tagid sim_reg_device_id,
ku.first_name , ku.surname , ku.email_address, ku.pk as kupk, kd.pk as kdpk
,row_number () over(partition by du.partner_first_name , DU.partner_surname order by  DU.seam_fix_tagid ) as rank
from generate_user_id_01112021 du, km_user ku, kyc_dealer kd 
where du.seam_fix_tagid = upper(left(ku.email_address, 11)) 
and kd.pk = ku.dealer_fk 
--and du.seam_fix_tagid ='GLO-HH-975Q'
and  user_id is  null 
--and ku.user_id is  null 
--order by  kd.latest_user_id_serial , ku.user_id
) 
select rank,operatorpartner_biz_name, user_id,sc_ui||rank+latest_user_id_serial,
sim_reg_device_id, phone, sc_ui , fn,ln,left(user_id,2),case when substring(user_id, 3,1) != '0' then '0' else substring(user_id, 3,1) end,
substring(user_id, 3),
left(user_id,2)||case when substring(user_id, 3,1) != '0' then '0' else substring(user_id, 3,1) end||substring(user_id,3),
'update km_user set user_id = '||''''||left(user_id,2)||case when substring(user_id, 3,1) != '0' then '0' else substring(user_id, 3,1) end||substring(user_id,3)||''''||' where pk ='||kupk||';' cc
--avg(rank) over (partition by SC_UI order by KDPK),rank,
 ,'update km_user set user_id = '||''''|| sc_ui||rank+latest_user_id_serial ||''''||', last_modified=now() where pk = '||kupk||';'--, * 
 ,'update kyc_dealer set latest_user_id_serial = '||''''|| rank+latest_user_id_serial+10  ||''''||', last_modified=now() where pk = '||kdpk||';'--, *
from t1 
--where user_id is not null 
--where substring(user_id, 3,1) =0
--where sim_reg_device_id ='GLO-FR-959J'
--where sim_reg_device_id like '%115W'
--order by
--length(substring(user_id, 3))
--rank+latest_user_id_serial 
order by 2,8,9,1
;

select * from generate_user_id_01112021;

-- check duplicate suser ids
select count(1), ''''||user_id ||''','
from km_user ku 
where user_id != ''
group by 2
having count(1) > 1
order by 1 desc 
;

select * 
,'update km_user set user_id = '||''''||rr||''''||' where pk = '||pk||';'
from (
select pk, user_id , email_address, create_date,last_modified ,
left(user_id, 14) || --||'00'
case when length(replace(right(user_id, 3), '_', '')::float+1) = 3 then '00'
	 when length(replace(right(user_id, 3), '_', '')::float+1) = 2 then '000'
 end 
||replace(right(user_id, 3), '_', '')::int+10 rr --+'1'
,row_number () over(partition by ku.user_id order by ku.last_modified)
from km_user ku 
where user_id != ''
--where ku.user_id --like 'JO08050696484_00%'
--in ( 
--'JO08050696484_00099',
--'JO08050696484_00100'
--)
-- order by user_id, email_address 
) a  where row_number > 1
order by length(right(user_id, 6)) desc 
;
update km_user set user_id = 'JO08050696484_00104' where pk = 2925702639;
update km_user set user_id = 'JO08050696484_00105' where pk = 2925703520;

-- granting checkerss right
--insert into user_role
select distinct ku.pk,2088652078 
from km_user ku 
join generate_user_id_01112021 gui on gui.seam_fix_tagid = upper(left(ku.email_address, 11))
where not exists (select 1 from user_role ur where ur.user_fk = ku.pk and role_fk=2088652078)
;

--export result set
select first_name,surname,email_address,user_id --,length(user_id)
--,'update km_user set user_id = '||''''|| left(user_id,2)||'0'||right(user_id,16)||''''||' where pk = '||ku.pk||';'
from km_user ku 
where upper(left(ku.email_address, 11)) in  
(select UPPER(seam_fix_tagid) from generate_user_id_01112021 gui)
and KU.user_id != ''
order by LENGTH(USER_ID)
;

select * from kyc_dealer kd where latest_user_id_serial = 113;

select PK,first_name ,surname ,email_address ,user_id 
from KM_USER 
where USER_ID != ''
and LENGTH(user_id)>9
order by LENGTH(user_id) ;

select *, 
'update km_user set user_id = '||''''||left(user_id, 14)||'0'||right(sp,3)||''''||' where pk = '||pk||';'
from (
select pk,email_address , user_id ,create_date ,last_modified 
,split_part(user_id, '_', 2) sp, length(split_part(user_id, '_', 2)) ll
--,''
from km_user ku 
where user_id != ''
order by length(user_id) desc 
) a where ll=5 
;
