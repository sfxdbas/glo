-- 1. 
create or replace view update_bio_demo_tbl as 
select distinct(BSL.unique_id), e.pk as eyeballingpk, e.status,e.create_date,e.km_user_pk,e.infraction_fk,e.basic_data_fk,
	i.pk as infractionpk,i."name",i.eyeballingfk,i.description, b.id as basic_data_ID,bsl.activationstatusenum
from eyeballing e , infraction i, basic_data b , bfp_sync_log bsl, user_id u 
where e.infraction_fk = i.pk
and e.basic_data_fk = b.id
and u.id = b.user_id_fk
and u.unique_id = bsl.unique_id
and bsl.bfpsyncstatusenum = 'SUCCESS'
;



-- 2.
update biodata_demographics a 
set eyeballingdate = (select b.create_date from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	km_user_pk = (select b.km_user_pk from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	eyeballingstatus = (select b.status from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	infractionname = (select b."name" from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	description = (select b.description from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	activationstatusenum = (select b.activationstatusenum from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid)
where a.unique_id in (select unique_id from update_bio_demo_tbl b where date(b.create_date) = date(now()))
and exists (select basic_data_id from update_bio_demo_tbl u  where a.basicdataid = u.basic_data_fk)
;


-- 3. Job scheduled to run either every (10 / 30) minutes
CREATE OR REPLACE PROCEDURE public.update_bio_demo_tbl_pcd()
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 

BEGIN


update biodata_demographics a 
set eyeballingdate = (select b.create_date from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	km_user_pk = (select b.km_user_pk from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	eyeballingstatus = (select b.status from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	infractionname = (select b."name" from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	description = (select b.description from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	activationstatusenum = (select b.activationstatusenum from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid)
where a.unique_id in (select unique_id from update_bio_demo_tbl b where date(b.create_date) = date(now()))
and exists (select basic_data_id from update_bio_demo_tbl u  where a.basicdataid = u.basic_data_fk)
;


commit;
END update_bio_demo_tbl_pcd$BODY$;
