select b.msisdn,B.FILE_SYNC_DATE SYNC_TIME, b.bfpsyncstatusenum seamfix_status,COALESCE( S.AGILITY_PUSH_TIMESTAMP::TEXT, 'NA') MCENTRIC_TIME,case when s.confirmation_status::text = '1' then 'PUSHED'
 when s.confirmation_status::text = '0' THEN 'PENDING' ELSE 'NA'  END AS MCENTRIC_STATUS
from bfp_sync_log b
left join sms_activation_request s on b.unique_id = s.unique_id
where msisdn in 
(

)