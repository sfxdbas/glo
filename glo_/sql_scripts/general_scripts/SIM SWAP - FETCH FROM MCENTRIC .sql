SELECT CONCAT('#',MSISDN),IMSI,SIM_SERIAL_NUMBER
FROM SIMREG.SR_REGISTRATION 
WHERE MSISDN IN
(
	-- insert msisdns here 
)
;

-- create all tables in working_simreg schema;