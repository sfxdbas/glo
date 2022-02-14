update swap_activation_log 
set create_date =  now() - interval '24 hours'
where (REVERSED is false or REVERSED is null) 
and date(create_date) between '2021-08-01' and '2021-08-25'
;