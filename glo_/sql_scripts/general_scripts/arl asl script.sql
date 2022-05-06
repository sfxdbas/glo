select e.name, count(msisdn), date(create_date) from bfp_sync_log b
join enrollment_ref e on b.enrollment_ref_fk = e.id
where e.name = 'GLO-HH-517L' and reg_type like 'NMS%'
and date(create_date) = ''

/*update ACTIVATION_SYNC_LOG set ACTIVATION_REQUERY_STATUS='PENDING'  
where RECORD_ID in (select pk from sim_swap_demographic where swap_status <> 'SWAPPED' or swap_status is null)
and activation_requery_status='CLOSED' and date(create_date) = '2021-06-30'

select pk from   ACTIVATION_SYNC_LOG
where RECORD_ID in (select pk from sim_swap_demographic where swap_status <> 'SWAPPED' or swap_status is null)
and activation_requery_status='CLOSED' and date(create_date) = '2021-06-30'*/



