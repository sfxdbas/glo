select bsl.msisdn, bd.firstname  FIRST_NAME,bd.surname LAST_NAME, to_char(bd.birthday,'yyyy-mm-dd') DOB,bd.gender GENDER, 
DDA12 MOTHER_MAIDEN_NAME,replace(DA3, ',', ' ') ADDRESS,dd.dda34 NIN,
case when p.passport_data is null then 'NA' else loread( lo_open( p.passport_data , 262144 ), 1000000 ) END  PORTRAIT
from bfp_sync_log bsl 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
left join passport p on p.basic_data_fk = bd.id 
where msisdn in 
('09058153845',
'08050301879',
'08055568784',
'08112399676',
'08074328084',
'08073557562',
'07057059085',
'08056980159',
'08075723973',
'08072056438',
'08072558202',
'09059463351')
order by bsl.create_date 