select 
* 
from (
select 
--ddl.dda11,
--wil.basic_data_fk,wil.finger,
--pl.passport_data ,
--'update passport set passport_data = '||''''||pl.passport_data||''''||' where basic_data_fk = '||bdl.basic_data_fk||';',
--'update basic_data set first_name = '||''''||bdl.firstname||''''||', surname = '||''''||bdl.surname||''''||', othername = '||''''||bdl.othername||''''||' where id = '||bdl.basic_data_fk||';',
--'update dynamic_data set dda11='||''''||ddl.dda11||''''||', dda34 = '||''''||ddl.dda34||''''||', dda23 = '||''''||ddl.dda23||''''||', da8 = '||''''||ddl.da8||''''||', da9 = '||''''||ddl.da9||''''||', dda12 = '||''''||ddl.dda12||'''' ||', dda7 = '||''''||ddl.dda7||''''||' where basic_data_fk = '||bdl.basic_data_fk||';',
'update dynamic_data set dda11='||''''||uj.dda11||''''||',dda34 = '||''''||uj.dda34||''''||',dda23 = '||''''||uj.dda23||''''||',da8 = '||''''||uj.da8||''''||',da9 = '||''''||uj.da9||''''||',dda12 = '||''''||uj.dda12||'''' ||',dda7 = '||''''||uj.dda7||''''||' where basic_data_fk = '||bd.id||';',
'update basic_data set first_name = '||''''||uj.firstname||''''||', surname = '||''''||uj.surname||''''||', othername = '||''''||uj.othername||''''||' where id = '||bd.id||';',
bd.id,
--ddl.basic_data_fk,bdl.basic_data_fk,
--bdl.create_date, row_number() over (partition by msisdn order by bdl.create_date) as rank_, 
--bsl.msisdn ,bsl.unique_id ,bdl.firstname ,bdl.surname ,bd.othername ,
ui.unique_id,uj.uniqueid,bd.surname,uj.surname,bd.firstname,uj.firstname,bd.othername,uj.othername,dd.da8,uj.da8,dd.da9,uj.da9,
dd.dda7,uj.dda7,dd.dda11,uj.DDA11,dd.dda12,uj.dda12,dd.dda34,uj.dda34,dd.dda23,uj.dda23 
from /*bfp_sync_log bsl 
join*/ user_id ui --using (unique_id)
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
--join basic_data_log bdl on bdl.basic_data_fk = bd.id 
--join dynamic_data_log ddl on ddl.basic_data_fk = bd.id
--join passport_log pl on pl.basic_data_fk = bd.id 
--join wsq_image_log wil on wil.basic_data_fk = bd.id
join update_json_17012022 uj on uj.uniqueid =ui.unique_id 
--where bsl.msisdn in ('07013489476',
--'08053000057',
--'08056052912',
--'08056491612',
--'08056697055',
--'08057098290',
--'08070362113',
--'08074781798',
--'08076368845',
--'08077690441',
--'08111298865',
--'08113895428',
--'08150824001',
--'08158191001',
--'09051610209',
--'09051610364',
--'09051610398',
--'09053955717') --and bsl.unique_id ='GLO-DH-LAG-ETI-GWLAVI-361W-1630072856615'
) a 
--where rank_ = 1 
;