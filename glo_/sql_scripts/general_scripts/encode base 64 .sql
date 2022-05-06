select distinct bsl.msisdn  -- BSL.msisdn ,BD.firstname ,BD.surname,BD.ID BASICDATAID,WI.finger,
/*bsl.create_date, bsl.msisdn ,bsl.reg_type,*/--encode(loread( lo_open( wsq_data, 262144 ), 1000000 ),'base64') encodeBase64
from bfp_sync_log bsl 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join wsq_image wi on wi.basic_data_fk = bd.id
where bfpsyncstatusenum ='SUCCESS'
--and bsl.unique_id ='8782071'
--and bsl.msisdn ='08052084123'
and bd.id  in (3268485026,
3268486730,
3268480937,
3268484782,
3268485616,
3268486704,
3268478816,
3268480720,
3268481407,
3268484614,
3268485373,
3268485468,
3268485961,
3268486147,
3268477686,
3268478558,
3268478893,
3268480599,
3268457283,
3268481281,
3268483508,
3268484530,
3268478206,
3268457379,
3268460974,
3268476309,
3268485674,
3268455311,
3268486038,
3268461971,
3268459879,
3268476580,
3268457665,
3268462926,
3268460073,
3268476366,
3268460168,
3268476222,
3268460309,
3268464003,
3268477548,
3268460417,
3268482039,
3268483364,
3268458850,
3268484316,
3268460767,
3268477785,
3268460877,
3268466119,
3268466251,
3268466362,
3268466464,
3268459580,
3268459688,
3268467056,
3268467270,
3268467387,
3268459815,
3268467889,
3268468055,
3268468667,
3268462078,
3268469439,
3268462467,
3268469923,
3268459979,
3268470251,
3268470376,
3268470497,
3268470659,
3268470921,
3268471117,
3268455714,
3268471387,
3268463515,
3268463707,
3268471854,
3268471926,
3268472059,
3268472146,
3268472262,
3268464107,
3268472575,
3268472803,
3268472829,
3268460544,
3268477426,
3268482167,
3268482580,
3268474142,
3268474222,
3268483654,
3268474901,
3268465535,
3268475451,
3268465705,
3268475861,
3268475973,
3268486894) -- order by msisdn , bd.id   
;

select reg_type ,PK||',',* 
from bfp_sync_log bsl 
where bfpsyncstatusenum = 'SUCCESS'
and activationstatusenum = 'ACTIVATED'
and reg_type ='NMSI'
order by create_date desc 
limit 100 
;

select ID||',',* from basic_data bd 
where ID in (select BASIC_DATA_FK 
from wsq_image wi 
/*where basic_data_fk =3260486156*/)
order by ID desc 
limit 100 
;


select BD.ID||',', COUNT(1)
From bfp_sync_log bsl 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
--join wsq_image wi on wi.basic_data_fk = bd.id
where bfpsyncstatusenum ='SUCCESS'
and REG_TYPE = 'NMSI'
and DATE(CREATE_DATE)=DATE(NOW)
group by 1 
order by 2
limit 100