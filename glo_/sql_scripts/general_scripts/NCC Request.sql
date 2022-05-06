select bsl.msisdn as msisdn, dda34 as nin, bsl.create_date as reg_date, dda9 as place_of_reg
from bfp_sync_log bsl, basic_data bd, user_id ui, dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and dd.basic_data_fk = bd.id 
and bsl.bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2021-06-01' and '2021-06-30'
;

with cte as (
select bsl.msisdn as msisdn, dda34 as nin, bsl.create_date as reg_date, dda9 as place_of_reg
from bfp_sync_log bsl, basic_data bd, user_id ui, dynamic_data dd 
where bsl.unique_id = ui.unique_id 
and ui.id = bd.user_id_fk 
and dd.basic_data_fk = bd.id 
and bsl.bfpsyncstatusenum = 'SUCCESS'
and date(bsl.create_date) between '2021-06-01' and '2021-06-30'
--order by 4
) 
select msisdn, nin, reg_date, place_of_reg,
	case when place_of_reg ~ '^[0-9\.]+$' then null else place_of_reg end as place_of_reg
from cte 
--where place_of_reg ~ '^[0-9\.]+$'
;

-- continue with using node assignment  
--with cte as (
select bsl.msisdn as msisdn, dd.dda34 as nin, bsl.create_date as reg_date, dd.dda9 as place_of_reg,
	   na.state_fk as state, upper(s."name") as lg_reg, reg_type, bsl.create_date 
,	   bd.firstname , bd.surname , tdd.dda34 as secnin, tbd.firstname, tbd.surname 
from bfp_sync_log bsl 
join user_id ui on bsl.unique_id = ui.unique_id 
join basic_data bd on ui.id = bd.user_id_fk 
--left join tm_basic_data tbd on tbd.basic_data_fk = bd.id
--left join tm_dynamic_data tdd  on tdd.tm_basic_data_fk = tbd.pk 
join dynamic_data dd on dd.basic_data_fk = bd.id 
join enrollment_ref er on bsl.enrollment_ref_fk = er.id 
join node n on n.enrollment_ref = er.id 
left join node_assignment na on na.node_fk = n.id 
left join lga s on s.id = na.lga_fk 
where bsl.bfpsyncstatusenum = 'SUCCESS'
--and bsl.reg_type like 'NM%'
--and date(bsl.create_date) between '2021-06-01' and '2021-06-30'
and bsl.msisdn in ('08152280788','08152093051','08152395319','08113999649')
--order by 4
--) 
--select msisdn, nin, reg_date, reg_type,
--	case when place_of_reg ~ '^[0-9\.]+$' then lg_reg else place_of_reg end as place_of_reg
--from cte 
--where place_of_reg !~ '^[0-9\.]+$'
;

select tm_basic_data_fk ,* from tm_dynamic_data tdd ;
select msisdn,* from bfp_sync_log bsl where msisdn = '08113999649'