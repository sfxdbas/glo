Select * from kyc_dealer
Where lower("name") like '%kriss%';

--kyc_dealer pk = 364081


select * from node_assignment where node_fk in (
select id from node where enrollment_ref in (
SELECT id  FROM ENROLLMENT_REF WHERE CODE in  ('GLO-DH-231G',
'GLO-DH-232G',
'GLO-DH-233G',
'GLO-DH-234G',
'GLO-DH-235G',
'GLO-DH-236G',
'GLO-DH-237G',
'GLO-DH-238G',
'GLO-DH-239G',
'GLO-DH-240G',
'GLO-DH-241G',
'GLO-DH-242G',
'GLO-DH-243G',
'GLO-DH-244G',
'GLO-DH-245G',
'GLO-DH-246G',
'GLO-DH-247G',
'GLO-DH-248G',
'GLO-DH-249G',
'GLO-DH-250G',
'GLO-DH-270G',
'GLO-DH-271G',
'GLO-DH-272G',
'GLO-DH-273G',
'GLO-DH-274G',
'GLO-DH-275G',
'GLO-DH-276G',
'GLO-DH-277G',
'GLO-DH-278G',
'GLO-DH-279G',
'GLO-DH-280G',
'GLO-DH-499H',
'GLO-DH-500H',
'GLO-DH-501H',
'GLO-DH-502H',
'GLO-DH-503H',
'GLO-DH-504H',
'GLO-DH-629H',
'GLO-DH-630H',
'GLO-DH-631H',
'GLO-DH-632H',
'GLO-DH-633H',
'GLO-DH-634H',
'GLO-DH-635H',
'GLO-DH-636H',
'GLO-DH-637H',
'GLO-DH-638H',
'GLO-DH-753H',
'GLO-DH-754H',
'GLO-DH-755H',
'GLO-DH-756H',
'GLO-DH-757H',
'GLO-DH-758H',
'GLO-DH-759H',
'GLO-DH-760H',
'GLO-DH-761H',
'GLO-DH-762H',
'GLO-DH-763H',
'GLO-DH-764H',
'GLO-DH-765H',
'GLO-DH-766H',
'GLO-DH-767H',
'GLO-DH-768H',
'GLO-DH-769H',
'GLO-DH-770H',
'GLO-DH-771H',
'GLO-DH-772H',
'GLO-DH-773H',
'GLO-DH-774H',
'GLO-DH-775H',
'GLO-DH-776H',
'GLO-DH-777H',
'GLO-DH-778H',
'GLO-DH-779H',
'GLO-DH-780H',
'GLO-DH-781H',
'GLO-DH-782H',
'GLO-DH-783H',
'GLO-DH-784H',
'GLO-DH-785H',
'GLO-DH-786H'
)
)
)
order by fsa_user_fk
;

--delete  from node_assignment where node_fk = 37769693 and territory_fk = 20;

--insert into node_assignment
 select
	hibernate_sequence.nextval , --pk
	true , --active
	now() , --create_date
	false, --deleted
	now(), --last_modified
	null , -- area_fk
	364081, --kyc_dealer_fk
	12, -- state_fk
	10, -- zone_fk
	null, -- dm_user_fk
	K.PK, --fsa_user_fk
	230, --lga_fk
	null, -- outlet_fk
	n.id, --node_fk
	32 --territory_fk
 from km_user k , enrollment_ref e, node n 
 where lower(k.first_name) = lower(e.code)
 and n.enrollment_ref = e.id
 and k.first_name in ('GLO-DH-231G',
'GLO-DH-232G',
'GLO-DH-233G',
'GLO-DH-234G',
'GLO-DH-235G',
'GLO-DH-236G',
'GLO-DH-237G',
'GLO-DH-238G',
'GLO-DH-239G',
'GLO-DH-240G',
'GLO-DH-241G',
'GLO-DH-242G',
'GLO-DH-243G',
'GLO-DH-244G',
'GLO-DH-245G',
'GLO-DH-246G',
'GLO-DH-247G',
'GLO-DH-248G',
'GLO-DH-249G',
'GLO-DH-250G',
'GLO-DH-270G',
'GLO-DH-271G',
'GLO-DH-272G',
'GLO-DH-273G',
'GLO-DH-274G',
'GLO-DH-275G',
'GLO-DH-276G',
'GLO-DH-277G',
'GLO-DH-278G',
'GLO-DH-279G',
'GLO-DH-280G',
'GLO-DH-499H',
'GLO-DH-500H',
'GLO-DH-501H',
'GLO-DH-502H',
'GLO-DH-503H',
'GLO-DH-504H',
'GLO-DH-629H',
'GLO-DH-630H',
'GLO-DH-631H',
'GLO-DH-632H',
'GLO-DH-633H',
'GLO-DH-634H',
'GLO-DH-635H',
'GLO-DH-636H',
'GLO-DH-637H',
'GLO-DH-638H',
'GLO-DH-753H',
'GLO-DH-754H',
'GLO-DH-755H',
'GLO-DH-756H',
'GLO-DH-757H',
'GLO-DH-758H',
'GLO-DH-759H',
'GLO-DH-760H',
'GLO-DH-761H',
'GLO-DH-762H',
'GLO-DH-763H',
'GLO-DH-764H',
'GLO-DH-765H',
'GLO-DH-766H',
'GLO-DH-767H',
'GLO-DH-768H',
'GLO-DH-769H',
'GLO-DH-770H',
'GLO-DH-771H',
'GLO-DH-772H',
'GLO-DH-773H',
'GLO-DH-774H',
'GLO-DH-775H',
'GLO-DH-776H',
'GLO-DH-777H',
'GLO-DH-778H',
'GLO-DH-779H',
'GLO-DH-780H',
'GLO-DH-781H',
'GLO-DH-782H',
'GLO-DH-783H',
'GLO-DH-784H',
'GLO-DH-785H',
'GLO-DH-786H')
	;
	