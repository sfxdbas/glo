Select kd.pk, kd.email_address , ku.email_address, kd.km_user_pk, ku.pk,ku.dealer_fk ,ku.first_name , ku.surname , kd."name" , kd.deal_code 
from kyc_dealer kd
left join km_user ku on  kd.email_address = ku.email_address 
where kd.email_address like  '%quickchoice239@gmail.com%';
--('easymultipurposeventures2014@yahoo.com'--'bigdo0404@yahoo.com' --'nazglobal52@gmail.com' --'ibrahimbafashi1@gmail.com' --'shafiumaruf@gmail.com' --'alhboyi51@gmail.com' -- 'abusaleem.communication@gmail.com' /*'alezen387@gmail.com','austino4everyoung@gmail.com','emmaesq20101@yahoo.co.uk','yinusastory321@gmail.com',
----'razaqsulaiman@yah.com','sulaimanrazaq@yahoo.com'*/
--)
--kd.deal_code = 'AAGENCY118'
where ku.email_address is null 
and kd.email_address is not null 
and KD.email_address != 'TO BE PROVIDED'
order by ku.email_address desc 
;

select first_name ,email_address ,* from km_user where email_address like  '%quickchoice239@gmail.com%';
select * from kyc_dealer kd where upper("name") like '%QUICK%';


--insert into km_user
select hibernate_sequence.nextval, true, now(), false,now(),null,
false,null,email_address ,0,'KAZEEM','MALE',null,null,null,false
,mobile_number,null,hibernate_sequence.nextval,null,
'$2a$10$TITegBCKui3S6V2YTPUVx.v38YCe8HeaGi366m9ef45K0Ud0.7FSa',
'SANSA',null,k.zone_fk,null
from kyc_dealer k 
where pk = 364407 
;

select * from kyc_dealer where pk = 368431;



select pk, mobile, email_address , dealer_fk ,first_name , surname from km_user where  email_address like '%easymultipurposeventures2014@yahoo.com%';
select pk, mobile_number, email_address , deal_code, km_user_pk from kyc_dealer where email_address like '%ibrahimbafashi1@gmail.com%'
--and deal_code = 'FRKEB0014'
;