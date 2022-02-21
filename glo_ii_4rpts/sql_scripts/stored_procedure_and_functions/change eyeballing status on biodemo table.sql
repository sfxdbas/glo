-- capturetosync_new   **EVERY HOUR *0 MINUTES exec capturetosync_new()
-- kit_statistics_pcd   **PAUSE
-- simrop_agent_trend_pcd_poc exec 
-- bio_demo_pcd_poc
-- bio_demo_pcd_prod
-- simrop_agent_trend_pcd_prod
-- bib_pcd_prod
-- procedure1 










-- PROCEDURE: public.update_bio_demo_tbl_pcd()

-- DROP PROCEDURE public.update_bio_demo_tbl_pcd();

CREATE OR REPLACE PROCEDURE public.update_bio_demo_tbl_pcd(
	)
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 

BEGIN

update biodata_demographics a 
set eyeballingdate = (select b.last_modified from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	kmuser_pk = (select b.kmuser_pk from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	eyeballingstatus = (select b.status from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	infractionname = (select b."name" from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	description = (select b.description from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid),
	activationstatusenum = (select b.activationstatusenum from update_bio_demo_tbl b where b.basic_data_id = a.basicdataid)
where a.unique_id in (select unique_id from update_bio_demo_tbl b where date(b.last_modified) = date(now()))
and exists (select basic_data_id from update_bio_demo_tbl u  where a.basicdataid = u.basic_data_fk)
;

commit;
END update_bio_demo_tbl_pcd$BODY$;
