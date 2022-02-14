/*---create table extract_dump_sept_MIS_05102021 as */
 with extract_dump as (
 select bsl.activationstatusenum ,bsl.msisdn_compliance_status ,bsl.msisdn as msisdn, bd.firstname,bd.surname as lastname, 
 to_char(bd.birthday, 'DD/MM/YYYY') as dateofbirth, er.name as netbookid,
 to_char(bsl.create_date, 'DD/MM/YYYY HH:MM:SS') as registrationdate, replace(dd.da3, ',',' ') as address, 
 replace(dd.DDA6, ',',' ') as lga,  dd.da8 as state,	bd.gender, mps.imsi, bsl.sim_serial as sim_serial,
 bsl.reg_type  registration_type
 ,row_number() over(partition by bsl.msisdn order by bsl.create_date desc ) as rank_
 from bfp_sync_log bsl 
 join user_id ui on ui.unique_id = bsl.unique_id 
 join basic_data bd on bd.user_id_fk = ui.id 
 join dynamic_data dd on dd.basic_data_fk = bd.id 
 join enrollment_ref er on er.id = bsl.enrollment_ref_fk 
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
 where /*bsl.msisdn ~ '^[0-9.]+$'
  and*/ bsl.bfpsyncstatusenum = 'SUCCESS'
--  and bsl.activationstatusenum = 'ACTIVATED'
and (activationstatusenum = 'ACTIVATED' or activationstatusenum is null )
--and bsl.msisdn = md2.msisdn 
	AND date(bsl.create_date) between '2022-01-01' and '2022-01-31'
and ( bsl.msisdn_compliance_status not in ('BARRED','BAR_48','NCC_BAR') or BSL.msisdn_compliance_status is null )
 )
 select -- * ,
  msisdn, firstname, lastname, dateofbirth, netbookid,
  registrationdate,  lga, state,	gender, imsi, sim_serial, registration_type, address
 from extract_dump
 where rank_ = 1 
 ;