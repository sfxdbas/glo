-- report to show rejected msisdn by eyeballing team 
select ku.email_address, qmd.msisdn, erh.reason as rejection_reason
from eyeballing_rejection_history erh, km_user ku, quarantined_registration qr, quarantined_msisdn_detail qmd 
where erh.km_user_id = ku.pk 
and erh.quarantined_registration_fk = qr.pk 
and qr.pk = qmd.quarantined_reg_fk 
and erh.rejected is true 
and date(erh.activity_timestamp) = '2021-05-27'
;

-- plot the reason for reject 
with rejection_plot as (
select ku.email_address, qmd.msisdn, erh.reason as rejection_reason
from eyeballing_rejection_history erh, km_user ku, quarantined_registration qr, quarantined_msisdn_detail qmd 
where erh.km_user_id = ku.pk 
and erh.quarantined_registration_fk = qr.pk 
and qr.pk = qmd.quarantined_reg_fk 
and erh.rejected is true 
and date(erh.activity_timestamp) = '2021-05-27'
)
select rejection_reason, count(1)
from rejection_plot
group by 1 
order by 2 desc 
;


-- how many msisdn registered per day and how many were rejected and why were they rejected
select count(qr.pk) as total_msisdn, sum(case when erh.rejected is true then 1 else 0 end) as total_rejected
from quarantined_registration qr
left join eyeballing_rejection_history erh on erh.quarantined_registration_fk = qr.pk 
where date(qr.create_date) = '2021-06-04'
;

on the existing eye balling report 
how long does it take them to release line ?.
this present report, did the delay by eyeballing is due to seamfix not sending the registered msisdn to them on time 
or it is eyeballing team that are taking their time .


qr - eyeballing_km_user_fk
qmd - msisdn rejected 
