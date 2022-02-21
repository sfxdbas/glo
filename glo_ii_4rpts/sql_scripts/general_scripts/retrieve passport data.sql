select basic_data_fk,
loread(lo_open(biometric_data, 262144), 1000000) as biometric_data,
regexp_replace(biometricdatatype,'\_|\)', ' ') as biometricdatatype,
id,
reason
from special_data;

select basic_data_fk,
loread(lo_open(biometric_data, 262144), 1000000) as biometric_data
from passport
;