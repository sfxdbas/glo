-- PROCEDURE: public.fraud_report()

-- DROP PROCEDURE public.fraud_report();

CREATE OR REPLACE PROCEDURE public.fraud_report(
	)
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 
BEGIN

truncate fraud_report;

commit;


insert into fraud_report
select
-- unique_id),	
 	initcap(firstname) firstname, initcap(othername) middlename, initcap(surname) lastname, 
 	initcap(mothersmaidenname) mothersmaidenname, 	initcap(stateoforigin) stateoforigin, 
 	initcap(residentialaddress) residentialaddress,  initcap(registrationlga) registrationlga, birthday --), count(distinct unique_id)
from biodata_demographics
group by 
--unique_id), 
firstname, othername, surname, mothersmaidenname,
	stateoforigin, residentialaddress, registrationlga, birthday
having count(distinct unique_id) > 1
--order by 9 desc 
;


commit;


commit;

END fraud_report$BODY$;
