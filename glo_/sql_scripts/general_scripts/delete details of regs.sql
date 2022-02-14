select * 
from msisdn_detail 
where user_category = 'CHILD'
and basic_data_fk = 2852066454
;

select * 
from bfp_sync_log 
where capture_mode = 'SIMROP'
and msisdn in 
(
'09154093580','09154093581','09154093582','09154093583','09154093584','09154093585','09154093586',
'09154093587','09154093588','09154093589','09154093590','09154093591','09154093592','09154093593',
'09154093594','09154093595','09154093596','09154093597','09154093598','09154093599','09154093600',
'09154093601','09154093602','09154093603','09154093604','09154093605','09154093606','09154093607',
'09154093608','09154093609','09154093610','09154093611','09154093612','09154093613','09154093614',
'09154093615','09154093616','09154093617','09154093618','09154093619','09154093620','09154093621',
'09154093622','09154093623','09154093624','09154093625','09154093626','09154093627','09154093628'
) 
and sim_serial in 
(
'8923450206180249495F','8923450206180249404F','8923450206180249412F','8923450206180249420F',
'8923450206180249446F','8923450206180249453F','8923450206180249479F','8923450206180249271F',
'8923450206180249297F','8923450206180249305F','8923450206180249313F','8923450206180249339F',
'8923450206180249263F','8923450206180249321F','8923450206180249289F','8923450206180249354F',
'8923450206180249362F','8923450206180249370F','8923450206180249388F','8923450206180249396F',
'8923450206180249347F','8923450206180249438F','8923450206180249461F','8923450206180249487F',
'8923450206180249008F','8923450206180249016F','8923450206180249024F','8923450206180249032F',
'8923450206180249040F','8923450206180249057F','8923450206180249065F','8923450206180249073F',
'8923450206180249081F','8923450206180249099F','8923450206180249107F','8923450206180249115F',
'8923450206180249123F','8923450206180249131F','8923450206180249149F','8923450206180249156F',
'8923450206180249164F','8923450206180249172F','8923450206180249180F','8923450206180249198F',
'8923450206180249206F','8923450206180249214F','8923450206180249222F','8923450206180249230F',
'8923450206180249248F'
)
;

select * 
from sms_activation_request 
where phone_number in 
(
'09154093580','09154093581','09154093582','09154093583','09154093584','09154093585','09154093586',
'09154093587','09154093588','09154093589','09154093590','09154093591','09154093592','09154093593',
'09154093594','09154093595','09154093596','09154093597','09154093598','09154093599','09154093600',
'09154093601','09154093602','09154093603','09154093604','09154093605','09154093606','09154093607',
'09154093608','09154093609','09154093610','09154093611','09154093612','09154093613','09154093614',
'09154093615','09154093616','09154093617','09154093618','09154093619','09154093620','09154093621',
'09154093622','09154093623','09154093624','09154093625','09154093626','09154093627','09154093628'
) 
and serial_number in 
(
'8923450206180249495F','8923450206180249404F','8923450206180249412F','8923450206180249420F',
'8923450206180249446F','8923450206180249453F','8923450206180249479F','8923450206180249271F',
'8923450206180249297F','8923450206180249305F','8923450206180249313F','8923450206180249339F',
'8923450206180249263F','8923450206180249321F','8923450206180249289F','8923450206180249354F',
'8923450206180249362F','8923450206180249370F','8923450206180249388F','8923450206180249396F',
'8923450206180249347F','8923450206180249438F','8923450206180249461F','8923450206180249487F',
'8923450206180249008F','8923450206180249016F','8923450206180249024F','8923450206180249032F',
'8923450206180249040F','8923450206180249057F','8923450206180249065F','8923450206180249073F',
'8923450206180249081F','8923450206180249099F','8923450206180249107F','8923450206180249115F',
'8923450206180249123F','8923450206180249131F','8923450206180249149F','8923450206180249156F',
'8923450206180249164F','8923450206180249172F','8923450206180249180F','8923450206180249198F',
'8923450206180249206F','8923450206180249214F','8923450206180249222F','8923450206180249230F',
'8923450206180249248F'
)
;


select *
from phone_number_status
where id in (
select phone_number_status_fk 
from sms_activation_request 
where phone_number in 
(
'09154093580','09154093581','09154093582','09154093583','09154093584','09154093585','09154093586',
'09154093587','09154093588','09154093589','09154093590','09154093591','09154093592','09154093593',
'09154093594','09154093595','09154093596','09154093597','09154093598','09154093599','09154093600',
'09154093601','09154093602','09154093603','09154093604','09154093605','09154093606','09154093607',
'09154093608','09154093609','09154093610','09154093611','09154093612','09154093613','09154093614',
'09154093615','09154093616','09154093617','09154093618','09154093619','09154093620','09154093621',
'09154093622','09154093623','09154093624','09154093625','09154093626','09154093627','09154093628'
) 
and serial_number in 
(
'8923450206180249495F','8923450206180249404F','8923450206180249412F','8923450206180249420F',
'8923450206180249446F','8923450206180249453F','8923450206180249479F','8923450206180249271F',
'8923450206180249297F','8923450206180249305F','8923450206180249313F','8923450206180249339F',
'8923450206180249263F','8923450206180249321F','8923450206180249289F','8923450206180249354F',
'8923450206180249362F','8923450206180249370F','8923450206180249388F','8923450206180249396F',
'8923450206180249347F','8923450206180249438F','8923450206180249461F','8923450206180249487F',
'8923450206180249008F','8923450206180249016F','8923450206180249024F','8923450206180249032F',
'8923450206180249040F','8923450206180249057F','8923450206180249065F','8923450206180249073F',
'8923450206180249081F','8923450206180249099F','8923450206180249107F','8923450206180249115F',
'8923450206180249123F','8923450206180249131F','8923450206180249149F','8923450206180249156F',
'8923450206180249164F','8923450206180249172F','8923450206180249180F','8923450206180249198F',
'8923450206180249206F','8923450206180249214F','8923450206180249222F','8923450206180249230F',
'8923450206180249248F'
)
)
;


