

CREATE OR REPLACE PROCEDURE public.report_status_of_reg()
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$ 

BEGIN

truncate report_status_of_reg;


insert into report_status_of_reg
SELECT  distinct(phone_number), receipt_timestamp time_entered_into_db, agility_push_timestamp time_pushed_to_mCentric
FROM public.sms_activation_request s
where s.confirmation_status = 1
and date(s.receipt_timestamp) = date(now()) -1 
;

commit;
END report_status_of_reg$BODY$;
