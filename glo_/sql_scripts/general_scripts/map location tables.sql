select * from dummy_01042021 order by  2 ;



create table region_01042021 as 
select * from region ;
create table zone_01042021 as 
select * from zone ;
create table territory_01042021 as 
select * from territory t ;
create table state_01042021 as 
select * from state ;
create table lga_01042021 as 
select * from lga ;

select * from region order by 1  ;
select * from zone order by 1 ;
--select * from territory t ;

select R.name, Z.*
from REGION R, zone Z 
where R.ID = Z.ID 
order by 3,1
;

--update zone set CODE = CODE||'N', NAME = NAME||'N' where ID is not null;

--update zone t1 
set (t1.code, t1.name, t1.region_fk) 
	= 
(SELECT t2.code, t2.name, t2.id
   FROM   region t2 WHERE  t2.id = t1.id)
WHERE  EXISTS (SELECT 1
               FROM   region 
               WHERE  id = t1.id );
               
--insert into zone  
select id, code , name , id  
from region 
where id  not in (select id from zone )
order by 1 ;

select * from state s ;


create table update_state_01042021 as 
select distinct s.name as state, r.name as region1, d.region , r.id as REGION_FK
from dummy_01042021 d, region r, state s 
where d.region = r.name 
and S.NAME = d.geopolitical_state 
order by s.name, r.name
;

--update state s
set region_fk = (select region_fk from update_state_01042021 u where s.name = u.state )
	,zone_fk = (select region_fk from update_state_01042021 u where s.name = u.state )
where s.name in (select state from update_state_01042021)
;

select * 
from territory t, dummy_01042021 d2 
where d2.sales_territory = t.name 
order by d2.sales_territory ;

select * from territory t where name not  in (select sales_territory from dummy_01042021 d2)
order by id 
;



create table update_territory_01042021 as 
--insert into territory 
select d.sales_territory as description, d.sales_territory as name, s.id as state_fk , r.id as zone_fk 
from dummy_01042021 d, state s, region r 
where d.geopolitical_state = s.name 
and d.region = r.name 
and d.sales_territory   in 
(select name from territory t2)
order by 1;

--update territory s
set state_fk = (select state_fk from update_territory_01042021 u where s.name = u.name )
	,zone_fk = (select zone_fk from update_territory_01042021 u where s.name = u.name )
where s.name in (select name from update_territory_01042021)
;

select  t.name as state, s.name , d.region , r.name 
from dummy_01042021 d, region r, state s, territory t
where d.region = r.name 
and S.NAME = d.geopolitical_state 
and t.name = d.sales_territory 
order by t.name 
;

select er.name, na.* from enrollment_ref er
join node n on er.id = n.enrollment_ref 
left join node_assignment na on na.node_fk = n.id 
where name = 'GLO-DH-005A'
;


