select 'select '''||upper(column_name)|| ''', count( "'||column_name||'") from '||table_name||' where "'||column_name ||'" != '''' and msisdn != '''' union all'
from information_schema."columns" c where table_name = 'demographics_2';


select 'DEMO_ID', count( "demo_id") from demographics_2 where "demo_id" is not null and msisdn != '' union all
select 'MSISDN', count( "msisdn") from demographics_2 where "msisdn" != '' and msisdn != '' union all
select 'BIRTHDAY', count( "birthday") from demographics_2 where "birthday" is not null and msisdn != '' union all
select 'FIRSTNAME', count( "firstname") from demographics_2 where "firstname" != '' and msisdn != '' union all
select 'SURNAME', count( "surname") from demographics_2 where "surname" != '' and msisdn != '' union all
select 'ADDRESS COUNTRY (COUNTRY OF RESIDENCE)', count( "Address Country (Country of Residence)") from demographics_2 where "Address Country (Country of Residence)" != '' and msisdn != '' union all
select 'ADDRESS LINE 1', count( "ADDRESS LINE 1") from demographics_2 where "ADDRESS LINE 1" != '' and msisdn != '' union all
select 'ADDRESS LINE 2', count( "ADDRESS LINE 2") from demographics_2 where "ADDRESS LINE 2" != '' and msisdn != '' union all
select 'ADDRESS LINE 3', count( "ADDRESS LINE 3") from demographics_2 where "ADDRESS LINE 3" != '' and msisdn != '' union all
select 'AGE RANGE', count( "Age Range") from demographics_2 where "Age Range" != '' and msisdn != '' union all
select 'ALTERNATE PHONE NUMBERS', count( "Alternate Phone Numbers") from demographics_2 where "Alternate Phone Numbers" != '' and msisdn != '' union all
select 'AREA OF RESIDENCE', count( "Area Of Residence") from demographics_2 where "Area Of Residence" != '' and msisdn != '' union all
select 'BIRTH COUNTRY', count( "Birth Country") from demographics_2 where "Birth Country" != '' and msisdn != '' union all
select 'COMPANY ADDRESS', count( "Company Address") from demographics_2 where "Company Address" != '' and msisdn != '' union all
select 'COMPANY ADDRESS LGA', count( "Company Address LGA") from demographics_2 where "Company Address LGA" != '' and msisdn != '' union all
select 'COMPANY ADDRESS POSTAL', count( "Company Address Postal") from demographics_2 where "Company Address Postal" != '' and msisdn != '' union all
select 'COMPANY ADDRESS STATE', count( "Company Address State") from demographics_2 where "Company Address State" != '' and msisdn != '' union all
select 'COMPANY CITY', count( "COMPANY CITY") from demographics_2 where "COMPANY CITY" != '' and msisdn != '' union all
select 'COMPANY HOUSE NO/FLAT', count( "COMPANY HOUSE NO/FLAT") from demographics_2 where "COMPANY HOUSE NO/FLAT" != '' and msisdn != '' union all
select 'COMPANY ID/RC NO.', count( "Company ID/RC No.") from demographics_2 where "Company ID/RC No." != '' and msisdn != '' union all
select 'COMPANY NAME', count( "Company name") from demographics_2 where "Company name" != '' and msisdn != '' union all
select 'COMPANY STREET', count( "COMPANY STREET") from demographics_2 where "COMPANY STREET" != '' and msisdn != '' union all
select 'COUNTRY OF ORIGIN', count( "Country of Origin") from demographics_2 where "Country of Origin" != '' and msisdn != '' union all
select 'EMAIL', count( "Email") from demographics_2 where "Email" != '' and msisdn != '' union all
select 'HEIGHT', count( "Height") from demographics_2 where "Height" != '' and msisdn != '' union all
select 'LANDMARK', count( "Landmark") from demographics_2 where "Landmark" != '' and msisdn != '' union all
select 'LGA OF ORIGIN', count( "LGA of Origin") from demographics_2 where "LGA of Origin" != '' and msisdn != '' union all
select 'MOTHERS MAIDEN NAME', count( "Mothers Maiden Name") from demographics_2 where "Mothers Maiden Name" != '' and msisdn != '' union all
select 'NATIONALITY', count( "Nationality") from demographics_2 where "Nationality" != '' and msisdn != '' union all
select 'OCCUPATION', count( "Occupation") from demographics_2 where "Occupation" != '' and msisdn != '' union all
select 'POSTAL CODE', count( "Postal Code") from demographics_2 where "Postal Code" != '' and msisdn != '' union all
select 'REGISTRATION TYPE', count( "Registration Type") from demographics_2 where "Registration Type" != '' and msisdn != '' union all
select 'STATE OF ORIGIN', count( "State Of Origin") from demographics_2 where "State Of Origin" != '' and msisdn != '' union all
select 'STATE OF RESIDENCE', count( "State of Residence") from demographics_2 where "State of Residence" != '' and msisdn != '' union all
select 'TITLE', count( "Title") from demographics_2 where "Title" != '' and msisdn != '' union all
select 'TYPE OF IDENTIFICATION', count( "Type of Identification") from demographics_2 where "Type of Identification" != '' and msisdn != ''
order by 2  desc 
;