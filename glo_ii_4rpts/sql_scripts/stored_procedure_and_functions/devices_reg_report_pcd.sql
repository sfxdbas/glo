







-- PROCEDURE: public.devices_reg_report_pcd()

-- DROP PROCEDURE public.devices_reg_report_pcd();

CREATE OR REPLACE PROCEDURE public.devices_reg_report_pcd(
	)
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 

BEGIN

truncate devices_reg_report;

insert into devices_reg_report
select enrollment_ref,k."name", t.code,t.state, count(*)
from sms_activation_request s, temp_agent t, kyc_dealer k
where s.enrollment_ref = t.device_id
and t.code = k.deal_code 
group by 1,2,3,4
;
;

commit;
END devices_reg_report_pcd$BODY$;


jdbc:postgresql://10.152.89.168:5445/biocapture