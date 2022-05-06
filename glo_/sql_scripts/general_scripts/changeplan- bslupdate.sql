--Update compliance_status to OLD_COMPLIANT and compliance_timestampt to current date for all entries on BSL 
--where compliance_status is null and reg_type is NMSI

select pk, msisdn,create_date , msisdn_compliance_status , msisdn_compliance_timestamp
--'update bfp_sync_log set msisdn_compliance_status = ''OLD_COMPLIANT'' , msisdn_compliance_timestamp = now()', 
from bfp_sync_log bsl 
where /*reg_type = 'NMSI'
and*/ msisdn_compliance_status is null 
and date(create_date)!='2021-09-11'
order by create_date 
;

--Find the ntile range
select
'update bfp_sync_log set msisdn_compliance_status = ''OLD_COMPLIANT'' , msisdn_compliance_timestamp = now() where pk between '||min_||' and '||max_||' and msisdn_compliance_status is null and date(create_date)!=''2021-09-11'';'
 from
 (
SELECT /*+ parallel */ MIN(pk) as min_,
  MAX(pk) as max_,
  nn
FROM
  (SELECT /*+ parallel */ pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM bfp_sync_log
  where msisdn_compliance_status is null 
  and date(create_date)!='2021-09-11'
  )
GROUP BY nn
order by nn
);

--Find the ntile range
select
'update bfp_sync_log set msisdn_compliance_status = null, msisdn_compliance_timestamp = now() where pk between '||min_||' and '||max_||' and msisdn_compliance_status = ''OLD_COMPLIANT'' and date(create_date)=''2021-09-11''  and reg_type = ''NMSI'';'
 from
 (
SELECT /*+ parallel */ MIN(pk) as min_,
  MAX(pk) as max_,
  nn
FROM
  (SELECT /*+ parallel */ pk,
    Ntile(500) Over ( ORDER BY pk ) AS Nn
  FROM bfp_sync_log
  where msisdn_compliance_status = 'OLD_COMPLIANT'
  and date(create_date)='2021-09-11'
  )
GROUP BY nn
order by nn
);