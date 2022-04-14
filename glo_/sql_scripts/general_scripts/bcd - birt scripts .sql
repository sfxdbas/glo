select  'Registration Type' metric,count(bsl.pk)
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bsl.reg_type is null or bsl.reg_type = '')
union all 
select  'Registration Date' metric,count(bsl.pk)
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bsl.create_date is null or bsl.create_date::text = '')
union all 
select  'Registration State' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bd.state_of_registration_fk is null or bd.state_of_registration_fk::text = '')
union all 
select  'Registration LGA' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DDA9 is null or dd.DDA9 = '')
union all 
select  'Subscriber ID' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bd.id is null or bd.id::text = '')
union all 
select  'Company ID' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DDA14 is null or dd.DDA14 = '')
and bsl.reg_type like '%C%'
union all 
select  'Company Name' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DDA8 is null or dd.DDA8 = '')
and bsl.reg_type like '%C%'
union all 
select  'Surname' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bd.surname is null or bd.surname = '')
union all 
select  'First Name' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bd.firstname is null or bd.firstname = '')
union all 
select  'Mother''s Maiden Name' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DDA12 is null or dd.DDA12 = '')
union all 
select  'Gender' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bd.gender is null or bd.gender = '')
union all 
select  'Birth Date' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (bd.birthday is null or bd.birthday::text = '')
union all 
select  'Residential Address' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.da3 is null or dd.da3 = '')
union all 
select  'Residential LGA' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DDA6 is null or dd.DDA6 = '')
union all 
select  'Residential State' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.dda5 is null or dd.dda5 = '')
union all 
select  'Nationality' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DA36 is null or dd.DA36 = '')
union all 
select  'State of Origin' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join dynamic_data dd on dd.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (dd.DA8 is null or dd.DA8 = '')
union all 
select  'Portrait Image/Customer Photo' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join passport p  on p.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (p.passport_data is null or p.passport_data::text = '')
union all 
select  'Fingers' metric,count(bd.id)
from bfp_sync_log bsl
join user_id ui using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
left join wsq_image wi on wi.basic_data_fk = bd.id
where bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) = date(:dateParam)
and (wi.wsq_data is null or wi.wsq_data ::text = '')
;

