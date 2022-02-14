--Kit-tag,msisdn,registration_date,firstname,othername,lastname,dateofbirth, registration type, platform
--Please note the date format is DATE_FORMAT(RECEIVEDCHAMSDATE, '%Y-%m-%d %H:%i:%s')

-- method 1 
select * from (
select er.code as kittag, bsl.msisdn, to_char(bsl.create_date, 'YYYY-MM-DD hh24:mi:ss') registration_date, bd.firstname firstname,
bd.othername othername,bd.surname lastname, bd.birthday as dateofbirth, bsl.reg_type registration_type, mps.platform platform
,row_number () over (partition by bsl.msisdn order by bsl.create_date desc , mps.create_date desc ) as rank_
from bfp_sync_log bsl  
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join enrollment_ref er on bsl.enrollment_ref_fk = er.id
left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
where bsl.bfpsyncstatusenum ='SUCCESS'
and date(bsl.create_date) = date(now())-1
) a where rank_ = 1
;



-- method 2 
--select Kittag,msisdn,registration_date,firstname,othername,lastname,dateofbirth,registration_type, platform 
--from (
--select distinct on (bsl.msisdn) bsl.msisdn ,er.code as kittag, to_char(bsl.create_date, 'YYYY-MM-DD hh24:mi:ss') registration_date, 
--bd.firstname firstname,
--bd.othername othername,bd.surname lastname, bd.birthday as dateofbirth, bsl.reg_type registration_type, mps.platform platform
--from bfp_sync_log bsl  
--join user_id ui on ui.unique_id = bsl.unique_id 
--join basic_data bd on bd.user_id_fk = ui.id 
--join enrollment_ref er on bsl.enrollment_ref_fk = er.id
--left join msisdn_provision_status mps on mps.msisdn = bsl.msisdn 
--where bsl.bfpsyncstatusenum ='SUCCESS'
--and date(bsl.create_date) = date(now())-1
--order by bsl.msisdn, bsl.create_date desc, mps.create_date desc 
--) a 
--;
