--activationRequeryStatus =  PENDING
--activationRequeryCount=0
--createDate = now
--activationType=SIMSWAP_BAR
;



update dummy_05052022 set msisdn = 0||msisdn where length(msisdn)<11;

-- multiple msisdns
select 
'update activation_sync_log set activation_requery_status=''PENDING'',activation_requery_count=0, create_date=now,last_modified=now,order_id = '||''''||d.row_id ||''''||' where record_id = '||ssd.pk||';',
d.row_id,asl.order_id ,ssd.check_status, ssd.swap_status,ssd.msisdn,ssd.target_sim_serial,ssd.sim_serial,
asl.activation_requery_status, asl.activation_requery_count, asl.activation_type
--,*
from sim_swap_demographic ssd 
join dummy_05052022 d on ssd.msisdn = d.msisdn 
join activation_sync_log asl on ssd.pk = asl.record_id 
where d.target_sim_serial = ssd.target_sim_serial 
and ssd.check_status = 'CHECKED'
and ssd.swap_status is null
--and ssd.swap_status = 'SWAPPED'
--and asl.order_id != d.row_id 
and ( asl.order_id is null or asl.order_id = '' )
;


-- single msisdn
select 
'update activation_sync_log set activation_requery_status=''PENDING'',activation_requery_count=0,create_date=now,last_modified=now, order_id = ''1-8P8OWTL'' where record_id = '||ssd.pk||';',
asl.order_id ,ssd.check_status, ssd.swap_status,ssd.msisdn,ssd.target_sim_serial,ssd.sim_serial,
asl.activation_requery_status, asl.activation_requery_count, asl.activation_type
from sim_swap_demographic ssd 
join activation_sync_log asl on ssd.pk = asl.record_id 
where ssd.check_status = 'CHECKED'
and ssd.swap_status is null
and ( asl.order_id is null or asl.order_id = '' )
and ssd.msisdn = '08052002020'
and ssd.target_sim_serial = '8923450701210769827F'
;