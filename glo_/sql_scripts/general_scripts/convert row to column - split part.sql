SELECT "7052070389|621500542698819|8923450704190536596F|Available|ICC1|"
FROM public.siebel_available20212210;

--create table  siebel_available20212210_b as 
select 
	split_part("7052070389|621500542698819|8923450704190536596F|Available|ICC1|", '|','1') as msisdn,
	split_part("7052070389|621500542698819|8923450704190536596F|Available|ICC1|", '|','2') as imsi,
	split_part("7052070389|621500542698819|8923450704190536596F|Available|ICC1|", '|','3') as sim_serial,
	split_part("7052070389|621500542698819|8923450704190536596F|Available|ICC1|", '|','4') as status,
	split_part("7052070389|621500542698819|8923450704190536596F|Available|ICC1|", '|','5') as platform,
	split_part("7052070389|621500542698819|8923450704190536596F|Available|ICC1|", '|','6') as date_
from 
siebel_available20212210
--union all 
;

--insert into siebel_available20212210_b
select '7052070389','621500542698819','8923450704190536596F','Available','ICC1'
;

