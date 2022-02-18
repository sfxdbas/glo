-->SCRIPT FROM SIEBEL

CREATE TABLE NUM_TO_DEACT1516112020V1 AS
SELECT
	0||T.SERIAL_NUM MSISDN,
	X.ATTRIB_43 PLATFORM,
	T.STATUS_CD STATUS,
	X.X_ATTRIB_55 "SIM Serial",
	T.INSTALL_DT
FROM
	SIEBEL.S_ASSET T,
	SIEBEL.S_ASSET_X X,
	SIEBEL.S_PROD_INT SPI,
	siebel.s_prod_int_x b
WHERE
	T.PROD_ID = SPI.ROW_ID
	AND T.ROW_ID = X.ROW_ID
 -- AND T.status_cd  IN ('Deactivated')
	AND spi.row_id = b.row_id
	AND b.attrib_08 = 'Y'
	AND T.SERIAL_NUM IN (SELECT MSISDN FROM MSISDN_1516112020)

;



CREATE TABLE NUM_TO_DEACT1516112020V2 AS
WITH t1 AS (
MSISDN, PLATFORM, STATUS,RANK () OVER (PARTITION BY MSISDN ORDER BY INSTALL_DT DESC  )	AS RANK
FROM NUM_TO_DEACT1516112020V1
)
SELECT MSISDN
FROM t1 
WHERE RANK = 1
AND STATUS = 'Deactivated' 
;