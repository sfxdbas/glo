select setval('access_log_sequence' , 859198117     , true);	
select setval('agility_integration_sequence' ,851172083      , true);
select setval('client_audit_sequence' ,   508661153   , true);	
select setval('crm_log_sequence' ,  5000001    , true);	
select setval('heart_beat_sequence' ,  5000002    , true);	
select setval('hibernate_sequence' ,   1088031308   , true);	
select setval('simrop_issue_id_sequence' ,  5005040    , true);	
select setval('web_server_logs_id_seq' ,  149904211    , true);
;

select access_log_sequence.nextval;


select 'access_log_sequence',	last_value FROM access_log_sequence union all
select 'agility_integration_sequence',	last_value FROM agility_integration_sequence union all
select 'client_audit_sequence',	last_value FROM client_audit_sequence union all
select 'crm_log_sequence',	last_value FROM crm_log_sequence union all
select 'heart_beat_sequence',	last_value FROM heart_beat_sequence union all
select 'hibernate_sequence',	last_value FROM hibernate_sequence union all
select 'simrop_issue_id_sequence',	last_value FROM simrop_issue_id_sequence union all
select 'web_server_logs_id_seq',	last_value FROM web_server_logs_id_seq 
;