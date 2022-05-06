select 'update km_user set nin = '||''''||du.operator_staff_nin ||''''||' where pk = '||ku.pk||' ;'
pk, sim_reg_device_id,ku.first_name ,du.email_address_operator_staff, ku.email_address, du.operator_staff_nin, ku.nin
from dummy_update_agent_13072021 du
 join km_user ku on ku.first_name = du.sim_reg_device_id 
order by ku.nin -- desc 
;

