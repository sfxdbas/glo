select s.customer_name, s.phone_number,s.unique_id,
to_char(registration_timestamp,'yyyy/mm/dd hh24:mi:ss') registration_timestamp,
to_char(receipt_timestamp,'yyyy/mm/dd hh24:mi:ss') receipt_timestamp,
file_sync_date,
round((RECEIPT_TIMESTAMP - cast (file_sync_date as date)) * 1440,2) FTP2DB,
round((cast (file_sync_date as date) - registration_timestamp ) * 1440,2) REG2FTP,
app_version
from sms_activation_request s, bid_view b, meta_data m, bfp_sync_log bb
where s.unique_id = bb.unique_id
and bb.unique_id = b.unique_id
and b.id = m.basic_data_fk
and m.app_version in ('2.2', '1.4', '1.40')
and trunc(receipt_timestamp) between :date1 and :date2
;



