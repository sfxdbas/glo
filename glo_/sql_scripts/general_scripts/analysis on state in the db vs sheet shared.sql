--> What we have that isnt in theirs
with t1 as (
select left(s."name",3) state, left(l."name", 3) lga, s."name" s1, l."name" l1 
FROM public.state s, lga l
where s.id = l.state_fk
order by 1,2
), t2 as (select left(state, 3) state, left(lga, 3) lga, state s2, lga l2 from state_lga_mapping_axon)
select * from t1 where lower(trim(t1.lga)) not in (select lower(trim(t2.lga)) from t2)
order by 1,2
;


select * from state_lga_mapping_axon where lower(state) like '%del%' order by 1,2;

--> What they have that isnt in ours
with t1 as (
select left(s."name",3) state, left(l."name", 3) lga, s."name" s1, l."name" l1 
FROM public.state s, lga l
where s.id = l.state_fk
order by 1,2
), t2 as (select left(state, 3) state, left(lga, 3) lga , state s2, lga l2 from state_lga_mapping_axon)
select * from t2 where lower(trim(t2.lga)) not in (select lower(trim(t1.lga)) from t1)
order by 1,2
;


select s."name" state, l."name" lga
FROM public.state s, lga l
where s.id = l.state_fk and lower(s."name") like '%ogu%'
order by 1,2;