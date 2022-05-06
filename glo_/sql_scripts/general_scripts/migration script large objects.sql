--create table  passport_batch_1 as 
--select * from passport p where  basic_data_fk  between 256724 and 222827459 order by 1 ; --853,789

--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_1 p2 where p2.passport_data = pg.loid);

--create table  passport_batch_2 as 
--select * from passport p where basic_data_fk  between 222827536 and 334789221 order by 1 ; --853,789
--
--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_2 p2 where p2.passport_data = pg.loid);

--create table passport_batch_5 as 
--select * from passport p where basic_data_fk between 489034069 and 489889082 order by 1 ;
--
--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_5 p2 where p2.passport_data = pg.loid);

--create table passport_batch_6 as 
--select * from passport p where basic_data_fk between 489889083 and 502867190  order by 1 ;
--
--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_6 p2 where p2.passport_data = pg.loid);

--create table passport_batch_7 as 
--select * from passport p where basic_data_fk between 502867191 and 511281175;

--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_7 p2 where p2.passport_data = pg.loid);

--create table passport_batch_10 as 
--select * from passport p where basic_data_fk between 525660751 and 566010505 order by 1 ;

--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_10 p2 where p2.passport_data = pg.loid);

--create table passport_batch_12 as 
--select * from passport p where basic_data_fk between 568574226 and 571139199 order by 1 ;

--select * from pg_largeobject pg  where exists  (select 1  from passport_batch_12 p2 where p2.passport_data = pg.loid);

--create table passport_batch_15 as 
--select * from passport p where basic_data_fk between 615476077 and 742672940 order by 1 ;

--select * from pg_largeobject pg where exists  (select 1  from passport_batch_15 p2 where p2.passport_data = pg.loid);

--create table passport_batch_18 as 
--select * from passport p where basic_data_fk between 746088554 and 773290299 order by 1 ;

--select * from pg_largeobject pg where exists  (select 1  from passport_batch_18 p2 where p2.passport_data = pg.loid);


--create table wsq_image_batch_2 as 
--select * from wsq_image where basic_data_fk  between 441065670 and 502867190 order by 1;

--select * from pg_largeobject pg  where exists  (select 1  from wsq_image_batch_2 p2 where p2.wsq_data = pg.loid);

--create table wsq_image_batch_5 as 
--select * from wsq_image where basic_data_fk  between 525660751 and 566010505 order by 1 ;

--select * from pg_largeobject pg  where exists  (select 1  from wsq_image_batch_5 p2 where p2.wsq_data = pg.loid);


--create table wsq_image_batch_8 as 
--select * from wsq_image where basic_data_fk   between 571139200 and 612914354 order by 1 ;

--select * from pg_largeobject pg  where exists  (select 1  from wsq_image_batch_8 p2 where p2.wsq_data = pg.loid);


--create table wsq_image_batch_13 as 
--select * from wsq_image where basic_data_fk   between 773290300 and 776723487 order by basic_data_fk ;

--select * from pg_largeobject pg  where exists  (select 1  from wsq_image_batch_13 p2 where p2.wsq_data = pg.loid);

--select * from special_data sd where basic_data_fk between 670033254 and 1112512268;11

create table special_data_batch_5 as 
select * from special_data where basic_data_fk between 508073090 and 571139199 order by basic_data_fk desc;

select * from pg_largeobject pg  where exists  (select 1  from special_data_batch_5 p2 where p2.biometric_data = pg.loid);