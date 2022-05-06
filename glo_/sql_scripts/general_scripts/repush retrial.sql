select * 
from swap_activation_log sal 
where (reversed is false or reversed is null)
And date(create_date) between '2021-10-20' and '2021-10-26'
;


update swap_activation_log
set create_date = now-interval '24 hours'
where (reversed is false or reversed is null)
And date(create_date) between '2021-10-20' and '2021-10-26'
;