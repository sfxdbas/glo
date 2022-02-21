--> share file sync path

SELECT msisdn, unique_id, bfpsyncstatusenum, rejection_reason, target_path, file_name
 FROM BFP_SYNC_LOG 
WHERE UNIQUE_ID IN (

)
AND RIGHT(MSISDN, 10) 
IN 
(

);


-->>