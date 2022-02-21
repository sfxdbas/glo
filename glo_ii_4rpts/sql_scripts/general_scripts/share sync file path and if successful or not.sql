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

SELECT msisdn, 
	SUM(case when bfpsyncstatusenum = 'SUCCESS' then true else false  end ) as SUCCESS, 
	SUM(case when bfpsyncstatusenum = 'ERROR' then TRUE else  false end) as ERROR
 FROM BFP_SYNC_LOG 
WHERE  RIGHT(MSISDN, 10) 
IN 
(

)
GROUP BY 1 
order by 2
;