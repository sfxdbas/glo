--create new setting by inserting into DSS
insert into DEVICE_SPECIFIC_SETTING
select 
	hibernate_sequence.nextval, true, now(), false, now() ,--, 
	(select /*setting name*/ "name" from setting where "name" = 'insert setting name here'),
	(select /*value*/ value from setting where "name" = 'insert setting name here'), 
	id
from enrollment_ref 
where code in (/*insert kittag here*/ )
;

--check that it was a successful insert
select * from DEVICE_SPECIFIC_SETTING order by create_date desc;
