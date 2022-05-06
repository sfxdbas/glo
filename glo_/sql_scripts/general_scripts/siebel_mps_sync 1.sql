create table bsl_full_siebel_dump20210812b_csv_bkup_08122021b as 
select  row_number () over (partition by msisdn order by create_date desc ),
pk, active, create_date, deleted, last_modified, activation_date, activationstatusenum, bfpsyncstatusenum, file_name, file_sync_date, msisdn, sim_serial, source_path, target_path, unique_id, enrollment_ref_fk, agent_email_address, capture_mode, device_id, instance_ip, instance_port, reg_type, rejection_reason, transfer_mode, msisdn_compliance_status, msisdn_compliance_timestamp, glo_status, user_id, rgs_attempt_count, rgs_due_timestamp, rgs_timestamp, deactivation_date, "name", code
FROM public.bsl_full_siebel_dump20210812b_csv_bkup_08122021
where msisdn ='09053279600'
;


create table mps_full_siebel_dump20210812b_csv_bkup_08122021b as 
SELECT row_number () over (partition by msisdn order by create_date desc ),
pk, active, create_date, deleted, last_modified, imsi, msisdn, sim_serial, status, status_reason, instance_ip, instance_port, platform, source_path, unique_id, siebel_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status, activation_date, reg_date, other_status
FROM public.mps_full_siebel_dump20210812b_csv_bkup_08122021
where msisdn ='09053279600'
;

--create table bsl_full_MR_siebel_dump20210812b_csv_bkup_09122021 as 
select * 
from bsl_full_siebel_dump20210812b_csv_bkup_08122021b
where "row_number" =1
and bfpsyncstatusenum ='SUCCESS'
;

--create table as mps_full_MR_siebel_dump20210812b_csv_bkup_09122021 as 
select * 
from mps_full_siebel_dump20210812b_csv_bkup_08122021b
where "row_number" =1
;

select mf.msisdn,sd.msisdn ,mf.imsi ,sd.imsi ,mf.sim_serial ,sd.sim_serial ,mf.platform ,sd.platform ,mf.status ,sd.status 
from mps_full_MR_siebel_dump20210812b_csv_bkup_09122021 mf
join siebel_dump20210812b_csv sd on sd.msisdn =mf.msisdn 
where mf.msisdn ='08058900071'
;

select pk||',',* 
from mps_full_MR_siebel_dump20210812b_csv_bkup_09122021 
order by pk 
limit 2000
;


SELECT
  'UPDATE msisdn_provision_status mps
SET mps.IMSI = sd.imsi,	mps.SIM_SERIAL = sd.sim_serial,	mps.PLATFORM = sd.platform,	mps.STATUS = sd.status,	mps.LAST_MODIFIED = now,mps.DELTA_SIM_SERIAL = null,mps.DELTA_IMSI = null,mps.STATUS_REASON = ''DUMP''
FROM siebel_dump20210812b_csv sd
WHERE	sd.msisdn =mps.msisdn 
and mps.pk between ' || MIN(pk) ||' and '  || MAX(pk)|| '
and exists (select pk from mps_full_mr_siebel_dump20210812b_csv_bkup_09122021 mf where mf.pk = mps.pk and  pk between ' || MIN(pk) ||' and '  ||MAX(pk) ||');' as SC
FROM
  (SELECT
    /*+ parallel*/
    pk,
    Ntile(10000) Over ( ORDER BY pk ) AS Nn
  FROM mps_full_mr_siebel_dump20210812b_csv_bkup_09122021
  )
GROUP BY Nn
ORDER BY nn ASC;

select * 
from PREP_SCRIPT_MPS_SIEBEL_09122021 
;
select * from mps_full_mr_siebel_dump20210812b_csv_bkup_09122021 mfmsdbcbmps where msisdn ='0';

--create table update_bsl_siebel_dump20210812b_csv_archive_09122021 as 
select bf.msisdn ,bf.activationstatusenum, mps.status ,bf.create_date ,mps.create_date--,mf.status 
from bsl_full_MR_siebel_dump20210812b_csv_bkup_09122021 bf 
join msisdn_provision_status mps on mps.msisdn = bf.msisdn 
join mps_full_mr_siebel_dump20210812b_csv_bkup_09122021 mf on mf.pk = mps.pk 
--join siebel_dump20210812b_csv mps using (msisdn)
where bf.activationstatusenum ='ARCHIVED'
and mps.status in ('Active','ACTIVE')
and mps.msisdn in ('08058900071','07010880388')
--and mf.msisdn =bf.msisdn 
--and bf.pk in ()
;

select * from siebel_dump20210812b_csv where msisdn = '07010880388';


SELECT bsl_msisdn, bsl_simserial, bsl_status, bsl_date, mps_msisdn, mps_ismserial, mps_status, mps_date
FROM public.extract_bsl_mps_statuses_25112021;

select pk||',',* 
from bsl_full_mr_siebel_dump20210812b_csv_bkup_09122021 bfmsdbcb 
where activationstatusenum ='ARCHIVED'
order by pk 
limit 2000
;

--create table update_bsl_siebel_dump20210812b_csv_deact_09122021 as 
select bf.msisdn ,bf.activationstatusenum, mps.status ,bf.create_date ,mps.create_date--,mf.status 
from bsl_full_MR_siebel_dump20210812b_csv_bkup_09122021 bf 
join msisdn_provision_status mps on mps.msisdn = bf.msisdn 
join mps_full_mr_siebel_dump20210812b_csv_bkup_09122021 mf on mf.pk = mps.pk 
--join siebel_dump20210812b_csv mps using (msisdn)
where bf.activationstatusenum ='ACTIVATED'
and mps.status in ('Available')
--and mps.msisdn in ('08053064348','08058900071','07010880388','07050209308')
;

