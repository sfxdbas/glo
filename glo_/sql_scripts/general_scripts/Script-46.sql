create table demographics_2  as 
select bd.id as demo_id, md.msisdn, bd.birthday, bd.firstname, bd.surname,
DA29	as "Address Country (Country of Residence)",
DA11	as "ADDRESS LINE 1",
DA12	as "ADDRESS LINE 2",
DA13	as "ADDRESS LINE 3",
DA7		as "Age Range",
DA10	as "Alternate Phone Numbers",
DDA2	as "Area Of Residence",
DA40	as "Birth Country",
DDA15	as "Company Address",
DDA17	as "Company Address LGA",
DDA18	as "Company Address Postal",
DDA16	as "Company Address State",
DA17	as "COMPANY CITY",
DA15	as "COMPANY HOUSE NO/FLAT",
DDA14	as "Company ID/RC No.",
DDA8	as "Company name",
DA16	as "COMPANY STREET",
DDA19	as "Country of Origin",
DA6		as "Email",
DA27	as "Height",
DDA29	as "Landmark",
DA9		as "LGA of Origin",
DDA12	as "Mothers Maiden Name",
DA36	as "Nationality",
DA2		as "Occupation",
DDA7	as "Postal Code",
DDA11	as "Registration Type",
DA8		as "State Of Origin",
DDA5	as "State of Residence",
DDA25	as "Title",
DA5		as "Type of Identification"
from basic_data bd 
left join dynamic_data dd on bd.id = dd.basic_data_fk
left join msisdn_detail md on bd.id = md.basic_data_fk 
where bd.id <= 1112512268
order by 1 desc 
;