CREATE OR REPLACE PROCEDURE report_tcode_and_channel ()
LANGUAGE 'edbspl'
    SECURITY DEFINER VOLATILE 
    COST 100
AS $BODY$

BEGIN 
    
    
    
    truncate act_and_reg_per_tcode_1;
    

    insert into act_and_reg_per_tcode_1
    select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum 
    from bfp_sync_log b 
    where extract(month from b.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
    ;
    
    
    truncate report_registration_per_tcode;
    
    
    
    insert into report_registration_per_tcode 
    with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum --date(create_date), count(1) 
        from act_and_reg_per_tcode_1 b 
    )
    select kd.deal_code TCODE, e.code deviceid, 
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'01' then 1 else 0 end) as "-01",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'02' then 1 else 0 end) as "-02",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'03' then 1 else 0 end) as "-03",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'04' then 1 else 0 end) as "-04",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'05' then 1 else 0 end) as "-05",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'06' then 1 else 0 end) as "-06",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'07' then 1 else 0 end) as "-07",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'08' then 1 else 0 end) as "-08",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'09' then 1 else 0 end) as "-09",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'10' then 1 else 0 end) as "-10",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'11' then 1 else 0 end) as "-11",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'12' then 1 else 0 end) as "-12",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'13' then 1 else 0 end) as "-13",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'14' then 1 else 0 end) as "-14",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'15' then 1 else 0 end) as "-15",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'16' then 1 else 0 end) as "-16",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'17' then 1 else 0 end) as "-17",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'18' then 1 else 0 end) as "-18",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'19' then 1 else 0 end) as "-19",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'20' then 1 else 0 end) as "-20",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'21' then 1 else 0 end) as "-21",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'22' then 1 else 0 end) as "-22",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'23' then 1 else 0 end) as "-23",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'24' then 1 else 0 end) as "-24",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'25' then 1 else 0 end) as "-25",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'26' then 1 else 0 end) as "-26",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'27' then 1 else 0 end) as "-27",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'28' then 1 else 0 end) as "-28",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'29' then 1 else 0 end) as "-29",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'30' then 1 else 0 end) as "-30"
    -- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2020-11-31"
    from kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and extract(month from b.create_date) = extract(month from now)
    group by kd.deal_code, e.code
    order by kd.deal_code
    ;
    
    
    
    truncate report_activation_per_tcode;
    
    
    
    insert into report_activation_per_tcode 
    with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum 
        from act_and_reg_per_tcode_1 b 
    )
    select kd.deal_code TCODE, e.code deviceid, 
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'01' then 1 else 0 end) as "-01",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'02' then 1 else 0 end) as "-02",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'03' then 1 else 0 end) as "-03",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'04' then 1 else 0 end) as "-04",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'05' then 1 else 0 end) as "-05",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'06' then 1 else 0 end) as "-06",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'07' then 1 else 0 end) as "-07",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'08' then 1 else 0 end) as "-08",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'09' then 1 else 0 end) as "-09",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'10' then 1 else 0 end) as "-10",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'11' then 1 else 0 end) as "-11",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'12' then 1 else 0 end) as "-12",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'13' then 1 else 0 end) as "-13",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'14' then 1 else 0 end) as "-14",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'15' then 1 else 0 end) as "-15",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'16' then 1 else 0 end) as "-16",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'17' then 1 else 0 end) as "-17",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'18' then 1 else 0 end) as "-18",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'19' then 1 else 0 end) as "-19",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'20' then 1 else 0 end) as "-20",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'21' then 1 else 0 end) as "-21",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'22' then 1 else 0 end) as "-22",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'23' then 1 else 0 end) as "-23",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'24' then 1 else 0 end) as "-24",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'25' then 1 else 0 end) as "-25",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'26' then 1 else 0 end) as "-26",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'27' then 1 else 0 end) as "-27",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'28' then 1 else 0 end) as "-28",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'29' then 1 else 0 end) as "-29",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'30' then 1 else 0 end) as "-30"
    -- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2020-11-31"
    from kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b -- , sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and b.bfpsyncstatusenum = 'SUCCESS'
    and activationstatusenum = 'ACTIVATED' 
    and extract(month from b.create_date) = extract(month from now)
    group by kd.deal_code, e.code
    order by kd.deal_code
    ;
    
    
    
    truncate act_and_reg_per_channel_1;
    
    
    
    insert into act_and_reg_per_channel_1 
    select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum --date(create_date), count(1) 
    from bfp_sync_log b 
    where extract(month from b.create_date) = extract(month from now)
    and date(b.create_date) between date((date_trunc('month', current_date))) and date(now())-1
    ; 

    
    truncate report_registration_per_channel;

    
    insert into report_registration_per_channel 
    with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select D.NAME ,
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'01' then 1 else 0 end) as "-01",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'02' then 1 else 0 end) as "-02",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'03' then 1 else 0 end) as "-03",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'04' then 1 else 0 end) as "-04",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'05' then 1 else 0 end) as "-05",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'06' then 1 else 0 end) as "-06",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'07' then 1 else 0 end) as "-07",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'08' then 1 else 0 end) as "-08",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'09' then 1 else 0 end) as "-09",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'10' then 1 else 0 end) as "-10",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'11' then 1 else 0 end) as "-11",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'12' then 1 else 0 end) as "-12",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'13' then 1 else 0 end) as "-13",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'14' then 1 else 0 end) as "-14",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'15' then 1 else 0 end) as "-15",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'16' then 1 else 0 end) as "-16",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'17' then 1 else 0 end) as "-17",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'18' then 1 else 0 end) as "-18",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'19' then 1 else 0 end) as "-19",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'20' then 1 else 0 end) as "-20",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'21' then 1 else 0 end) as "-21",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'22' then 1 else 0 end) as "-22",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'23' then 1 else 0 end) as "-23",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'24' then 1 else 0 end) as "-24",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'25' then 1 else 0 end) as "-25",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'26' then 1 else 0 end) as "-26",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'27' then 1 else 0 end) as "-27",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'28' then 1 else 0 end) as "-28",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'29' then 1 else 0 end) as "-29",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'30' then 1 else 0 end) as "-30"
    -- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2020-11-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b --, sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and d.pk = kd.dealer_type_fk
    and b.bfpsyncstatusenum = 'SUCCESS'
    and extract(month from b.create_date) = extract(month from now)
    group by d."name"
    order by D."name" 
    ;

    
    
    truncate report_activation_per_channel;
    
    
    
    insert into report_activation_per_channel 
    with t1 as (
        select enrollment_ref_fk, create_date, bfpsyncstatusenum, activationstatusenum --date(create_date), count(1) 
        from act_and_reg_per_channel_1 b 
    )
    select D.NAME ,
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'01' then 1 else 0 end) as "-01",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'02' then 1 else 0 end) as "-02",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'03' then 1 else 0 end) as "-03",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'04' then 1 else 0 end) as "-04",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'05' then 1 else 0 end) as "-05",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'06' then 1 else 0 end) as "-06",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'07' then 1 else 0 end) as "-07",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'08' then 1 else 0 end) as "-08",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'09' then 1 else 0 end) as "-09",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'10' then 1 else 0 end) as "-10",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'11' then 1 else 0 end) as "-11",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'12' then 1 else 0 end) as "-12",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'13' then 1 else 0 end) as "-13",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'14' then 1 else 0 end) as "-14",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'15' then 1 else 0 end) as "-15",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'16' then 1 else 0 end) as "-16",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'17' then 1 else 0 end) as "-17",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'18' then 1 else 0 end) as "-18",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'19' then 1 else 0 end) as "-19",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'20' then 1 else 0 end) as "-20",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'21' then 1 else 0 end) as "-21",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'22' then 1 else 0 end) as "-22",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'23' then 1 else 0 end) as "-23",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'24' then 1 else 0 end) as "-24",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'25' then 1 else 0 end) as "-25",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'26' then 1 else 0 end) as "-26",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'27' then 1 else 0 end) as "-27",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'28' then 1 else 0 end) as "-28",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'29' then 1 else 0 end) as "-29",
    sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'30' then 1 else 0 end) as "-30"
    -- ,sum(case when date(b.create_date) =''||left(date((date_trunc('month', current_date))), 8)||'31' then 1 else 0 end) as "2020-11-31"
    from dealer_type d, kyc_dealer kd, enrollment_ref e, node n, node_assignment na, t1 b --, sms_activation_request sar 
    where kd.pk = na.kyc_dealer_fk
    and e.id = n.enrollment_ref
    and na.node_fk = n.id 
    and b.enrollment_ref_fk = e.id 
    -- and sar.enrollment_ref = e.code
    -- and b.unique_id = sar.unique_id
    -- and b.msisdn = sar.phone_number
    and d.pk = kd.dealer_type_fk
    and b.bfpsyncstatusenum = 'SUCCESS'
    and b.activationstatusenum = 'ACTIVATED'
    and extract(month from b.create_date) = extract(month from now)
    group by d."name"
    order by D."name" 
    ;

    
    commit;    
END report_tcode_and_channel$BODY$;