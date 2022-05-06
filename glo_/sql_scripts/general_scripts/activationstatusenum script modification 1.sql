with T1 as (
select msisdn, enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum, reg_type --date(create_date), count(1) 
,msisdn_compliance_status , msisdn_compliance_timestamp 
,		row_number () over (partition by msisdn order by create_date desc )
        from bfp_sync_log b 
        where 
     b.bfpsyncstatusenum = 'SUCCESS' and (msisdn_compliance_status not in ('BARRED','BAR_48','NCC_BAR') or msisdn_compliance_status is null )
--	and (b.activationstatusenum = 'ACTIVATED' or activationstatusenum is null ) --AND date(b.create_date) between ''||left(date((date_trunc('month', current_date))), 8)||'01' and ''||left(date((date_trunc('month', current_date))), 8)||'31'
	and (b.reg_type like 'NM%' or b.reg_type like 'AR%' or reg_type in ('MPI','VNI','CN','CAR'))
--and (b.reg_type like 'RR%' or reg_type in ('CR'))
 --and extract(month from B.create_date) = extract(month from now)
 --and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
 and DATE(B.CREATE_DATE) between '2021-11-01' and '2021-11-30'
 and msisdn in ('07055294269',
'07055294270',
'07055294271',
'07055294274',
'07055294275',
'07055294277',
'07055294278',
'07055294279',
'07055294280',
'07055294281',
'07055294282',
'07055294284',
'07059995804',
'07059995898',
'07059995921',
'07059996262',
'07059996319',
'07059996413',
'08052090000',
'08052090001',
'08052090004',
'08052090007',
'08052090016',
'08052090022',
'08052090024',
'08052090025',
'08052090027',
'08052090028',
'08052090029',
'08052090031',
'08052090032',
'08052090036',
'08052090037',
'08052090038',
'08052090039',
'08052090040',
'08052090041',
'08052090045',
'08052090046',
'08052090047',
'08052090049',
'08052090050',
'08052090051',
'08052097500',
'08052097506',
'08052097507',
'08052097508',
'08055500487',
'08055791602',
'08055791604',
'08055899721',
'08055899724',
'08056224114',
'08056899501',
'08056899503',
'08056899506',
'08056899510',
'08056899511',
'08056899516',
'08056899523',
'08056899526',
'08056899543',
'08058299977',
'08077494009',
'08077494010',
'08077494013',
'08077494017',
'08077494018',
'08126302678',
'08158692925',
'08158692927',
'08158692930',
'09095097842',
'09095097844',
'09095097846')
-- order by activationstatusenum desc 
 ) select * 
 from T1 
-- where row_number = 1  
-- and activationstatusenum = 'BAR_48'
--group by 1 
;
 
select * 
from bfp_sync_log bsl 
where msisdn ='07050288134'