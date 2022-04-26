SELECT ID, MSISDN, NIN, DATEIN, TIMEIN, STATUS, PULLDATE, FIRSTNAME, LASTNAME, VALIDATION_STATUS, DATA_SOURCE, LINK_STATUS
FROM NINTM.NIN_DATA;


SELECT  min(id), max(id)
FROM NIN_DATA nd 
WHERE (DATEIN = '08-APR-22' OR DATEIN = '08-Apr-22' OR DATEIN = '08-apr-22')
;

SELECT    to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') AS date_,min(id), max(id) 
FROM NINTM.NIN_DATA nd 
WHERE  to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') BETWEEN '2022-04-04' AND '2022-04-08'
GROUP BY to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') 
ORDER BY to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') 
;

SELECT   to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') AS date_,count(1) 
FROM NINTM.NIN_DATA nd 
WHERE  to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') BETWEEN '2022-04-04' AND '2022-04-08'
GROUP BY to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') 
ORDER BY to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') 
;



SELECT to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD'),DATEIN ,ID
FROM NINTM.NIN_DATA nd 
--WHERE lower(DATEIN) BETWEEN '04-apr-22' AND '08-apr-22'
WHERE to_char(CAST(DATEIN AS TIMESTAMP), 'YYYY-MM-DD') BETWEEN '2022-04-04' AND '2022-04-08'
ORDER BY DATEIN 
;


SELECT DATEIN ,count(1)
FROM nintm.NIN_DATA nd 
WHERE id BETWEEN 22740761 and	25402731
GROUP BY DATEIN 
;

SELECT * 
FROM nintm.NIN_DATA nd  ;