select * 
from activation_retry_log 
where activation_sync_log_fk in 
(select pk 
from activation_sync_log 
where record_id in 
(select pk
from bfp_sync_log 
where capture_mode = 'SIMROP'
and msisdn in 
(
'09154093580','09154093581','09154093582','09154093583','09154093584','09154093585','09154093586',
'09154093587','09154093588','09154093589','09154093590','09154093591','09154093592','09154093593',
'09154093594','09154093595','09154093596','09154093597','09154093598','09154093599','09154093600',
'09154093601','09154093602','09154093603','09154093604','09154093605','09154093606','09154093607',
'09154093608','09154093609','09154093610','09154093611','09154093612','09154093613','09154093614',
'09154093615','09154093616','09154093617','09154093618','09154093619','09154093620','09154093621',
'09154093622','09154093623','09154093624','09154093625','09154093626','09154093627','09154093628'
) 
and sim_serial in 
(
'8923450206180249495F','8923450206180249404F','8923450206180249412F','8923450206180249420F',
'8923450206180249446F','8923450206180249453F','8923450206180249479F','8923450206180249271F',
'8923450206180249297F','8923450206180249305F','8923450206180249313F','8923450206180249339F',
'8923450206180249263F','8923450206180249321F','8923450206180249289F','8923450206180249354F',
'8923450206180249362F','8923450206180249370F','8923450206180249388F','8923450206180249396F',
'8923450206180249347F','8923450206180249438F','8923450206180249461F','8923450206180249487F',
'8923450206180249008F','8923450206180249016F','8923450206180249024F','8923450206180249032F',
'8923450206180249040F','8923450206180249057F','8923450206180249065F','8923450206180249073F',
'8923450206180249081F','8923450206180249099F','8923450206180249107F','8923450206180249115F',
'8923450206180249123F','8923450206180249131F','8923450206180249149F','8923450206180249156F',
'8923450206180249164F','8923450206180249172F','8923450206180249180F','8923450206180249198F',
'8923450206180249206F','8923450206180249214F','8923450206180249222F','8923450206180249230F',
'8923450206180249248F'
)
)
)
;


select * 
from activation_sync_log 
where record_id in 
(select pk
from bfp_sync_log 
where capture_mode = 'SIMROP'
and msisdn in 
(
'09154093580','09154093581','09154093582','09154093583','09154093584','09154093585','09154093586',
'09154093587','09154093588','09154093589','09154093590','09154093591','09154093592','09154093593',
'09154093594','09154093595','09154093596','09154093597','09154093598','09154093599','09154093600',
'09154093601','09154093602','09154093603','09154093604','09154093605','09154093606','09154093607',
'09154093608','09154093609','09154093610','09154093611','09154093612','09154093613','09154093614',
'09154093615','09154093616','09154093617','09154093618','09154093619','09154093620','09154093621',
'09154093622','09154093623','09154093624','09154093625','09154093626','09154093627','09154093628'
) 
and sim_serial in 
(
'8923450206180249495F','8923450206180249404F','8923450206180249412F','8923450206180249420F',
'8923450206180249446F','8923450206180249453F','8923450206180249479F','8923450206180249271F',
'8923450206180249297F','8923450206180249305F','8923450206180249313F','8923450206180249339F',
'8923450206180249263F','8923450206180249321F','8923450206180249289F','8923450206180249354F',
'8923450206180249362F','8923450206180249370F','8923450206180249388F','8923450206180249396F',
'8923450206180249347F','8923450206180249438F','8923450206180249461F','8923450206180249487F',
'8923450206180249008F','8923450206180249016F','8923450206180249024F','8923450206180249032F',
'8923450206180249040F','8923450206180249057F','8923450206180249065F','8923450206180249073F',
'8923450206180249081F','8923450206180249099F','8923450206180249107F','8923450206180249115F',
'8923450206180249123F','8923450206180249131F','8923450206180249149F','8923450206180249156F',
'8923450206180249164F','8923450206180249172F','8923450206180249180F','8923450206180249198F',
'8923450206180249206F','8923450206180249214F','8923450206180249222F','8923450206180249230F',
'8923450206180249248F'
)
)