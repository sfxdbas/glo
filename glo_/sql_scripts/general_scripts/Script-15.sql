select id, * -- all > 521,642 -- exists > 161,576 -- not exists > 360,066
FROM public.nin_data_nimc_04052022 nd 
where not  exists 
(select 1 from external_nin_link_log enll where  nd.id = enll.external_id 
and 
nd.msisdn=enll.msisdn
)
;

select 
--pk,msisdn ,nin,external_id, verification_status 
--msisdn ,count(1)
basic_data_id ,count(1)
from external_nin_link_log enll 
where exists 
(select 1 from nin_data_nimc_04052022 nd where --nd.id = enll.external_id 
--and 
nd.msisdn=enll.msisdn
)
group by 1 
order by 2 desc 
;

/*>>>> */select id, * from nin_data_nimc_04052022 where id = 2267;
select id, * from nin_data_nimc_04052022 where msisdn ='08078043490';
  /*>>> */select msisdn ,external_id ,* from external_nin_link_log enll where external_id = 2267;
select msisdn ,external_id ,* from external_nin_link_log enll where msisdn ='08078043490';