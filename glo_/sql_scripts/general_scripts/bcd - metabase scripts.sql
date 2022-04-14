-- create index concurrently on basic_data( date_part('year', bd_part_key));


-- Empty Registration Type Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
WHERE (dd.DDA11 is null or dd.DDA11 = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Registration State Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from user_id ui
join basic_data bd on bd.user_id_fk = ui.id 
and (bd.state_of_registration_fk is null or bd.state_of_registration_fk::text = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Registration LGA Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from  user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where  (upper(dd.DDA9) is null or upper(dd.DDA9) = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Company ID/RC No. Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from  user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where (dd.DDA14 is null or dd.DDA14 = '')
and dd.DDA11 like '%C%'
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Company Name Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from  user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where (dd.DDA8 is null or dd.DDA8 = '')
and  dd.DDA11 like '%C%'
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Surname Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
where (bd.surname is null or bd.surname = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty First Name Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
where (bd.firstname is null or bd.firstname = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Mother Maiden Name Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where  (dd.DDA12 is null or dd.DDA12 = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Gender Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from/* user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
where  (bd.gender is null or bd.gender = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Date of Birth Per Year
select date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
where (bd.birthday is null or bd.birthday::text = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Subscribers with Age <18 
select date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
where abs(date_part('year',now)-date_part('year',bd.birthday)) < 18
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Invalid Birth Date Per Year (birthdate greater than current year)
select date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
where (date_part('year',bd.birthday)) > date_part('year',now)
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Residential Address Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where  (dd.da3 is null or dd.da3 = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Residential LGA Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where (dd.DDA6 is null or dd.DDA6 = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Residential State Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from/* user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where (dd.dda5 is null or dd.dda5 = '') 
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Nationality/Country of Origin Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join*/ basic_data bd --on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where  (dd.DDA19 is null or dd.DDA19 = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty State of Origin Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where  (dd.DA8 is null or dd.DA8 = '')
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty Passport Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from /*user_id ui 
join */basic_data bd -- on bd.user_id_fk = ui.id 
left join passport p  on p.basic_data_fk = bd.id
where (p.passport_data is null /*or p.passport_data::text = ''*/)
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;


-- Empty FingerPrints Per Year
select  date_part('year', bd.bd_part_key) as year_, count(1)
from /* user_id ui 
join */basic_data bd -- on bd.user_id_fk = ui.id 
left join wsq_image wi  on wi.basic_data_fk = bd.id
where (wi.wsq_data is null /*or wi.wsq_data ::text = ''*/)
group by date_part('year', bd.bd_part_key)
order by date_part('year', bd.bd_part_key)
;



-- Less than 4 fingerPrints captures 
select sum(count) as total 
from (
select  /*date_part('year', bd.bd_part_key) as year_,*/ wi.basic_data_fk ,count(1)
from/* user_id ui 
join basic_data bd on bd.user_id_fk = ui.id 
join*/ wsq_image wi -- on wi.basic_data_fk = bd.id
group by /*date_part('year', bd.bd_part_key),*/ wi.basic_data_fk 
having count(1) < 4
--order by date_part('year', bd.bd_part_key)
) 
;



