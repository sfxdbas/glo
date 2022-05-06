
select replace(region, '.', ''),* from dummy_update_kit_01042020
where region like '%.%'
;

update dummy_update_kit_01042020
set region = replace(region, '.', '')
where region like '%.%'
;

select * from dummy_update_kit_01042020 du 
where not exists (select 1 from enrollment_ref er where er."name" = du.device_id)
;

update dummy_update_kit_01042020 set geopolitical_state = UPPER(geopolitical_state)
where geopolitical_state is not null 
;

update dummy_update_kit_01042020 set geopolitical_state = 'AKWA-IBOM'
where geopolitical_state = 'AKWA IBOM';

update dummy_update_kit_01042020 set geopolitical_state = 'LAGOS_FESTAC'
where region = 'LAGOS_FESTAC';

update dummy_update_kit_01042020 set geopolitical_state = 'LAGOS_IKEJA'
where region = 'LAGOS_IKEJA';

update dummy_update_kit_01042020 set geopolitical_state = 'LAGOS_IKORODU'
where region = 'LAGOS_IKORODU';

update dummy_update_kit_01042020 set geopolitical_state = 'LAGOS_SURULERE'
where region = 'LAGOS_SURULERE';

update dummy_update_kit_01042020 set geopolitical_state = 'LAGOS_VI'
where region = 'LAGOS_VI';

update dummy_update_kit_01042020 set region = 'PORT HARCOURT'
where region = 'P HARCOURT';

update dummy_update_kit_01042020 set sales_territory = 'PORT HARCOURT'
where sales_territory = 'PORT H.';

update dummy_update_kit_01042020 set sales_territory = UPPER(sales_territory)
where sales_territory is not null 
;


select * from dummy_update_kit_01042020 du 
where not exists (select 1 from state er where er."name" = du.geopolitical_state)
order by geopolitical_state desc 
;

select * from dummy_update_kit_01042020 du 
where not exists (select 1 from ZONE er where er."name" = du.region)
order by geopolitical_state desc 
;

insert into territory 
with T1 as (
select distinct case when sales_territory = 'LAGOS' then 
geopolitical_state else sales_territory end as ST 
,  case when sales_territory = 'LAGOS' then 
geopolitical_state else sales_territory end as ST2, S.ID as ID1 , R.ID   as ID2
from dummy_update_kit_01042020 du, state s, region r 
where DU.geopolitical_state = S."name" 
and R."name" = DU.region 
and not exists (select 1 from TERRITORY er where er."name" = du.sales_territory)
--order by  desc 
) 
select HIBERNATE_SEQUENCE.NEXTVAL, ST, ST2, ID1, ID2
from T1 
;

select * from territory ts order by 1;


--create table node_assignment_upd_01042021 as
  with t1 as (
select er."name",du.geopolitical_state,s.ID as state_FK,du.region as zone_d, z.ID as ZONE_FK,
du.sales_territory as territory_d, t.ID as territory_FK, n.id as node_fk,
rank () over (partition by n.enrollment_ref order by n.id desc ) as rank_
from dummy_update_kit_01042020 du, enrollment_ref er,node n,
state s,zone z, territory t
where er."name" = du.device_id
and er.id = n.enrollment_ref 
and du.geopolitical_state = s."name" 
and du.region = z."name" 
and du.sales_territory = t."name" 
order by 2) 
select * from t1 where rank_ = 1
;

select nau.node_fk, na.node_fk 
from node_assignment_upd_01042021 nau, node_assignment na 
where nau.node_fk = na.node_fk 
;


--update node_assignment s
set state_fk = (select state_fk from node_assignment_upd_01042021 u where s.node_fk = u.node_fk )
	,zone_fk = (select zone_fk from node_assignment_upd_01042021 u where s.node_fk = u.node_fk )
	,territory_fk = (select territory_FK from node_assignment_upd_01042021 u where s.node_fk = u.node_fk )
where s.node_fk in (select node_fk from node_assignment_upd_01042021)
;

--create table node_assignment_01042021 as 
select * from node_assignment na where 
node_fk in (select node_fk from node_assignment_upd_01042021) and pk between  37779017 and 37779503 order by 1 ;


select na.state_fk,nau.state_fk, na.zone_fk, nau.zone_fk, nau.node_fk, na.node_fk,
	   na.territory_fk, nau.territory_fk 
from node_assignment nau, node_assignment_01042021 na 
where nau.node_fk = na.node_fk 
;

select er.name,z."name" region, s."name" state,  t."name"  territory 
from enrollment_ref er, node n, node_assignment na, territory t, state s, zone z 
where er.id = n.enrollment_ref 
and na.node_fk = n.id 
and na.state_fk = s.id 
and na.zone_fk = z.id 
and na.territory_fk = t.id 
and er.name = 'GLO-DN-248O'
and na.node_fk in (select node_fk from node_assignment_upd_01042021)
--order by 1 desc 
;