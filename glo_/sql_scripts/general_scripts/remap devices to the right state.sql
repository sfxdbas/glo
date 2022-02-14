-->remapping

select e.code, s."name" state, na.pk, max(l."name") lga 
from node_assignment na, node n, enrollment_ref e , state s, lga l
where e.id = n.enrollment_ref
and na.node_fk = n.id
and na.state_fk = s.id
and l.state_fk = s.id
and e.code in (
'GLO-FR-864P',
'GLO-FR-865P',
'GLO-FR-866P',
'GLO-FR-867P',
'GLO-FR-868P',
'GLO-FR-869P',
'GLO-FR-870P',
'GLO-FR-871P',
'GLO-FR-872P',
'GLO-FR-873P'
)
and date(na.create_date) = date(now())-1
group by 1,2,3
order by 1
;

-- 864 - 873
select S."name", S.id, L."name", l.state_fk state, s.zone_fk zone_, l.id lga
from state s, lga l
where s.id = l.state_fk
and S."name" in ('IMO', 'ABIA')
order by S."name"
;

select *
from node_assignment
;
--1	8	3

update node_assignment
set state_fk = 1, zone_fk = 8, lga_fk = 3
where pk in (
280320698,
280320699,
280320700,
280320701,
280320692,
280320693,
280320694,
280320695,
280320696,
280320697);