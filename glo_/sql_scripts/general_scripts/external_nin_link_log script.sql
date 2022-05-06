with tab as (
select row_number() over (partition by msisdn order by create_date desc ) rank_,msisdn msisdn_ ,dda34 nin,* from (
select  *
from bfp_sync_log bsl 
join user_id ui on ui.unique_id = bsl.unique_id 
join basic_data bd on bd.user_id_fk = ui.id 
join dynamic_data dd on dd.basic_data_fk = bd.id 
where exists ( 
select 1 from external_nin_link_log enll2 
where enll2.msisdn = bsl.msisdn 
and linked is false 
and verification_transaction_id is null
) 
limit 5 
) a 
) select en.verification_transaction_id ,en.pk ,en.nin ,en.msisdn , en.create_date , tab.* 
from tab , external_nin_link_log en
where tab.msisdn_ = en.msisdn 
and  rank_ = 1 
and (dda34 isnull or dda34 = '' )
and linked is false 
and verification_transaction_id is null
;


select msisdn ,count(1)
from external_nin_link_log enll
--where msisdn ='07011353625'
group by 1 having count(1)> 1 order by 2 desc ;