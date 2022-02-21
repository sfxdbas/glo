--
-- EnterpriseDB database dump
--

-- Dumped from database version 12.1.2
-- Dumped by pg_dump version 12.1.2

-- Started on 2020-04-16 13:43:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET edb_redwood_date = off;
SET default_with_rowids = off;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET edb_data_redaction = off;

--
-- TOC entry 1017 (class 1255 OID 65848)
-- Name: bio_demo_pcd(); Type: PROCEDURE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE OR REPLACE PROCEDURE biocapture_test.bio_demo_pcd() AUTHID DEFINER
    IS $__sys__$
  tmpVar NUMBER;
BEGIN

insert into  biodata_demographics 
SELECT hibernate_sequence.nextval as bid, b.id,b.firstname, b.surname,  b.othername,  b.birthday,  b.gender,
dd.dda19 as nationality,
dd.da8 AS stateoforigin,  dd.da2 AS occupation,  dd.da19 AS subscriberType, dd.dda9 AS registrationlga,
dd.da3 AS residentialAddress,dd.dda6 AS residentialAddressLGA ,
dd.dda5 AS residentialAddressState, dd.da6 AS email,  dd.dda2,  dd.dda3,  dd.dda1,
dd.dda11 AS registrationType, dd.dda14 AS companyId,  dd.dda8 AS companyName,  dd.dda4 AS resident,
dd.dda7 AS postalCode,  dd.dda15 AS companyAddress,  dd.dda17 AS companyAddressLGA, dd.dda16 AS companyAddressState,
dd.dda18 AS companyAddressPostalCode, b.ID AS basicdataId,  s.phone_number,  u.unique_id,  dd.dda12 AS mothersMaidenName,
s.enrollment_ref as clientId,  e.mac_address,  s.receipt_timestamp , pd.EXPIRY_DATE,
pd.ISSUE_COUNTRY as coutryissuedcode , pd.PASSPORT_NUMBER,
 kam.agility_timestamp, dd.dda20, S.SERIAL_NUMBER, DD.da9 AS LGAOFORIGIN,DD.DDA2 AS AREAOFRESIDENCE,
DD.DA5 AS IDENTIFICATIONTYPE,DD.DA10 AS ALTERNATEPHONENUMBER, S.REGISTRATION_TIMESTAMP, kam.confirmation_status,
dd.da11 houseNumber,
--sd.reason ,sd.biometricdatatype
dd.da12 as street, dd.da13 as city,
s.confirmation_status activationStatus, 
b.biometric_capture_agent as regAgent,
pd.residency_status,
s.activation_timestamp as activationDate,
eb.create_date as eyeballingDate, eb.km_user_pk  , eb.status as eyeballingstatus, i."name" as infractionname,i.description, 
bsl.activationstatusenum, e.code, e.name
FROM basic_data b 
left join signature sg on b.id = sg.basic_data_fk 
left join passport_detail pd on pd.signature_fk = sg.id
left join  eyeballing eb on eb.basic_data_fk = b.id 
left join   infraction i on i.pk = eb.infraction_fk
LEFT JOIN kyc_agility_mapper kam ON kam.basic_data_fk = b.ID , 
dynamic_data dd , sms_activation_request s, user_id u, enrollment_ref e, bfp_sync_log bsl -- , special_data sd 
WHERE u.ID = b.user_id_fk 
AND u.unique_id = s.unique_id  
AND b.ID = dd.basic_data_fk 
AND e.code = s.enrollment_ref
and e.id = bsl.enrollment_ref_fk
AND s.unique_id = bsl.unique_id
and bsl.bfpsyncstatusenum = 'SUCCESS'
and b.id > (select max(id) from biodata_demographics)
;

---UPDATE  BIODATA_DEMOGRAPHICS  SET CRM_PUSH_STATUS = 'FAILED'
---where CRM_PUSH_STATUS IS NULL 
---and unique_id in (SELECT c.unique_id FROM CRM_PUSH_STATUS c) ;

commit;

END BIO_DEMO_PCD$__sys__$;


ALTER PROCEDURE biocapture_test.bio_demo_pcd() OWNER TO enterprisedb;

--
-- TOC entry 981 (class 1255 OID 65766)
-- Name: date_round(timestamp with time zone, interval); Type: FUNCTION; Schema: biocapture_test; Owner: enterprisedb
--

CREATE FUNCTION biocapture_test.date_round(base_date timestamp with time zone, round_interval interval) RETURNS timestamp with time zone
    LANGUAGE sql STABLE
    AS $_$
SELECT TO_TIMESTAMP((EXTRACT(epoch FROM $1)::INTEGER + EXTRACT(epoch FROM $2)::INTEGER / 2)
                / EXTRACT(epoch FROM $2)::INTEGER * EXTRACT(epoch FROM $2)::INTEGER)
$_$;


ALTER FUNCTION biocapture_test.date_round(base_date timestamp with time zone, round_interval interval) OWNER TO enterprisedb;

--
-- TOC entry 982 (class 1255 OID 42825)
-- Name: search_whole_db(text); Type: FUNCTION; Schema: biocapture_test; Owner: enterprisedb
--

CREATE FUNCTION biocapture_test.search_whole_db(_like_pattern text) RETURNS TABLE(_tbl regclass, _ctid tid)
    LANGUAGE plpgsql
    AS $_$
BEGIN
   FOR _tbl IN
      SELECT c.oid::regclass
      FROM   pg_class c
      JOIN   pg_namespace n ON n.oid = relnamespace
      WHERE  c.relkind = 'r'                           -- only tables
      AND    n.nspname !~ '^(pg_|information_schema)'  -- exclude system schemas
      ORDER BY n.nspname, c.relname
   LOOP
      RETURN QUERY EXECUTE format(
         'SELECT $1, ctid FROM %s t WHERE t::text ~~ %L'
       , _tbl, '%' || _like_pattern || '%')
      USING _tbl;
   END LOOP;
END
$_$;


ALTER FUNCTION biocapture_test.search_whole_db(_like_pattern text) OWNER TO enterprisedb;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 379 (class 1259 OID 42826)
-- Name: access_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.access_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    auth_mode character varying(255),
    kit_tag character varying(255),
    login_channel character varying(255),
    login_status_enum character varying(255),
    mac_address character varying(255),
    realtime_device_id character varying(255),
    ref_device_id character varying(255),
    username character varying(255)
);


ALTER TABLE biocapture_test.access_log OWNER TO enterprisedb;

--
-- TOC entry 380 (class 1259 OID 42832)
-- Name: agent_detail; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.agent_detail (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    account_number character varying(255),
    vtu_number character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.agent_detail OWNER TO enterprisedb;

--
-- TOC entry 381 (class 1259 OID 42838)
-- Name: agent_fingerprint; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.agent_fingerprint (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    finger_type character varying(255) NOT NULL,
    fingerprint_ oid NOT NULL,
    user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.agent_fingerprint OWNER TO enterprisedb;

--
-- TOC entry 382 (class 1259 OID 42841)
-- Name: agent_passport; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.agent_passport (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    passport_data oid NOT NULL,
    user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.agent_passport OWNER TO enterprisedb;

--
-- TOC entry 383 (class 1259 OID 42844)
-- Name: agility_integration_log_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.agility_integration_log_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    backup_path character varying(255),
    msisdn character varying(255),
    request_time timestamp without time zone,
    request_type character varying(255),
    response_code character varying(255),
    response_description character varying(255),
    response_time timestamp without time zone,
    sim_serial character varying(255),
    transaction_id character varying(255)
);


ALTER TABLE biocapture_test.agility_integration_log_ OWNER TO enterprisedb;

--
-- TOC entry 384 (class 1259 OID 42850)
-- Name: agility_push_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.agility_push_status (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    basic_data_fk bigint,
    error_category character varying(255),
    error_message character varying(255),
    msisdn character varying(255),
    quarantine_reason_code character varying(255),
    quarantine_reason_description character varying(255),
    resp_code character varying(255),
    resp_desc character varying(255),
    response_time timestamp without time zone,
    serial character varying(255),
    status character varying(255) NOT NULL,
    sync_file_name character varying(255),
    unique_id character varying(255)
);


ALTER TABLE biocapture_test.agility_push_status OWNER TO enterprisedb;

--
-- TOC entry 385 (class 1259 OID 42856)
-- Name: area; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.area (
    id bigint NOT NULL,
    code character varying(256) NOT NULL,
    name character varying(256) NOT NULL,
    lga_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.area OWNER TO enterprisedb;

--
-- TOC entry 386 (class 1259 OID 42862)
-- Name: attachment_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.attachment_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    attachment_type_enum character varying(255),
    file_data_ oid,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.attachment_ OWNER TO enterprisedb;

--
-- TOC entry 387 (class 1259 OID 42865)
-- Name: authentication_mode; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.authentication_mode (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.authentication_mode OWNER TO enterprisedb;

--
-- TOC entry 388 (class 1259 OID 42871)
-- Name: b2b_location; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.b2b_location (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255),
    short_code character varying(255),
    short_code_description character varying(255)
);


ALTER TABLE biocapture_test.b2b_location OWNER TO enterprisedb;

--
-- TOC entry 389 (class 1259 OID 42877)
-- Name: b2b_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.b2b_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    kit_image oid,
    kit_tag character varying(255),
    rejection_reason character varying(255),
    resolution_date timestamp without time zone,
    status_enum character varying(255),
    approved_by_km_user_fk bigint,
    b2b_location_fk bigint,
    kyc_dealer_fk bigint,
    node_fk bigint,
    originating_dealer_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.b2b_log OWNER TO enterprisedb;

--
-- TOC entry 390 (class 1259 OID 42883)
-- Name: b2b_request_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.b2b_request_approval (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_status character varying(255),
    feedback character varying(255) NOT NULL,
    approved_by bigint NOT NULL,
    b2b_request_fk bigint NOT NULL,
    workflow_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.b2b_request_approval OWNER TO enterprisedb;

--
-- TOC entry 391 (class 1259 OID 42889)
-- Name: banned_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.banned_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    expiry_ timestamp without time zone NOT NULL,
    ip_ character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.banned_ OWNER TO enterprisedb;

--
-- TOC entry 392 (class 1259 OID 42892)
-- Name: basic_data; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.basic_data (
    id bigint NOT NULL,
    biometric_capture_agent character varying(255),
    birthday timestamp without time zone,
    bd_part_key timestamp without time zone,
    firstname character varying(255),
    gender character varying(255),
    is_processed boolean NOT NULL,
    last_basic_data_edit_agent character varying(255) NOT NULL,
    last_basic_data_edit_login_id character varying(255) NOT NULL,
    match_found boolean NOT NULL,
    match_id character varying(255),
    othername character varying(255),
    sms_status character varying(255),
    surname character varying(256),
    sv_init_timestamp timestamp without time zone,
    sv_push_timestamp timestamp without time zone,
    sv_status character varying(255),
    sync_status character varying(255),
    state_of_registration_fk bigint NOT NULL,
    user_id_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.basic_data OWNER TO enterprisedb;

--
-- TOC entry 393 (class 1259 OID 42898)
-- Name: bfp_failure_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.bfp_failure_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    app_version character varying(255),
    capture_agent character varying(255),
    capture_mode character varying(255),
    file_sync_date timestamp without time zone,
    filename character varying(255),
    instance_ip character varying(255),
    instance_port character varying(255),
    kit_tag character varying(255),
    mac_address character varying(255),
    msisdn character varying(255),
    realtime_device_id character varying(255),
    reason1 character varying(255),
    reason2 character varying(255),
    reason3 character varying(255),
    reason4 character varying(255),
    reason5 character varying(255),
    ref_device_id character varying(255),
    reg_type character varying(255),
    registration_time timestamp without time zone,
    rejection_reason character varying(255),
    sim_serial character varying(255),
    source_path character varying(255),
    target_path character varying(255),
    transfer_mode character varying(255),
    unique_id character varying(255) NOT NULL,
    enrollment_ref_fk bigint
);


ALTER TABLE biocapture_test.bfp_failure_log OWNER TO enterprisedb;

--
-- TOC entry 394 (class 1259 OID 42904)
-- Name: bfp_sync_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.bfp_sync_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    activation_date timestamp without time zone,
    activationstatusenum character varying(255),
    bfpsyncstatusenum character varying(255),
    file_name character varying(255),
    file_sync_date timestamp without time zone,
    msisdn character varying(255),
    sim_serial character varying(255),
    source_path character varying(255),
    target_path character varying(255),
    unique_id character varying(255) NOT NULL,
    enrollment_ref_fk bigint,
    agent_email_address character varying(255),
    capture_mode character varying(255),
    device_id character varying(255),
    instance_ip character varying(255),
    instance_port character varying(255),
    reg_type character varying(255),
    rejection_reason character varying(255),
    transfer_mode character varying(255)
);


ALTER TABLE biocapture_test.bfp_sync_log OWNER TO enterprisedb;

--
-- TOC entry 395 (class 1259 OID 42910)
-- Name: user_id; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.user_id (
    id bigint NOT NULL,
    active boolean,
    blacklisted boolean,
    conflict boolean NOT NULL,
    u_part_key timestamp without time zone,
    description character varying(255),
    unique_id character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.user_id OWNER TO enterprisedb;

--
-- TOC entry 396 (class 1259 OID 42916)
-- Name: bid_view; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.bid_view AS
 SELECT b.id,
    u.unique_id,
    b.biometric_capture_agent AS bio_agent
   FROM biocapture_test.user_id u,
    biocapture_test.basic_data b
  WHERE (b.user_id_fk = u.id);


ALTER TABLE biocapture_test.bid_view OWNER TO enterprisedb;

--
-- TOC entry 644 (class 1259 OID 65833)
-- Name: biodata_demographics; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.biodata_demographics (
    bid bigint,
    id bigint,
    firstname character varying(255),
    surname character varying(256),
    othername character varying(255),
    birthday timestamp without time zone,
    gender character varying(255),
    nationality character varying(255),
    stateoforigin character varying(255),
    occupation character varying(255),
    subscribertype character varying(255),
    registrationlga character varying(255),
    residentialaddress character varying(255),
    residentialaddresslga character varying(255),
    residentialaddressstate character varying(255),
    email character varying(255),
    dda2 character varying(255),
    dda3 character varying(255),
    dda1 character varying(255),
    registrationtype character varying(255),
    companyid character varying(255),
    companyname character varying(255),
    resident character varying(255),
    postalcode character varying(255),
    companyaddress character varying(255),
    companyaddresslga character varying(255),
    companyaddressstate character varying(255),
    companyaddresspostalcode character varying(255),
    basicdataid bigint,
    phone_number character varying(255),
    unique_id character varying(255),
    mothersmaidenname character varying(255),
    clientid character varying(255),
    mac_address character varying(255),
    receipt_timestamp timestamp without time zone,
    expiry_date timestamp without time zone,
    coutryissuedcode character varying(255),
    passport_number character varying(255),
    agility_timestamp timestamp without time zone,
    dda20 character varying(255),
    serial_number character varying(255),
    lgaoforigin character varying(255),
    areaofresidence character varying(255),
    identificationtype character varying(255),
    alternatephonenumber character varying(255),
    registration_timestamp timestamp without time zone,
    confirmation_status boolean,
    housenumber character varying(255),
    street character varying(255),
    city character varying(255),
    activationstatus integer,
    regagent character varying(255),
    residency_status boolean,
    activationdate timestamp without time zone,
    eyeballingdate timestamp with time zone,
    km_user_pk integer,
    eyeballingstatus text,
    infractionname text,
    description text,
    activationstatusenum character varying(255),
    code character varying(255),
    name character varying(255),
    document_number character varying(2000)
);


ALTER TABLE biocapture_test.biodata_demographics OWNER TO enterprisedb;

--
-- TOC entry 630 (class 1259 OID 57578)
-- Name: blacklist_250_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklist_250_log (
    id numeric,
    blacklist_date timestamp without time zone,
    tag character varying(500),
    mac_address character varying(500)
);


ALTER TABLE biocapture_test.blacklist_250_log OWNER TO enterprisedb;

--
-- TOC entry 628 (class 1259 OID 57568)
-- Name: blacklist_fraud_treshold; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklist_fraud_treshold (
    type_ character varying(255),
    count_ numeric
);


ALTER TABLE biocapture_test.blacklist_fraud_treshold OWNER TO enterprisedb;

--
-- TOC entry 397 (class 1259 OID 42920)
-- Name: blacklist_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklist_history (
    id bigint NOT NULL,
    activity_timestamp timestamp without time zone,
    approved_by character varying(255),
    blacklisted boolean,
    enrollment_ref character varying(255),
    mac_address character varying(255),
    blacklist_reason character varying(255),
    km_user_id bigint,
    ip_address character varying(255),
    blacklist_reason_fk bigint,
    node_fk bigint
);


ALTER TABLE biocapture_test.blacklist_history OWNER TO enterprisedb;

--
-- TOC entry 398 (class 1259 OID 42926)
-- Name: blacklist_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklist_reason (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    code character varying(255),
    description character varying(255),
    name character varying(255),
    reason_type character varying(255)
);


ALTER TABLE biocapture_test.blacklist_reason OWNER TO enterprisedb;

--
-- TOC entry 633 (class 1259 OID 65756)
-- Name: blacklist_temp; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklist_temp (
    enrollment_ref character varying(255) NOT NULL,
    mac_address character varying(255),
    id_ numeric(20,0)
);


ALTER TABLE biocapture_test.blacklist_temp OWNER TO enterprisedb;

--
-- TOC entry 634 (class 1259 OID 65762)
-- Name: blacklist_users; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklist_users (
    biometric_capture_agent character varying(255)
);


ALTER TABLE biocapture_test.blacklist_users OWNER TO enterprisedb;

--
-- TOC entry 399 (class 1259 OID 42932)
-- Name: blacklisted_data; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklisted_data (
    pk character varying(255) NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    process_method character varying(255),
    sender character varying(255),
    target_address character varying(255),
    target_record character varying(255),
    blacklist_fk character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.blacklisted_data OWNER TO enterprisedb;

--
-- TOC entry 400 (class 1259 OID 42938)
-- Name: blacklisted_name; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklisted_name (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    name_ character varying(255) NOT NULL,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.blacklisted_name OWNER TO enterprisedb;

--
-- TOC entry 401 (class 1259 OID 42941)
-- Name: blacklisted_name_settings; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.blacklisted_name_settings (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    name_ character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.blacklisted_name_settings OWNER TO enterprisedb;

--
-- TOC entry 402 (class 1259 OID 42947)
-- Name: bundle_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.bundle_type (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    amount double precision,
    description character varying(255) NOT NULL,
    bundle_name character varying(255) NOT NULL,
    unit character varying(255),
    value character varying(255),
    vtu_category_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.bundle_type OWNER TO enterprisedb;

--
-- TOC entry 632 (class 1259 OID 65750)
-- Name: capture2sync_new; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.capture2sync_new (
    hour character varying(13),
    status character varying(7),
    within_0_1_mins numeric,
    within_3_mins numeric,
    within_5_mins numeric,
    within_8_mins numeric,
    within_10_mins numeric,
    within_15_mins numeric,
    within_20_mins numeric,
    within_30_mins numeric,
    within_1_hour numeric,
    within_2_hour numeric,
    within_1_day numeric,
    greater_than_1_day numeric,
    total numeric
);


ALTER TABLE biocapture_test.capture2sync_new OWNER TO enterprisedb;

--
-- TOC entry 403 (class 1259 OID 42953)
-- Name: churn_detail; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.churn_detail (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    churn_date timestamp without time zone NOT NULL,
    ref_no character varying(255) NOT NULL,
    churn_msisdn_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.churn_detail OWNER TO enterprisedb;

--
-- TOC entry 404 (class 1259 OID 42956)
-- Name: churn_msisdn; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.churn_msisdn (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    msisdn character varying(24) NOT NULL
);


ALTER TABLE biocapture_test.churn_msisdn OWNER TO enterprisedb;

--
-- TOC entry 405 (class 1259 OID 42959)
-- Name: client_activity_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.client_activity_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    activity character varying(255),
    activity_end_time timestamp without time zone,
    activity_start_time timestamp without time zone,
    app_version real,
    duration bigint,
    enrollment_ref character varying(255),
    extension_count integer,
    failure_count integer,
    failure_reason character varying(255),
    full_name character varying(255),
    info1 character varying(255),
    info2 character varying(255),
    info3 character varying(255),
    info4 character varying(255),
    info5 character varying(255),
    kit_tag character varying(255),
    mac_address character varying(255),
    network_status character varying(255),
    network_strength character varying(255),
    network_type character varying(255),
    phone_number character varying(255),
    point_of_termination character varying(255),
    realtime_device_id character varying(255),
    ref_device_id character varying(255),
    sim_serial character varying(255),
    sync_file_name character varying(255),
    sync_file_status character varying(255),
    sync_transfer_mode character varying(255),
    termination_flag character varying(255),
    unique_activity_code character varying(255),
    username character varying(255)
);


ALTER TABLE biocapture_test.client_activity_log OWNER TO enterprisedb;

--
-- TOC entry 406 (class 1259 OID 42965)
-- Name: client_lock_out_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.client_lock_out_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    enrollment_ref_fk bigint,
    km_user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.client_lock_out_log OWNER TO enterprisedb;

--
-- TOC entry 407 (class 1259 OID 42968)
-- Name: community_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.community_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.community_ OWNER TO enterprisedb;

--
-- TOC entry 408 (class 1259 OID 42974)
-- Name: country; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.country (
    id bigint NOT NULL,
    code character varying(256) NOT NULL,
    country_id integer,
    name character varying(256) NOT NULL
);


ALTER TABLE biocapture_test.country OWNER TO enterprisedb;

--
-- TOC entry 629 (class 1259 OID 57574)
-- Name: cr; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.cr (
    code character varying(255)
);


ALTER TABLE biocapture_test.cr OWNER TO enterprisedb;

--
-- TOC entry 409 (class 1259 OID 42980)
-- Name: crm_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.crm_log (
    id bigint NOT NULL,
    data_id character varying(255) NOT NULL,
    data_type character varying(2000) NOT NULL,
    final_timestamp timestamp without time zone,
    init_timestamp timestamp without time zone,
    msisdn character varying(255) NOT NULL,
    request_xml clob,
    response character varying(2000),
    status character varying(255),
    status_message character varying(255),
    txn_id character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.crm_log OWNER TO enterprisedb;

--
-- TOC entry 410 (class 1259 OID 42986)
-- Name: crm_push_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.crm_push_status (
    id bigint NOT NULL,
    crm_create_timestamp timestamp without time zone,
    crm_push_timestamp_ timestamp without time zone,
    crm_type character varying(255),
    push_status character varying(255),
    skip boolean,
    skip_reason character varying(1024),
    unique_id character varying(255),
    msisdn_detail_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.crm_push_status OWNER TO enterprisedb;

--
-- TOC entry 411 (class 1259 OID 42992)
-- Name: crm_push_status_view; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.crm_push_status_view AS
 SELECT crm_push_status.id,
    crm_push_status.crm_create_timestamp,
    crm_push_status.crm_push_timestamp_,
    crm_push_status.crm_type,
    crm_push_status.push_status,
    crm_push_status.unique_id,
    crm_push_status.msisdn_detail_fk,
    crm_push_status.skip,
    crm_push_status.skip_reason
   FROM biocapture_test.crm_push_status;


ALTER TABLE biocapture_test.crm_push_status_view OWNER TO enterprisedb;

--
-- TOC entry 631 (class 1259 OID 65744)
-- Name: daily_reg; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.daily_reg (
    phone_number character varying(255) NOT NULL,
    unique_id character varying(255) NOT NULL,
    registration_timestamp timestamp without time zone NOT NULL,
    receipt_timestamp timestamp without time zone NOT NULL,
    confirmation_timestamp timestamp without time zone,
    registration_type character varying(255),
    file_sync_date timestamp without time zone,
    state_id numeric(19,0) NOT NULL,
    channel character varying(255),
    status character varying(7)
);


ALTER TABLE biocapture_test.daily_reg OWNER TO enterprisedb;

--
-- TOC entry 412 (class 1259 OID 42996)
-- Name: dealer_division; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.dealer_division (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.dealer_division OWNER TO enterprisedb;

--
-- TOC entry 413 (class 1259 OID 43002)
-- Name: dealer_exclusion_list; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.dealer_exclusion_list (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    excluded_by character varying(255),
    dealer_fk bigint
);


ALTER TABLE biocapture_test.dealer_exclusion_list OWNER TO enterprisedb;

--
-- TOC entry 414 (class 1259 OID 43005)
-- Name: dealer_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.dealer_type (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    code character varying(64) NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE biocapture_test.dealer_type OWNER TO enterprisedb;

--
-- TOC entry 415 (class 1259 OID 43008)
-- Name: delete_after_1; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.delete_after_1 (
    id bigint
);


ALTER TABLE biocapture_test.delete_after_1 OWNER TO enterprisedb;

--
-- TOC entry 416 (class 1259 OID 43011)
-- Name: dynamic_data; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.dynamic_data (
    id bigint NOT NULL,
    da1 character varying(255),
    da10 character varying(255),
    da11 character varying(255),
    da12 character varying(255),
    da13 character varying(255),
    da14 character varying(255),
    da15 character varying(255),
    da16 character varying(255),
    da17 character varying(255),
    da18 character varying(255),
    da19 character varying(255),
    da2 character varying(255),
    da20 character varying(255),
    da21 character varying(255),
    da22 character varying(255),
    da23 character varying(255),
    da24 character varying(255),
    da25 character varying(255),
    da26 character varying(255),
    da27 character varying(255),
    da28 character varying(255),
    da29 character varying(255),
    da3 character varying(255),
    da30 character varying(255),
    da31 character varying(255),
    da32 character varying(255),
    da33 character varying(255),
    da34 character varying(255),
    da35 character varying(255),
    da36 character varying(255),
    da37 character varying(255),
    da38 character varying(255),
    da39 character varying(255),
    da4 character varying(255),
    da40 character varying(255),
    da5 character varying(255),
    da6 character varying(255),
    da7 character varying(255),
    da8 character varying(255),
    da9 character varying(255),
    dda1 character varying(255),
    dda10 character varying(255),
    dda11 character varying(255),
    dda12 character varying(255),
    dda13 character varying(255),
    dda14 character varying(255),
    dda15 character varying(255),
    dda16 character varying(255),
    dda17 character varying(255),
    dda18 character varying(255),
    dda19 character varying(255),
    dda2 character varying(255),
    dda20 character varying(255),
    dda21 character varying(255),
    dda22 character varying(255),
    dda23 character varying(255),
    dda24 character varying(255),
    dda25 character varying(255),
    dda26 character varying(255),
    dda27 character varying(255),
    dda28 character varying(255),
    dda29 character varying(255),
    dda3 character varying(255),
    dda30 character varying(255),
    dda31 character varying(255),
    dda32 character varying(255),
    dda33 character varying(255),
    dda34 character varying(255),
    dda35 character varying(255),
    dda36 character varying(255),
    dda37 character varying(255),
    dda38 character varying(255),
    dda39 character varying(255),
    dda4 character varying(255),
    dda40 character varying(255),
    dda5 character varying(255),
    dda6 character varying(255),
    dda7 character varying(255),
    dda8 character varying(255),
    dda9 character varying(255),
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.dynamic_data OWNER TO enterprisedb;

--
-- TOC entry 417 (class 1259 OID 43017)
-- Name: sms_activation_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.sms_activation_request (
    id bigint NOT NULL,
    activation_timestamp timestamp without time zone,
    agility_push_timestamp timestamp without time zone,
    crm_bio_update_time timestamp without time zone,
    confirmation_status integer,
    sar_part_key timestamp without time zone NOT NULL,
    crm_update_time timestamp without time zone,
    customer_name character varying(255) NOT NULL,
    enrollment_ref character varying(255) NOT NULL,
    is_initiator boolean NOT NULL,
    msisdn_update_status character varying(255),
    msisdn_update_timestamp timestamp without time zone,
    phone_number character varying(255) NOT NULL,
    previous_unique_id character varying(255),
    receipt_timestamp timestamp without time zone NOT NULL,
    registration_timestamp timestamp without time zone NOT NULL,
    registration_type character varying(255),
    sender_number character varying(255) NOT NULL,
    serial_number character varying(255) NOT NULL,
    state_id bigint NOT NULL,
    status character varying(255) NOT NULL,
    unique_id character varying(255) NOT NULL,
    phone_number_status_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.sms_activation_request OWNER TO enterprisedb;

--
-- TOC entry 418 (class 1259 OID 43023)
-- Name: demographics_view; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.demographics_view AS
 SELECT b.firstname,
    b.surname,
    b.othername,
    b.birthday,
    b.gender,
    dd.dda19,
    dd.da8,
    dd.da2,
    dd.da19,
    dd.dda9,
    dd.da3,
    dd.dda6,
    dd.dda5,
    dd.da6,
    dd.dda2,
    dd.dda3,
    dd.dda1,
    dd.da18,
    dd.dda14,
    dd.dda8,
    dd.dda4,
    dd.dda7,
    dd.dda15,
    dd.dda17,
    dd.dda16,
    dd.dda18,
    dd.id,
    s.phone_number,
    u.unique_id,
    dd.dda12
   FROM biocapture_test.basic_data b,
    biocapture_test.dynamic_data dd,
    biocapture_test.sms_activation_request s,
    biocapture_test.user_id u
  WHERE ((u.id = b.user_id_fk) AND ((u.unique_id)::text = (s.unique_id)::text) AND (b.id = dd.basic_data_fk));


ALTER TABLE biocapture_test.demographics_view OWNER TO enterprisedb;

--
-- TOC entry 419 (class 1259 OID 43028)
-- Name: device; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device (
    id bigint NOT NULL,
    device_tag character varying(255) NOT NULL,
    device_status_fk bigint NOT NULL,
    device_type_fk bigint NOT NULL,
    node_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.device OWNER TO enterprisedb;

--
-- TOC entry 420 (class 1259 OID 43031)
-- Name: device_license_quota; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_license_quota (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    purchase_date timestamp without time zone,
    purchased_licences integer
);


ALTER TABLE biocapture_test.device_license_quota OWNER TO enterprisedb;

--
-- TOC entry 421 (class 1259 OID 43034)
-- Name: enrollment_ref; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.enrollment_ref (
    id bigint NOT NULL,
    code character varying(255),
    is_corporate boolean,
    custom1 character varying(255),
    custom2 character varying(255),
    custom3 character varying(255),
    date_installed timestamp without time zone,
    description character varying(255),
    device_id character varying(255),
    installed_by character varying(255),
    mac_address character varying(255),
    name character varying(255),
    network_card_name character varying(255)
);


ALTER TABLE biocapture_test.enrollment_ref OWNER TO enterprisedb;

--
-- TOC entry 422 (class 1259 OID 43040)
-- Name: kyc_dealer; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kyc_dealer (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    address character varying(255),
    contact_address character varying(255),
    deal_code character varying(255),
    email_address character varying(255),
    km_user_pk bigint,
    mobile_number character varying(16),
    name character varying(255) NOT NULL,
    orbita_id bigint,
    zone_fk bigint,
    dealer_division_fk bigint,
    dealer_type_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.kyc_dealer OWNER TO enterprisedb;

--
-- TOC entry 423 (class 1259 OID 43046)
-- Name: lga; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.lga (
    id bigint NOT NULL,
    code character varying(255),
    coordinate_boundaries character varying(5225),
    lga_id integer,
    name character varying(255) NOT NULL,
    state_fk bigint NOT NULL,
    territory_fk bigint
);


ALTER TABLE biocapture_test.lga OWNER TO enterprisedb;

--
-- TOC entry 424 (class 1259 OID 43052)
-- Name: node; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.node (
    id bigint NOT NULL,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    aware_liveness_version integer,
    blacklist_date timestamp without time zone,
    black_listed boolean,
    commissioned boolean,
    is_corporate boolean,
    data_list_tag_name character varying(255),
    deployment_category character varying(255),
    geotracker_app_version real,
    geotracker_install_date timestamp without time zone,
    google_vision_version integer,
    image_clean_up_version integer,
    installation_timestamp timestamp without time zone,
    installed_by character varying(255),
    last_installed_update real,
    last_sync_time timestamp without time zone,
    last_updated timestamp without time zone,
    location character varying(255),
    mac_address character varying(255),
    machine_architecture character varying(255),
    machine_manufacturer character varying(255),
    machine_model character varying(255),
    machine_os character varying(255),
    machine_runtime_version character varying(255),
    machine_serial_number character varying(255),
    migrated boolean,
    network_card_name character varying(255),
    node_activity_status_enum character varying(255),
    passive_liveness_version integer,
    previous_tag_name character varying(255),
    remark character varying(255),
    sync_status character varying(255),
    purchase_year integer,
    device_owner bigint,
    device_status_fk bigint,
    device_type bigint,
    enrollment_ref bigint,
    kit_type_fk bigint
);


ALTER TABLE biocapture_test.node OWNER TO enterprisedb;

--
-- TOC entry 425 (class 1259 OID 43058)
-- Name: node_assignment; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.node_assignment (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    area_fk bigint,
    kyc_dealer_fk bigint,
    state_fk bigint,
    zone_fk bigint,
    dm_user_fk bigint,
    fsa_user_fk bigint,
    lga_fk bigint,
    outlet_fk bigint,
    node_fk bigint NOT NULL,
    territory_fk bigint
);


ALTER TABLE biocapture_test.node_assignment OWNER TO enterprisedb;

--
-- TOC entry 426 (class 1259 OID 43061)
-- Name: outlet; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.outlet (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    address character varying(255),
    center_id character varying(255),
    coordinate_address character varying(255),
    latitude double precision,
    longitude double precision,
    name character varying(255),
    outlet_picture oid,
    owner_name character varying(255),
    owner_phone_number character varying(255),
    owner_vtu_number character varying(255),
    kyc_dealer_fk bigint,
    outlet_type_fk bigint
);


ALTER TABLE biocapture_test.outlet OWNER TO enterprisedb;

--
-- TOC entry 427 (class 1259 OID 43067)
-- Name: state; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.state (
    id bigint NOT NULL,
    code character varying(256) NOT NULL,
    coordinate_boundaries character varying(5225),
    name character varying(256) NOT NULL,
    state_id integer,
    country_fk bigint NOT NULL,
    region_fk bigint,
    zone_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.state OWNER TO enterprisedb;

--
-- TOC entry 428 (class 1259 OID 43073)
-- Name: territory; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.territory (
    id bigint NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL,
    state_fk bigint NOT NULL,
    zone_fk bigint
);


ALTER TABLE biocapture_test.territory OWNER TO enterprisedb;

--
-- TOC entry 429 (class 1259 OID 43079)
-- Name: zone; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zone (
    id bigint NOT NULL,
    code character varying(256) NOT NULL,
    name character varying(256) NOT NULL,
    region_fk bigint
);


ALTER TABLE biocapture_test.zone OWNER TO enterprisedb;

--
-- TOC entry 430 (class 1259 OID 43085)
-- Name: device_mapper_; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.device_mapper_ AS
 SELECT DISTINCT e.code,
    e.mac_address,
    k.name AS dealer,
    k.deal_code AS dealer_code,
    k.pk AS dealer_fk,
    k.orbita_id,
    d.name AS dept,
    dd.name AS dealer_division,
    k.email_address AS dealer_email,
    k.mobile_number AS dealer_mobile,
    k.km_user_pk,
    n.id AS node_id,
    k.zone_fk,
    zone.name AS region,
    state.name AS state,
    lga.name AS lga,
    area.name AS area,
    territory.name AS territory,
    outlet.name AS outlet,
    e.device_id,
    e.id AS enrollment_ref_id
   FROM (((((((((((biocapture_test.node n
     JOIN biocapture_test.node_assignment ns ON ((ns.node_fk = n.id)))
     JOIN biocapture_test.enrollment_ref e ON ((n.enrollment_ref = e.id)))
     JOIN biocapture_test.kyc_dealer k ON ((ns.kyc_dealer_fk = k.pk)))
     JOIN biocapture_test.dealer_type d ON ((k.dealer_type_fk = d.pk)))
     LEFT JOIN biocapture_test.dealer_division dd ON ((k.dealer_division_fk = dd.pk)))
     LEFT JOIN biocapture_test.area ON ((ns.area_fk = area.id)))
     LEFT JOIN biocapture_test.lga ON ((area.lga_fk = lga.id)))
     LEFT JOIN biocapture_test.state ON ((lga.state_fk = state.id)))
     LEFT JOIN biocapture_test.zone ON ((state.zone_fk = zone.id)))
     LEFT JOIN biocapture_test.outlet ON ((ns.outlet_fk = outlet.pk)))
     LEFT JOIN biocapture_test.territory ON ((ns.territory_fk = territory.id)));


ALTER TABLE biocapture_test.device_mapper_ OWNER TO enterprisedb;

--
-- TOC entry 431 (class 1259 OID 43090)
-- Name: device_mapper_1; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.device_mapper_1 AS
 SELECT DISTINCT e.code,
    e.mac_address,
    k.name AS dealer,
    k.deal_code AS dealer_code,
    k.pk AS dealer_fk,
    k.orbita_id,
    d.name AS dept,
    dd.name AS dealer_division,
    k.email_address AS dealer_email,
    k.mobile_number AS dealer_mobile,
    k.km_user_pk,
    n.id AS node_id,
    k.zone_fk
   FROM biocapture_test.enrollment_ref e,
    biocapture_test.node n,
    biocapture_test.node_assignment ns,
    biocapture_test.dealer_type d,
    (biocapture_test.kyc_dealer k
     LEFT JOIN biocapture_test.dealer_division dd ON ((k.dealer_division_fk = dd.pk)))
  WHERE ((replace(lower((e.mac_address)::text), '-'::text, ':'::text) = replace(lower((n.mac_address)::text), '-'::text, ':'::text)) AND (ns.node_fk = n.id) AND (ns.kyc_dealer_fk = k.pk) AND (k.dealer_type_fk = d.pk));


ALTER TABLE biocapture_test.device_mapper_1 OWNER TO enterprisedb;

--
-- TOC entry 432 (class 1259 OID 43095)
-- Name: device_owner; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_owner (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.device_owner OWNER TO enterprisedb;

--
-- TOC entry 433 (class 1259 OID 43101)
-- Name: device_requisition_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_requisition_approval (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_feedback_message character varying(255),
    approval_status_enum character varying(255),
    approved_by_km_user_fk bigint,
    device_requisition_request_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.device_requisition_approval OWNER TO enterprisedb;

--
-- TOC entry 434 (class 1259 OID 43107)
-- Name: device_requisition_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_requisition_request (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    item_count integer,
    peripheral boolean,
    request_description character varying(255),
    approval_status_enum character varying(255),
    area_fk bigint,
    kyc_dealer_fk bigint,
    requested_by_km_user_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.device_requisition_request OWNER TO enterprisedb;

--
-- TOC entry 435 (class 1259 OID 43113)
-- Name: device_specific_setting; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_specific_setting (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    setting_name character varying(255) NOT NULL,
    setting_value character varying(255),
    enrollment_ref_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.device_specific_setting OWNER TO enterprisedb;

--
-- TOC entry 436 (class 1259 OID 43119)
-- Name: device_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_status (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    remark character varying(255)
);


ALTER TABLE biocapture_test.device_status OWNER TO enterprisedb;

--
-- TOC entry 437 (class 1259 OID 43125)
-- Name: device_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_type (
    id bigint NOT NULL,
    code character varying(255),
    description character varying(255),
    device_type_enum character varying(255),
    name character varying(255),
    peripheral boolean
);


ALTER TABLE biocapture_test.device_type OWNER TO enterprisedb;

--
-- TOC entry 438 (class 1259 OID 43131)
-- Name: heart_beat_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.heart_beat_status (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    agent_mobile character varying(255),
    agent_name character varying(255),
    app_version character varying(255),
    available_storage character varying(255),
    camera_status character varying(255),
    client_time_status character varying(255),
    client_uptime bigint,
    coordinate_address character varying(255),
    deploy_state character varying(255),
    geo_tracker_app_version character varying(255),
    heart_beat_source character varying(255),
    latitude double precision,
    location_accuracy double precision,
    location_generation_time timestamp without time zone,
    location_information_source character varying(255),
    location_permission_granted boolean,
    longitude double precision,
    mac_address character varying(255),
    mocked_coordinate boolean,
    network_connection_type character varying(255),
    network_strength character varying(255),
    network_type character varying(255),
    os_name character varying(255),
    os_version character varying(255),
    phone_status_enabled boolean,
    processor_speed character varying(255),
    ram_size character varying(255),
    realtime_device_id character varying(255),
    receipt_date timestamp without time zone,
    ref_device_id character varying(255),
    rooted boolean,
    scanner_status character varying(255),
    tag character varying(255),
    total_storage character varying(255),
    used_storage character varying(255)
);


ALTER TABLE biocapture_test.heart_beat_status OWNER TO enterprisedb;

--
-- TOC entry 439 (class 1259 OID 43137)
-- Name: km_user; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_user (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    ad_username character varying(255),
    blacklisted boolean,
    client_first_login timestamp without time zone,
    email_address character varying(255) NOT NULL,
    failed_login_attempts integer,
    first_name character varying(128),
    gender character varying(255),
    last_failed_login timestamp without time zone,
    last_password_change timestamp without time zone,
    last_successful_login timestamp without time zone,
    locked_out boolean,
    mobile character varying(255),
    nin character varying(255),
    orbita_id bigint NOT NULL,
    other_name character varying(128),
    password character varying(255),
    surname character varying(128),
    dealer_fk bigint,
    zone_fk bigint,
    last_logout timestamp without time zone
);


ALTER TABLE biocapture_test.km_user OWNER TO enterprisedb;

--
-- TOC entry 440 (class 1259 OID 43143)
-- Name: region; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.region (
    id bigint NOT NULL,
    code character varying(256) NOT NULL,
    name character varying(256) NOT NULL
);


ALTER TABLE biocapture_test.region OWNER TO enterprisedb;

--
-- TOC entry 441 (class 1259 OID 43149)
-- Name: device_summary_view; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.device_summary_view AS
 SELECT __unnamed_subquery_0.tag,
    __unnamed_subquery_0.device_id,
    __unnamed_subquery_0.longitude,
    __unnamed_subquery_0.latitude,
    __unnamed_subquery_0.dealer_name,
    __unnamed_subquery_0.dealer_code,
    __unnamed_subquery_0.dealer_type,
    __unnamed_subquery_0.dealer_division,
    __unnamed_subquery_0.blacklisted,
    __unnamed_subquery_0.receipt_date,
    __unnamed_subquery_0.assigned_agent,
    __unnamed_subquery_0.coordinate_address,
    __unnamed_subquery_0.device_status,
    __unnamed_subquery_0.network_strength,
    __unnamed_subquery_0.device_root_status,
    __unnamed_subquery_0.location_accuracy,
    __unnamed_subquery_0.os_name,
    __unnamed_subquery_0.os_version,
    __unnamed_subquery_0.processor_speed,
    __unnamed_subquery_0.storage_used,
    __unnamed_subquery_0.storage_available,
    __unnamed_subquery_0.total_storage,
    __unnamed_subquery_0.ram_size,
    __unnamed_subquery_0.last_logged_inuser,
    __unnamed_subquery_0.last_heartbeat_time,
    __unnamed_subquery_0.mac_address,
    __unnamed_subquery_0.division_pk,
    __unnamed_subquery_0.node_id,
    __unnamed_subquery_0.dealer_pk,
    __unnamed_subquery_0.lga,
    __unnamed_subquery_0.state,
    __unnamed_subquery_0.region,
    __unnamed_subquery_0.area,
    __unnamed_subquery_0.zone,
    __unnamed_subquery_0.lga_id,
    __unnamed_subquery_0.state_id,
    __unnamed_subquery_0.region_id,
    __unnamed_subquery_0.enrollment_ref_id,
    __unnamed_subquery_0.installed_by,
    __unnamed_subquery_0.app_version,
    __unnamed_subquery_0.device_type,
    __unnamed_subquery_0.last_sync_time,
    __unnamed_subquery_0.kit_model,
    __unnamed_subquery_0.geotracker_app_version,
    __unnamed_subquery_0.territory
   FROM ( SELECT DISTINCT e.code AS tag,
            e.device_id,
            hs.longitude,
            hs.latitude,
            kd.name AS dealer_name,
            kd.deal_code AS dealer_code,
            dt.name AS dealer_type,
            dd.name AS dealer_division,
            n.black_listed AS blacklisted,
            hs.receipt_date,
            (((kmu.first_name)::text || ' '::text) || (kmu.surname)::text) AS assigned_agent,
            hs.coordinate_address,
            ds.name AS device_status,
            hs.network_strength,
            hs.rooted AS device_root_status,
            hs.location_accuracy,
            hs.os_name,
            hs.os_version,
            hs.processor_speed,
            hs.used_storage AS storage_used,
            hs.available_storage AS storage_available,
            hs.total_storage,
            hs.ram_size,
            hs.agent_name AS last_logged_inuser,
            hs.last_modified AS last_heartbeat_time,
            COALESCE(upper((hs.mac_address)::text), upper((e.mac_address)::text)) AS mac_address,
            dd.pk AS division_pk,
            n.id AS node_id,
            kd.pk AS dealer_pk,
            lg.name AS lga,
            s.name AS state,
            re.name AS region,
            ar.name AS area,
            zo.name AS zone,
            lg.id AS lga_id,
            s.id AS state_id,
            re.id AS region_id,
            e.id AS enrollment_ref_id,
            e.installed_by,
            n.last_installed_update AS app_version,
            dtp.name AS device_type,
            n.last_sync_time,
            n.machine_model AS kit_model,
            hs.app_version AS geotracker_app_version,
            territory.name AS territory
           FROM (((((((((((((((biocapture_test.heart_beat_status hs
             FULL JOIN biocapture_test.enrollment_ref e ON (((
                CASE
                    WHEN (e.device_id IS NULL) THEN e.mac_address
                    ELSE e.device_id
                END)::text = (
                CASE
                    WHEN (hs.ref_device_id IS NULL) THEN hs.mac_address
                    ELSE hs.ref_device_id
                END)::text)))
             LEFT JOIN biocapture_test.node n ON ((e.id = n.enrollment_ref)))
             LEFT JOIN biocapture_test.node_assignment na ON ((n.id = na.node_fk)))
             LEFT JOIN biocapture_test.area ar ON ((na.area_fk = ar.id)))
             LEFT JOIN biocapture_test.lga lg ON ((ar.lga_fk = lg.id)))
             LEFT JOIN biocapture_test.territory ON ((lg.territory_fk = territory.id)))
             LEFT JOIN biocapture_test.state s ON ((lg.state_fk = s.id)))
             LEFT JOIN biocapture_test.zone zo ON ((s.zone_fk = zo.id)))
             LEFT JOIN biocapture_test.region re ON ((zo.region_fk = re.id)))
             LEFT JOIN biocapture_test.km_user kmu ON ((na.fsa_user_fk = kmu.pk)))
             LEFT JOIN biocapture_test.kyc_dealer kd ON ((na.kyc_dealer_fk = kd.pk)))
             LEFT JOIN biocapture_test.dealer_type dt ON ((kd.dealer_type_fk = dt.pk)))
             LEFT JOIN biocapture_test.dealer_division dd ON ((kd.dealer_division_fk = dd.pk)))
             LEFT JOIN biocapture_test.device_status ds ON ((n.device_status_fk = ds.id)))
             LEFT JOIN biocapture_test.device_type dtp ON ((n.device_type = dtp.id)))
          WHERE (NOT (
                CASE
                    WHEN (kd.pk IS NULL) THEN (1)::bigint
                    ELSE kd.pk
                END IN ( SELECT dealer_exclusion_list.dealer_fk
                   FROM biocapture_test.dealer_exclusion_list)))) __unnamed_subquery_0;


ALTER TABLE biocapture_test.device_summary_view OWNER TO enterprisedb;

--
-- TOC entry 442 (class 1259 OID 43154)
-- Name: device_tag_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_tag_request (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    app_version character varying(255),
    device_type_enum character varying(255),
    kit_tag character varying(255),
    requested_device_id character varying(255),
    tag_approval_status_enum character varying(255),
    tag_request_type_enum character varying(255),
    kyc_dealer_fk bigint,
    device_type_fk bigint,
    enrollment_ref_fk bigint,
    lga_fk bigint,
    requested_by_km_user_fk bigint,
    workflow_fk bigint,
    alt_kit_tag character varying(255)
);


ALTER TABLE biocapture_test.device_tag_request OWNER TO enterprisedb;

--
-- TOC entry 443 (class 1259 OID 43160)
-- Name: device_tag_request_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.device_tag_request_approval (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_feedback_message character varying(255),
    tag_approval_status_enum character varying(255),
    approved_by_km_user_fk bigint,
    device_tag_request_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.device_tag_request_approval OWNER TO enterprisedb;

--
-- TOC entry 647 (class 1259 OID 65857)
-- Name: devices_reg_report; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.devices_reg_report (
    enrollment_ref character varying(255),
    name character varying(255),
    code character varying(255),
    state character varying(255),
    count bigint
);


ALTER TABLE biocapture_test.devices_reg_report OWNER TO enterprisedb;

--
-- TOC entry 444 (class 1259 OID 43166)
-- Name: dispute; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.dispute (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    is_comment boolean,
    dispute character varying(255) NOT NULL,
    disputer_name character varying(255),
    disputer_orbita_id bigint,
    disputer_type character varying(255),
    vr_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.dispute OWNER TO enterprisedb;

--
-- TOC entry 445 (class 1259 OID 43172)
-- Name: duplicate_node; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.duplicate_node (
    id bigint NOT NULL,
    installed_by character varying(255),
    intallation_timestamp timestamp without time zone,
    mac_address character varying(255),
    network_card_name character varying(255),
    tag_name character varying(255)
);


ALTER TABLE biocapture_test.duplicate_node OWNER TO enterprisedb;

--
-- TOC entry 446 (class 1259 OID 43178)
-- Name: enrollment_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.enrollment_log (
    id bigint NOT NULL,
    enrollment_date timestamp without time zone,
    enrollment_time timestamp without time zone,
    basic_data_fk bigint NOT NULL,
    enrollment_ref_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.enrollment_log OWNER TO enterprisedb;

--
-- TOC entry 643 (class 1259 OID 65827)
-- Name: eyeballing; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.eyeballing (
    pk integer,
    status text,
    create_date timestamp with time zone,
    km_user_pk integer,
    infraction_fk integer,
    basic_data_fk integer
);


ALTER TABLE biocapture_test.eyeballing OWNER TO enterprisedb;

--
-- TOC entry 447 (class 1259 OID 43181)
-- Name: failed_reg_notify_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.failed_reg_notify_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    agent_user_name character varying(255),
    cust_first_name character varying(255),
    cust_last_name character varying(255),
    cust_mid_name character varying(255),
    kit_tag character varying(255),
    notificationtype character varying(255),
    recipient character varying(255),
    sms_trigger_date timestamp without time zone
);


ALTER TABLE biocapture_test.failed_reg_notify_log OWNER TO enterprisedb;

--
-- TOC entry 448 (class 1259 OID 43187)
-- Name: faq_information; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.faq_information (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    answer character varying(255) NOT NULL,
    question character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.faq_information OWNER TO enterprisedb;

--
-- TOC entry 449 (class 1259 OID 43193)
-- Name: fault; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.fault (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    fault_status character varying(255) NOT NULL,
    reciept_time_stamp timestamp without time zone NOT NULL,
    resolution_timestamp timestamp without time zone,
    resolved_by bigint,
    ticket_number character varying(255),
    node_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.fault OWNER TO enterprisedb;

--
-- TOC entry 450 (class 1259 OID 43199)
-- Name: field_edit_details; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.field_edit_details (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    field_name character varying(255) NOT NULL,
    reasons character varying(255) NOT NULL,
    accessibility_status_enum character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.field_edit_details OWNER TO enterprisedb;

--
-- TOC entry 451 (class 1259 OID 43205)
-- Name: field_edit_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.field_edit_reason (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    field_name character varying(255) NOT NULL,
    field_reason character varying(255) NOT NULL,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.field_edit_reason OWNER TO enterprisedb;

--
-- TOC entry 452 (class 1259 OID 43211)
-- Name: fm_license_approval_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.fm_license_approval_history (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_date timestamp without time zone NOT NULL,
    is_approved boolean NOT NULL,
    approver_id bigint NOT NULL,
    comments character varying(255) NOT NULL,
    ip_address character varying(255),
    kit_tag character varying(255),
    mac_address character varying(255),
    node_fk bigint
);


ALTER TABLE biocapture_test.fm_license_approval_history OWNER TO enterprisedb;

--
-- TOC entry 453 (class 1259 OID 43217)
-- Name: fm_license_quota; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.fm_license_quota (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    purchase_date timestamp without time zone,
    purchased_licences integer
);


ALTER TABLE biocapture_test.fm_license_quota OWNER TO enterprisedb;

--
-- TOC entry 454 (class 1259 OID 43220)
-- Name: fm_license_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.fm_license_request (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    agent_name character varying(255),
    approval_date timestamp without time zone,
    is_approved boolean,
    authorized_by_email_address character varying(255),
    comments character varying(255),
    email_address character varying(255) NOT NULL,
    kit_tag character varying(255) NOT NULL,
    license_hash character varying(255),
    license_request_type character varying(255),
    mac_address character varying(255),
    request_date timestamp without time zone NOT NULL,
    approved_by bigint,
    enrollment_ref_fk bigint,
    requested_by bigint NOT NULL
);


ALTER TABLE biocapture_test.fm_license_request OWNER TO enterprisedb;

--
-- TOC entry 645 (class 1259 OID 65839)
-- Name: fraud_report; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.fraud_report (
    firstname text,
    middlename text,
    lastname text,
    mothersmaidenname text,
    stateoforigin text,
    residentialaddress text,
    registrationlga text,
    birthday timestamp without time zone
);


ALTER TABLE biocapture_test.fraud_report OWNER TO enterprisedb;

--
-- TOC entry 455 (class 1259 OID 43226)
-- Name: geo_fence_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.geo_fence_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    coordinate_address character varying(255),
    latitude double precision,
    longitude double precision,
    heart_beat_status_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.geo_fence_log OWNER TO enterprisedb;

--
-- TOC entry 456 (class 1259 OID 43229)
-- Name: heart_beat; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.heart_beat (
    id bigint NOT NULL,
    agent_mobile character varying(255),
    agent_name character varying(255),
    app_version character varying(255),
    available_storage character varying(255),
    camera_status character varying(255),
    client_timestamp timestamp without time zone,
    client_time_status character varying(255),
    client_uptime bigint,
    daily_confirmed bigint,
    daily_registered bigint,
    daily_sent bigint,
    deploy_state character varying(255),
    display_incorrect_time boolean,
    latitude double precision,
    liveness_threshold_version character varying(255),
    location_accuracy double precision,
    location_generation_time timestamp without time zone,
    location_information_source character varying(255),
    location_permission_granted boolean,
    login_uptime bigint,
    longitude double precision,
    mac_address character varying(255),
    mocked_coordinate boolean,
    modem_model character varying(255),
    modem_serial character varying(255),
    modem_signal_level character varying(255),
    network_connection_type character varying(255),
    network_strength character varying(255),
    network_type character varying(255),
    os_name character varying(255),
    os_version character varying(255),
    phone_status_enabled boolean,
    ping_latency bigint,
    processor_speed character varying(255),
    ram_size character varying(255),
    realtime_device_id character varying(255),
    receipt_timestamp timestamp without time zone NOT NULL,
    ref_device_id character varying(255),
    server_response_time timestamp without time zone,
    rooted boolean,
    scanner_status character varying(255),
    tag character varying(255),
    threshold_version character varying(255),
    total_confirmed bigint,
    total_registered bigint,
    total_sent bigint,
    total_storage character varying(255),
    used_storage character varying(255)
);


ALTER TABLE biocapture_test.heart_beat OWNER TO enterprisedb;

--
-- TOC entry 457 (class 1259 OID 43235)
-- Name: heartbeat_current_month; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.heartbeat_current_month AS
 SELECT sum(__unnamed_subquery_0.total_registered) AS total_registered,
    sum(__unnamed_subquery_0.total_sent) AS total_sent,
    sum(__unnamed_subquery_0.total_confirmed) AS total_confirmed,
    max(__unnamed_subquery_0.receipt_timestamp) AS last_hb_sent,
    __unnamed_subquery_0.tag,
    __unnamed_subquery_0.mac_address,
    __unnamed_subquery_0.ref_device_id AS device_id
   FROM ( SELECT h.id,
            h.agent_mobile,
            h.agent_name,
            h.app_version,
            h.available_storage,
            h.camera_status,
            h.client_timestamp,
            h.client_time_status,
            h.client_uptime,
            h.daily_confirmed,
            h.daily_registered,
            h.daily_sent,
            h.deploy_state,
            h.display_incorrect_time,
            h.latitude,
            h.liveness_threshold_version,
            h.location_accuracy,
            h.location_generation_time,
            h.location_information_source,
            h.location_permission_granted,
            h.login_uptime,
            h.longitude,
            h.mac_address,
            h.mocked_coordinate,
            h.modem_model,
            h.modem_serial,
            h.modem_signal_level,
            h.network_connection_type,
            h.network_strength,
            h.network_type,
            h.os_name,
            h.os_version,
            h.phone_status_enabled,
            h.ping_latency,
            h.processor_speed,
            h.ram_size,
            h.realtime_device_id,
            h.receipt_timestamp,
            h.ref_device_id,
            h.server_response_time,
            h.rooted,
            h.scanner_status,
            h.tag,
            h.threshold_version,
            h.total_confirmed,
            h.total_registered,
            h.total_sent,
            h.total_storage,
            h.used_storage,
            row_number() OVER (PARTITION BY h.tag ORDER BY h.receipt_timestamp DESC) AS pos
           FROM biocapture_test.heart_beat h
          WHERE ((date_part('month'::text, h.receipt_timestamp) = date_part('month'::text, sysdate)) AND (date_part('year'::text, h.receipt_timestamp) = date_part('year'::text, sysdate)) AND (trunc(h.receipt_timestamp) <> trunc(sysdate)))) __unnamed_subquery_0
  WHERE (__unnamed_subquery_0.pos = 1)
  GROUP BY __unnamed_subquery_0.tag, __unnamed_subquery_0.mac_address, __unnamed_subquery_0.ref_device_id
  ORDER BY (max(__unnamed_subquery_0.receipt_timestamp)), __unnamed_subquery_0.tag DESC;


ALTER TABLE biocapture_test.heartbeat_current_month OWNER TO enterprisedb;

--
-- TOC entry 458 (class 1259 OID 43240)
-- Name: heartbeat_device_deploy_state; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.heartbeat_device_deploy_state AS
 SELECT __unnamed_subquery_0.deploy_state,
    __unnamed_subquery_0.mac_address,
    __unnamed_subquery_0.tag
   FROM ( SELECT a.deploy_state,
            a.mac_address,
            a.tag,
            a.maxx,
            row_number() OVER (PARTITION BY a.mac_address ORDER BY a.maxx DESC) AS post
           FROM ( SELECT DISTINCT heart_beat.deploy_state,
                    heart_beat.mac_address,
                    heart_beat.tag,
                    to_char(max(heart_beat.receipt_timestamp), 'yyyy-mm-dd hh24:mi:ss'::character varying) AS maxx
                   FROM biocapture_test.heart_beat
                  GROUP BY heart_beat.deploy_state, heart_beat.mac_address, heart_beat.tag) a) __unnamed_subquery_0
  WHERE (__unnamed_subquery_0.post = 1);


ALTER TABLE biocapture_test.heartbeat_device_deploy_state OWNER TO enterprisedb;

--
-- TOC entry 459 (class 1259 OID 43245)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE SEQUENCE biocapture_test.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biocapture_test.hibernate_sequence OWNER TO enterprisedb;

--
-- TOC entry 642 (class 1259 OID 65821)
-- Name: infraction; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.infraction (
    pk integer,
    name text,
    eyeballingfk integer,
    description text
);


ALTER TABLE biocapture_test.infraction OWNER TO enterprisedb;

--
-- TOC entry 460 (class 1259 OID 43247)
-- Name: issue_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.issue_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    issue_id character varying(255),
    issue_type_enum character varying(255),
    resolution_date timestamp without time zone,
    resolution_message character varying(255),
    sla_status character varying(255),
    status_enum character varying(255),
    approved_by_km_user_fk bigint,
    issue_summary_fk bigint,
    km_user_fk bigint,
    kyc_dealer_fk bigint,
    node_fk bigint,
    issuestatus character varying(400)
);


ALTER TABLE biocapture_test.issue_log OWNER TO enterprisedb;

--
-- TOC entry 461 (class 1259 OID 43253)
-- Name: issue_log_attachment; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.issue_log_attachment (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    attachment_type_enum character varying(255) NOT NULL,
    file_data_ oid NOT NULL,
    file_name character varying(255) NOT NULL,
    issue_log_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.issue_log_attachment OWNER TO enterprisedb;

--
-- TOC entry 626 (class 1259 OID 49368)
-- Name: issue_log_temp; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.issue_log_temp (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    issue_id character varying(255),
    issue_type_enum character varying(255),
    resolution_date timestamp without time zone,
    resolution_message character varying(255),
    sla_status character varying(255),
    status_enum character varying(255),
    approved_by_km_user_fk bigint,
    issue_summary_fk bigint,
    km_user_fk bigint,
    kyc_dealer_fk bigint,
    node_fk bigint,
    issuestatus character varying(400)
);


ALTER TABLE biocapture_test.issue_log_temp OWNER TO enterprisedb;

--
-- TOC entry 462 (class 1259 OID 43259)
-- Name: issue_summary; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.issue_summary (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    issue_category_enum character varying(255),
    issue_type_enum character varying(255),
    kit_issue_enum character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.issue_summary OWNER TO enterprisedb;

--
-- TOC entry 463 (class 1259 OID 43265)
-- Name: kit_mapping_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kit_mapping_approval (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_status character varying(255),
    feedback character varying(255) NOT NULL,
    approved_by bigint NOT NULL,
    node_assignment_history_fk bigint,
    workflow_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.kit_mapping_approval OWNER TO enterprisedb;

--
-- TOC entry 464 (class 1259 OID 43271)
-- Name: kit_marker; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kit_marker (
    id bigint NOT NULL,
    app_version real,
    date_added timestamp without time zone,
    device_id character varying(255),
    mac_address character varying(255),
    tag_id character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.kit_marker OWNER TO enterprisedb;

--
-- TOC entry 465 (class 1259 OID 43277)
-- Name: kit_retrieval_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kit_retrieval_history (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    other_feedback character varying(255),
    assigned_user bigint,
    kit_retrieval_reason_fk bigint,
    node_fk bigint,
    performed_by bigint
);


ALTER TABLE biocapture_test.kit_retrieval_history OWNER TO enterprisedb;

--
-- TOC entry 466 (class 1259 OID 43280)
-- Name: kit_retrieval_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kit_retrieval_reason (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    code character varying(255),
    reason character varying(255)
);


ALTER TABLE biocapture_test.kit_retrieval_reason OWNER TO enterprisedb;

--
-- TOC entry 467 (class 1259 OID 43286)
-- Name: kit_sync_mode; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kit_sync_mode (
    id bigint NOT NULL,
    device_id character varying(255) NOT NULL,
    sync_mode character varying(255)
);


ALTER TABLE biocapture_test.kit_sync_mode OWNER TO enterprisedb;

--
-- TOC entry 468 (class 1259 OID 43292)
-- Name: kit_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kit_type (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.kit_type OWNER TO enterprisedb;

--
-- TOC entry 469 (class 1259 OID 43298)
-- Name: km_privilege; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_privilege (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    name character varying(255),
    privilege character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.km_privilege OWNER TO enterprisedb;

--
-- TOC entry 470 (class 1259 OID 43304)
-- Name: km_role; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_role (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    is_admin boolean,
    code character varying(255),
    created_by bigint,
    description character varying(255),
    role character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.km_role OWNER TO enterprisedb;

--
-- TOC entry 471 (class 1259 OID 43310)
-- Name: km_role_community_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_role_community_mapper (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    community_fk bigint NOT NULL,
    km_role_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.km_role_community_mapper OWNER TO enterprisedb;

--
-- TOC entry 472 (class 1259 OID 43313)
-- Name: km_role_division; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_role_division (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    dealer_division_fk bigint NOT NULL,
    role_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.km_role_division OWNER TO enterprisedb;

--
-- TOC entry 473 (class 1259 OID 43316)
-- Name: km_role_privilege; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_role_privilege (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    privilege_fk bigint NOT NULL,
    role_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.km_role_privilege OWNER TO enterprisedb;

--
-- TOC entry 474 (class 1259 OID 43319)
-- Name: user_role; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.user_role (
    user_fk bigint NOT NULL,
    role_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.user_role OWNER TO enterprisedb;

--
-- TOC entry 475 (class 1259 OID 43322)
-- Name: km_role_view; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.km_role_view AS
 SELECT ur.user_fk,
    listagg(upper(replace((km.role)::text, '_'::text, ' '::text)), ', '::text ORDER BY ur.user_fk) AS role
   FROM biocapture_test.km_role km,
    biocapture_test.user_role ur
  WHERE (ur.role_fk = km.pk)
  GROUP BY ur.user_fk;


ALTER TABLE biocapture_test.km_role_view OWNER TO enterprisedb;

--
-- TOC entry 476 (class 1259 OID 43326)
-- Name: km_role_workflow_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_role_workflow_mapper (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    km_role_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.km_role_workflow_mapper OWNER TO enterprisedb;

--
-- TOC entry 477 (class 1259 OID 43329)
-- Name: km_user_dealer_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_user_dealer_mapper (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    kyc_dealer_fk bigint NOT NULL,
    km_user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.km_user_dealer_mapper OWNER TO enterprisedb;

--
-- TOC entry 478 (class 1259 OID 43332)
-- Name: km_user_history_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_user_history_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approved_by character varying(255),
    feedback_message character varying(255),
    operation_performed character varying(255),
    reason character varying(255),
    user_act_deact_reason_fk bigint,
    km_user_fk bigint NOT NULL,
    performed_by bigint NOT NULL
);


ALTER TABLE biocapture_test.km_user_history_ OWNER TO enterprisedb;

--
-- TOC entry 479 (class 1259 OID 43338)
-- Name: km_user_region_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_user_region_mapper (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    region_fk bigint NOT NULL,
    km_user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.km_user_region_mapper OWNER TO enterprisedb;

--
-- TOC entry 480 (class 1259 OID 43341)
-- Name: km_user_vtu; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.km_user_vtu (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    vtu_number character varying(255) NOT NULL,
    vtu_request_fk bigint NOT NULL,
    user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.km_user_vtu OWNER TO enterprisedb;

--
-- TOC entry 481 (class 1259 OID 43344)
-- Name: kyc_agility_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kyc_agility_mapper (
    id character varying(255) NOT NULL,
    agility_status boolean,
    agility_timestamp timestamp without time zone,
    confirmation_status boolean,
    init_timestamp timestamp without time zone,
    owc_status boolean,
    owc_timestamp timestamp without time zone,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.kyc_agility_mapper OWNER TO enterprisedb;

--
-- TOC entry 482 (class 1259 OID 43347)
-- Name: kyc_blacklist; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kyc_blacklist (
    pk character varying(255) NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    blacklisted_item character varying(255),
    item_type character varying(255) NOT NULL,
    mac_address character varying(255),
    revoked boolean,
    enrollment_ref bigint
);


ALTER TABLE biocapture_test.kyc_blacklist OWNER TO enterprisedb;

--
-- TOC entry 483 (class 1259 OID 43353)
-- Name: kyc_broadcast; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.kyc_broadcast (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    is_expired boolean NOT NULL,
    is_global boolean NOT NULL,
    message character varying(2048) NOT NULL,
    created_by bigint,
    node_fk bigint,
    user_fk bigint
);


ALTER TABLE biocapture_test.kyc_broadcast OWNER TO enterprisedb;

--
-- TOC entry 484 (class 1259 OID 43359)
-- Name: license; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.license (
    id bigint NOT NULL,
    application_license text,
    kit_approved boolean,
    disapproval_description character varying(255),
    face_license text,
    finger_license text,
    last_updated timestamp without time zone,
    mac_address character varying(32) NOT NULL,
    misc_license1 text,
    misc_license2 text,
    receipt_timestamp timestamp without time zone NOT NULL,
    request_status character varying(255),
    revoked boolean,
    update_description character varying(512),
    upload_timestamp timestamp without time zone,
    wsq_license text,
    approved_by bigint
);


ALTER TABLE biocapture_test.license OWNER TO enterprisedb;

--
-- TOC entry 485 (class 1259 OID 43365)
-- Name: log_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.log_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    type_ character varying(255),
    msg_ character varying(255),
    status_ character varying(255),
    val_ character varying(255),
    vlog_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.log_ OWNER TO enterprisedb;

--
-- TOC entry 486 (class 1259 OID 43371)
-- Name: masterlist; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.masterlist AS
 SELECT row_number() OVER (ORDER BY n.id) AS id,
    e.code AS tag,
    n.mac_address,
    nm.name AS dealer,
    ( SELECT ku.surname
           FROM biocapture_test.km_user ku,
            biocapture_test.km_role kr,
            biocapture_test.user_role ur
          WHERE ((ur.role_fk = kr.pk) AND (ur.user_fk = ku.pk) AND (ku.pk = na.fsa_user_fk) AND ((kr.role)::text = 'FSA'::text))) AS fsa,
    ( SELECT ku.surname
           FROM biocapture_test.km_user ku,
            biocapture_test.km_role kr,
            biocapture_test.user_role ur
          WHERE ((ur.role_fk = kr.pk) AND (ur.user_fk = ku.pk) AND (ku.pk = na.dm_user_fk) AND ((kr.role)::text = 'KDM'::text))) AS district_manager,
    z.name AS zone,
    s.name AS state,
    vt.name AS vendor_type,
    ds.name AS status,
    n.deployment_category,
    'SMART CLIENT'::text AS client_type,
    nt.type AS tag_type,
    n.machine_serial_number AS machine_serial,
    n.purchase_year,
    ( SELECT count(DISTINCT km_user.mobile) AS tot
           FROM biocapture_test.km_user,
            biocapture_test.km_role,
            biocapture_test.user_role
          WHERE ((user_role.role_fk = km_role.pk) AND (user_role.user_fk = km_user.pk) AND (km_user.pk = na.fsa_user_fk) AND (upper((km_role.role)::text) = 'AGENT'::text) AND ((km_role.active)::smallint = 1))) AS number_of_agents,
    1 AS active,
    n.machine_model,
    n.last_sync_time,
    nm.deal_code,
    r.name AS region,
    n.last_installed_update,
    n.active AS kitappversion
   FROM ((((((((biocapture_test.node n
     LEFT JOIN biocapture_test.node_assignment na ON ((na.node_fk = n.id)))
     LEFT JOIN biocapture_test.kyc_dealer nm ON ((na.kyc_dealer_fk = nm.pk)))
     LEFT JOIN biocapture_test.device_status ds ON ((ds.id = n.device_status_fk)))
     LEFT JOIN biocapture_test.state s ON ((na.state_fk = s.id)))
     LEFT JOIN biocapture_test.zone z ON ((na.zone_fk = z.id)))
     LEFT JOIN biocapture_test.region r ON ((r.id = s.region_fk)))
     LEFT JOIN biocapture_test.dealer_type vt ON ((nm.dealer_type_fk = vt.pk)))
     LEFT JOIN biocapture_test.kit_type nt ON ((nt.pk = n.kit_type_fk))),
    biocapture_test.enrollment_ref e
  WHERE ((n.mac_address)::text = (e.mac_address)::text);


ALTER TABLE biocapture_test.masterlist OWNER TO enterprisedb;

--
-- TOC entry 487 (class 1259 OID 43376)
-- Name: meta_data; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.meta_data (
    id bigint NOT NULL,
    agent_mobile character varying(255),
    app_version character varying(255),
    capture_machine_id character varying(255),
    confirmation_timestamp timestamp without time zone,
    latitude double precision,
    location_accuracy double precision,
    longitude double precision,
    mocked_coordinate boolean,
    realtime_device_id character varying(255),
    registration_network_status character varying(255),
    state_of_registration character varying(255),
    sync_timestamp timestamp without time zone NOT NULL,
    within_geofence boolean,
    basic_data_fk bigint NOT NULL,
    enrollment_ref_fk bigint
);


ALTER TABLE biocapture_test.meta_data OWNER TO enterprisedb;

--
-- TOC entry 488 (class 1259 OID 43382)
-- Name: msisdn_detail; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.msisdn_detail (
    id bigint NOT NULL,
    activation_status boolean,
    activation_timestamp timestamp without time zone,
    msisdn character varying(255) NOT NULL,
    msdidn_part_key timestamp without time zone,
    new_subscriber boolean NOT NULL,
    serial character varying(255) NOT NULL,
    subscriber_type character varying(255) NOT NULL,
    yellow_account_enabled boolean,
    yellow_account_types character varying(255),
    zap boolean NOT NULL,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.msisdn_detail OWNER TO enterprisedb;

--
-- TOC entry 489 (class 1259 OID 43388)
-- Name: msisdn_provision_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.msisdn_provision_status (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    imsi character varying(255),
    msisdn character varying(255),
    sim_serial character varying(255),
    status character varying(255),
    status_reason character varying(255)
);


ALTER TABLE biocapture_test.msisdn_provision_status OWNER TO enterprisedb;

--
-- TOC entry 490 (class 1259 OID 43394)
-- Name: msisdn_provision_status_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.msisdn_provision_status_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    imsi character varying(255),
    msisdn character varying(255),
    operaion_channel character varying(255),
    operation_name character varying(255),
    sim_serial character varying(255),
    status character varying(255),
    status_reason character varying(255),
    msisdn_provision_status_fk bigint
);


ALTER TABLE biocapture_test.msisdn_provision_status_log OWNER TO enterprisedb;

--
-- TOC entry 636 (class 1259 OID 65775)
-- Name: msisdn_pushed; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.msisdn_pushed (
    "?column?" bigint
);


ALTER TABLE biocapture_test.msisdn_pushed OWNER TO enterprisedb;

--
-- TOC entry 491 (class 1259 OID 43400)
-- Name: msisdn_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.msisdn_status (
    id bigint NOT NULL,
    crm_bio_timestamp_ timestamp without time zone,
    is_crm_bio_ boolean,
    demo_ character varying(255),
    left_index_finger_ character varying(255),
    left_little_finger_ character varying(255),
    left_middle_finger_ character varying(255),
    left_ring_finger_ character varying(255),
    left_thumb_finger_ character varying(255),
    missing_left_hand_ character varying(255),
    missing_right_hand_ character varying(255),
    mode_of_identification_ character varying(255),
    passport_ character varying(255),
    portrait_data_ character varying(255),
    reg_form_ character varying(255),
    right_index_finger_ character varying(255),
    right_little_finger_ character varying(255),
    right_middle_finger_ character varying(255),
    right_ring_finger_ character varying(255),
    right_thumb_finger_ character varying(255),
    unique_id character varying(255),
    msisdn_detail_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.msisdn_status OWNER TO enterprisedb;

--
-- TOC entry 492 (class 1259 OID 43406)
-- Name: msisdn_status_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.msisdn_status_log (
    id bigint NOT NULL,
    final_timestamp bytea,
    init_timestamp bytea NOT NULL,
    remarks character varying(1024),
    status_type character varying(255) NOT NULL,
    msisdn_status_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.msisdn_status_log OWNER TO enterprisedb;

--
-- TOC entry 493 (class 1259 OID 43412)
-- Name: passport; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.passport (
    id bigint NOT NULL,
    face_count integer,
    passport_data oid,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.passport OWNER TO enterprisedb;

--
-- TOC entry 494 (class 1259 OID 43415)
-- Name: passport_detail; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.passport_detail (
    id bigint NOT NULL,
    expiry_date timestamp without time zone NOT NULL,
    issue_country character varying(255) NOT NULL,
    passport_number character varying(255) NOT NULL,
    residency_status boolean,
    signature_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.passport_detail OWNER TO enterprisedb;

--
-- TOC entry 495 (class 1259 OID 43421)
-- Name: signature; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.signature (
    id bigint NOT NULL,
    signature_data oid,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.signature OWNER TO enterprisedb;

--
-- TOC entry 496 (class 1259 OID 43424)
-- Name: ncc_records; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.ncc_records AS
 SELECT __unnamed_subquery_0.t,
    __unnamed_subquery_0.firstname,
    __unnamed_subquery_0.othername,
    __unnamed_subquery_0.surname,
    __unnamed_subquery_0.birthday,
    __unnamed_subquery_0.gender,
    __unnamed_subquery_0.nationality,
    __unnamed_subquery_0.stateoforigin,
    __unnamed_subquery_0.occupation,
    __unnamed_subquery_0.subscribertype,
    __unnamed_subquery_0.registrationlga,
    __unnamed_subquery_0.residentialaddress,
    __unnamed_subquery_0.residentialaddresslga,
    __unnamed_subquery_0.residentialaddressstate,
    __unnamed_subquery_0.email,
    __unnamed_subquery_0.registrationtype,
    __unnamed_subquery_0.companyid,
    __unnamed_subquery_0.companyname,
    __unnamed_subquery_0.resident,
    __unnamed_subquery_0.postalcode,
    __unnamed_subquery_0.companyaddress,
    __unnamed_subquery_0.companyaddresslga,
    __unnamed_subquery_0.companyaddressstate,
    __unnamed_subquery_0.companyaddresspostalcode,
    __unnamed_subquery_0.basicdataid,
    __unnamed_subquery_0.phone_number,
    __unnamed_subquery_0.unique_id,
    __unnamed_subquery_0.expiry_date,
    __unnamed_subquery_0.coutryissuedcode,
    __unnamed_subquery_0.passport_number,
    __unnamed_subquery_0.mothersmaidenname,
    __unnamed_subquery_0.registration_date,
    __unnamed_subquery_0.state_of_registration,
    __unnamed_subquery_0.passport_data
   FROM ( SELECT rank() OVER (PARTITION BY s_.phone_number ORDER BY s_.receipt_timestamp DESC) AS t,
            b.firstname,
            b.othername,
            b.surname,
            b.birthday,
            b.gender,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((d.dda19)::text))) AS nationality,
            d.da8 AS stateoforigin,
            d.da2 AS occupation,
            d.dda11 AS subscribertype,
            d.dda9 AS registrationlga,
            d.da3 AS residentialaddress,
            d.dda6 AS residentialaddresslga,
            d.dda5 AS residentialaddressstate,
            d.da6 AS email,
            d.da18 AS registrationtype,
            d.dda14 AS companyid,
            d.dda8 AS companyname,
            d.dda4 AS resident,
            d.dda7 AS postalcode,
            d.dda15 AS companyaddress,
            d.dda17 AS companyaddresslga,
            d.dda16 AS companyaddressstate,
            d.dda18 AS companyaddresspostalcode,
            b.id AS basicdataid,
            s_.phone_number,
            u.unique_id,
            pd.expiry_date,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((pd.issue_country)::text))) AS coutryissuedcode,
            pd.passport_number,
            d.dda12 AS mothersmaidenname,
            s_.receipt_timestamp AS registration_date,
            t.code AS state_of_registration,
            p.passport_data
           FROM ((biocapture_test.basic_data b
             LEFT JOIN biocapture_test.signature s ON ((s.basic_data_fk = b.id)))
             LEFT JOIN biocapture_test.passport_detail pd ON ((pd.signature_fk = s.id))),
            biocapture_test.sms_activation_request s_,
            biocapture_test.user_id u,
            biocapture_test.dynamic_data d,
            biocapture_test.state t,
            biocapture_test.passport p
          WHERE (((s_.unique_id)::text = (u.unique_id)::text) AND (u.id = b.user_id_fk) AND (b.id = d.basic_data_fk) AND (t.id = b.state_of_registration_fk) AND (b.id = p.basic_data_fk))) __unnamed_subquery_0
  WHERE (__unnamed_subquery_0.t = 1);


ALTER TABLE biocapture_test.ncc_records OWNER TO enterprisedb;

--
-- TOC entry 497 (class 1259 OID 43429)
-- Name: ncc_records_android; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.ncc_records_android AS
 SELECT __unnamed_subquery_0.t,
    __unnamed_subquery_0.firstname,
    __unnamed_subquery_0.othername,
    __unnamed_subquery_0.surname,
    __unnamed_subquery_0.birthday,
    __unnamed_subquery_0.gender,
    __unnamed_subquery_0.nationality,
    __unnamed_subquery_0.stateoforigin,
    __unnamed_subquery_0.occupation,
    __unnamed_subquery_0.subscribertype,
    __unnamed_subquery_0.registrationlga,
    __unnamed_subquery_0.residentialaddress,
    __unnamed_subquery_0.residentialaddresslga,
    __unnamed_subquery_0.residentialaddressstate,
    __unnamed_subquery_0.email,
    __unnamed_subquery_0.registrationtype,
    __unnamed_subquery_0.companyid,
    __unnamed_subquery_0.companyname,
    __unnamed_subquery_0.resident,
    __unnamed_subquery_0.postalcode,
    __unnamed_subquery_0.companyaddress,
    __unnamed_subquery_0.companyaddresslga,
    __unnamed_subquery_0.companyaddressstate,
    __unnamed_subquery_0.companyaddresspostalcode,
    __unnamed_subquery_0.basicdataid,
    __unnamed_subquery_0.phone_number,
    __unnamed_subquery_0.unique_id,
    __unnamed_subquery_0.expiry_date,
    __unnamed_subquery_0.coutryissuedcode,
    __unnamed_subquery_0.passport_number,
    __unnamed_subquery_0.mothersmaidenname,
    __unnamed_subquery_0.registration_date,
    __unnamed_subquery_0.state_of_registration,
    __unnamed_subquery_0.passport_data
   FROM ( SELECT rank() OVER (PARTITION BY s_.phone_number ORDER BY s_.receipt_timestamp DESC) AS t,
            b.firstname,
            b.othername,
            b.surname,
            b.birthday,
            b.gender,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((d.dda19)::text))) AS nationality,
            d.da8 AS stateoforigin,
            d.da2 AS occupation,
            d.dda11 AS subscribertype,
            d.dda9 AS registrationlga,
            d.da3 AS residentialaddress,
            d.dda6 AS residentialaddresslga,
            d.dda5 AS residentialaddressstate,
            d.da6 AS email,
            d.da18 AS registrationtype,
            d.dda14 AS companyid,
            d.dda8 AS companyname,
            d.dda4 AS resident,
            d.dda7 AS postalcode,
            d.dda15 AS companyaddress,
            d.dda17 AS companyaddresslga,
            d.dda16 AS companyaddressstate,
            d.dda18 AS companyaddresspostalcode,
            b.id AS basicdataid,
            s_.phone_number,
            u.unique_id,
            pd.expiry_date,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((pd.issue_country)::text))) AS coutryissuedcode,
            pd.passport_number,
            d.dda12 AS mothersmaidenname,
            s_.receipt_timestamp AS registration_date,
            t.code AS state_of_registration,
            p.passport_data
           FROM ((biocapture_test.basic_data b
             LEFT JOIN biocapture_test.signature s ON ((s.basic_data_fk = b.id)))
             LEFT JOIN biocapture_test.passport_detail pd ON ((pd.signature_fk = s.id))),
            biocapture_test.sms_activation_request s_,
            biocapture_test.user_id u,
            biocapture_test.dynamic_data d,
            biocapture_test.state t,
            biocapture_test.passport p
          WHERE (((s_.unique_id)::text = (u.unique_id)::text) AND (u.id = b.user_id_fk) AND ((s_.enrollment_ref)::text ~~ 'DROID%'::text) AND (b.id = d.basic_data_fk) AND (t.id = b.state_of_registration_fk) AND (b.id = p.basic_data_fk))) __unnamed_subquery_0
  WHERE (__unnamed_subquery_0.t = 1);


ALTER TABLE biocapture_test.ncc_records_android OWNER TO enterprisedb;

--
-- TOC entry 498 (class 1259 OID 43434)
-- Name: ncc_records_android2; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.ncc_records_android2 AS
 SELECT __unnamed_subquery_0.t,
    __unnamed_subquery_0.firstname,
    __unnamed_subquery_0.othername,
    __unnamed_subquery_0.surname,
    __unnamed_subquery_0.birthday,
    __unnamed_subquery_0.gender,
    __unnamed_subquery_0.nationality,
    __unnamed_subquery_0.stateoforigin,
    __unnamed_subquery_0.occupation,
    __unnamed_subquery_0.subscribertype,
    __unnamed_subquery_0.registrationlga,
    __unnamed_subquery_0.residentialaddress,
    __unnamed_subquery_0.residentialaddresslga,
    __unnamed_subquery_0.residentialaddressstate,
    __unnamed_subquery_0.email,
    __unnamed_subquery_0.registrationtype,
    __unnamed_subquery_0.companyid,
    __unnamed_subquery_0.companyname,
    __unnamed_subquery_0.resident,
    __unnamed_subquery_0.postalcode,
    __unnamed_subquery_0.companyaddress,
    __unnamed_subquery_0.companyaddresslga,
    __unnamed_subquery_0.companyaddressstate,
    __unnamed_subquery_0.companyaddresspostalcode,
    __unnamed_subquery_0.basicdataid,
    __unnamed_subquery_0.phone_number,
    __unnamed_subquery_0.unique_id,
    __unnamed_subquery_0.expiry_date,
    __unnamed_subquery_0.coutryissuedcode,
    __unnamed_subquery_0.passport_number,
    __unnamed_subquery_0.mothersmaidenname,
    __unnamed_subquery_0.registration_date,
    __unnamed_subquery_0.state_of_registration
   FROM ( SELECT rank() OVER (PARTITION BY s_.phone_number ORDER BY s_.receipt_timestamp DESC) AS t,
            b.firstname,
            b.othername,
            b.surname,
            b.birthday,
            b.gender,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((d.dda19)::text))) AS nationality,
            d.da8 AS stateoforigin,
            d.da2 AS occupation,
            d.dda11 AS subscribertype,
            d.dda9 AS registrationlga,
            d.da3 AS residentialaddress,
            d.dda6 AS residentialaddresslga,
            d.dda5 AS residentialaddressstate,
            d.da6 AS email,
            d.da18 AS registrationtype,
            d.dda14 AS companyid,
            d.dda8 AS companyname,
            d.dda4 AS resident,
            d.dda7 AS postalcode,
            d.dda15 AS companyaddress,
            d.dda17 AS companyaddresslga,
            d.dda16 AS companyaddressstate,
            d.dda18 AS companyaddresspostalcode,
            b.id AS basicdataid,
            s_.phone_number,
            u.unique_id,
            pd.expiry_date,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((pd.issue_country)::text))) AS coutryissuedcode,
            pd.passport_number,
            d.dda12 AS mothersmaidenname,
            s_.receipt_timestamp AS registration_date,
            t.code AS state_of_registration
           FROM ((biocapture_test.basic_data b
             LEFT JOIN biocapture_test.signature s ON ((s.basic_data_fk = b.id)))
             LEFT JOIN biocapture_test.passport_detail pd ON ((pd.signature_fk = s.id))),
            biocapture_test.sms_activation_request s_,
            biocapture_test.user_id u,
            biocapture_test.dynamic_data d,
            biocapture_test.state t
          WHERE (((s_.unique_id)::text = (u.unique_id)::text) AND (u.id = b.user_id_fk) AND ((s_.enrollment_ref)::text ~~ 'DROID%'::text) AND (b.id = d.basic_data_fk) AND (t.id = b.state_of_registration_fk))) __unnamed_subquery_0
  WHERE (__unnamed_subquery_0.t = 1);


ALTER TABLE biocapture_test.ncc_records_android2 OWNER TO enterprisedb;

--
-- TOC entry 499 (class 1259 OID 43439)
-- Name: ncc_records_no_passport; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.ncc_records_no_passport AS
 SELECT __unnamed_subquery_0.t,
    __unnamed_subquery_0.firstname,
    __unnamed_subquery_0.othername,
    __unnamed_subquery_0.surname,
    __unnamed_subquery_0.birthday,
    __unnamed_subquery_0.gender,
    __unnamed_subquery_0.nationality,
    __unnamed_subquery_0.stateoforigin,
    __unnamed_subquery_0.occupation,
    __unnamed_subquery_0.subscribertype,
    __unnamed_subquery_0.registrationlga,
    __unnamed_subquery_0.residentialaddress,
    __unnamed_subquery_0.residentialaddresslga,
    __unnamed_subquery_0.residentialaddressstate,
    __unnamed_subquery_0.email,
    __unnamed_subquery_0.registrationtype,
    __unnamed_subquery_0.companyid,
    __unnamed_subquery_0.companyname,
    __unnamed_subquery_0.resident,
    __unnamed_subquery_0.postalcode,
    __unnamed_subquery_0.companyaddress,
    __unnamed_subquery_0.companyaddresslga,
    __unnamed_subquery_0.companyaddressstate,
    __unnamed_subquery_0.companyaddresspostalcode,
    __unnamed_subquery_0.basicdataid,
    __unnamed_subquery_0.phone_number,
    __unnamed_subquery_0.unique_id,
    __unnamed_subquery_0.expiry_date,
    __unnamed_subquery_0.coutryissuedcode,
    __unnamed_subquery_0.passport_number,
    __unnamed_subquery_0.mothersmaidenname,
    __unnamed_subquery_0.registration_date,
    __unnamed_subquery_0.state_of_registration
   FROM ( SELECT rank() OVER (PARTITION BY s_.phone_number ORDER BY s_.receipt_timestamp DESC) AS t,
            b.firstname,
            b.othername,
            b.surname,
            b.birthday,
            b.gender,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((d.dda19)::text))) AS nationality,
            d.da8 AS stateoforigin,
            d.da2 AS occupation,
            d.dda11 AS subscribertype,
            d.dda9 AS registrationlga,
            d.da3 AS residentialaddress,
            d.dda6 AS residentialaddresslga,
            d.dda5 AS residentialaddressstate,
            d.da6 AS email,
            d.da18 AS registrationtype,
            d.dda14 AS companyid,
            d.dda8 AS companyname,
            d.dda4 AS resident,
            d.dda7 AS postalcode,
            d.dda15 AS companyaddress,
            d.dda17 AS companyaddresslga,
            d.dda16 AS companyaddressstate,
            d.dda18 AS companyaddresspostalcode,
            b.id AS basicdataid,
            s_.phone_number,
            u.unique_id,
            pd.expiry_date,
            ( SELECT country.code
                   FROM biocapture_test.country
                  WHERE (upper((country.name)::text) = upper((pd.issue_country)::text))) AS coutryissuedcode,
            pd.passport_number,
            d.dda12 AS mothersmaidenname,
            s_.receipt_timestamp AS registration_date,
            t.code AS state_of_registration
           FROM ((biocapture_test.basic_data b
             LEFT JOIN biocapture_test.signature s ON ((s.basic_data_fk = b.id)))
             LEFT JOIN biocapture_test.passport_detail pd ON ((pd.signature_fk = s.id))),
            biocapture_test.sms_activation_request s_,
            biocapture_test.user_id u,
            biocapture_test.dynamic_data d,
            biocapture_test.state t
          WHERE (((s_.unique_id)::text = (u.unique_id)::text) AND (u.id = b.user_id_fk) AND (b.id = d.basic_data_fk) AND (t.id = b.state_of_registration_fk))) __unnamed_subquery_0
  WHERE (__unnamed_subquery_0.t = 1);


ALTER TABLE biocapture_test.ncc_records_no_passport OWNER TO enterprisedb;

--
-- TOC entry 635 (class 1259 OID 65767)
-- Name: new_kd_2; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.new_kd_2 (
    sn bigint,
    device_id text,
    channel text,
    partner_name text,
    code text,
    state text,
    address text,
    phone_number text,
    email text
);


ALTER TABLE biocapture_test.new_kd_2 OWNER TO enterprisedb;

--
-- TOC entry 641 (class 1259 OID 65800)
-- Name: new_kd_3; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.new_kd_3 (
    sn bigint,
    device_id text,
    channel text,
    partner_name text,
    code text,
    state text,
    address text,
    phone_number text,
    email text
);


ALTER TABLE biocapture_test.new_kd_3 OWNER TO enterprisedb;

--
-- TOC entry 648 (class 1259 OID 65873)
-- Name: new_kd_4; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.new_kd_4 (
    sn integer NOT NULL,
    device_id character varying(2000),
    channel character varying(2000),
    partner_name character varying(2000),
    code character varying(2000),
    state character varying(2000),
    address character varying(2000),
    phone_number bigint,
    email character varying(2000)
);


ALTER TABLE biocapture_test.new_kd_4 OWNER TO enterprisedb;

--
-- TOC entry 649 (class 1259 OID 65881)
-- Name: new_kd_5; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.new_kd_5 (
    sn integer NOT NULL,
    state character varying(2000) NOT NULL,
    partner_name character varying(2000) NOT NULL,
    code character varying(2000) NOT NULL,
    address character varying(2000) NOT NULL,
    phone_number bigint NOT NULL,
    device_id character varying(2000) NOT NULL,
    email character varying(2000) NOT NULL,
    channel character varying(2000) NOT NULL
);


ALTER TABLE biocapture_test.new_kd_5 OWNER TO enterprisedb;

--
-- TOC entry 650 (class 1259 OID 65894)
-- Name: new_kd_6; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.new_kd_6 (
    sn bigint NOT NULL,
    state character varying(2000) NOT NULL,
    partner_name character varying(2000) NOT NULL,
    code character varying(2000) NOT NULL,
    address character varying(2000) NOT NULL,
    phone_number character varying(2000) NOT NULL,
    device_id character varying(2000) NOT NULL,
    email character varying(2000) NOT NULL
);


ALTER TABLE biocapture_test.new_kd_6 OWNER TO enterprisedb;

--
-- TOC entry 500 (class 1259 OID 43444)
-- Name: nin_enrollment_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.nin_enrollment_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    enrollment_status character varying(255),
    error_description character varying(255),
    transaction_id character varying(255),
    unique_id character varying(255)
);


ALTER TABLE biocapture_test.nin_enrollment_log OWNER TO enterprisedb;

--
-- TOC entry 501 (class 1259 OID 43450)
-- Name: node_assignment_bkup; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.node_assignment_bkup (
    pk bigint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    area_fk bigint,
    kyc_dealer_fk bigint,
    state_fk bigint,
    zone_fk bigint,
    dm_user_fk bigint,
    fsa_user_fk bigint,
    lga_fk bigint,
    outlet_fk bigint,
    node_fk bigint,
    territory_fk bigint
);


ALTER TABLE biocapture_test.node_assignment_bkup OWNER TO enterprisedb;

--
-- TOC entry 502 (class 1259 OID 43453)
-- Name: node_assignment_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.node_assignment_history (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    assigned_agent_status character varying(255),
    approval_date timestamp without time zone,
    approval_status_enum character varying(255),
    rejection_reason character varying(255),
    approved_by_km_user_fk bigint,
    area_fk bigint,
    field_support_agent_km_user_fk bigint,
    node_assignment_fk bigint,
    outlet_fk bigint,
    territory_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.node_assignment_history OWNER TO enterprisedb;

--
-- TOC entry 627 (class 1259 OID 49374)
-- Name: node_bkup; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.node_bkup (
    id bigint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    aware_liveness_version integer,
    blacklist_date timestamp without time zone,
    black_listed boolean,
    commissioned boolean,
    is_corporate boolean,
    data_list_tag_name character varying(255),
    deployment_category character varying(255),
    geotracker_app_version real,
    geotracker_install_date timestamp without time zone,
    google_vision_version integer,
    image_clean_up_version integer,
    installation_timestamp timestamp without time zone,
    installed_by character varying(255),
    last_installed_update real,
    last_sync_time timestamp without time zone,
    last_updated timestamp without time zone,
    location character varying(255),
    mac_address character varying(255),
    machine_architecture character varying(255),
    machine_manufacturer character varying(255),
    machine_model character varying(255),
    machine_os character varying(255),
    machine_runtime_version character varying(255),
    machine_serial_number character varying(255),
    migrated boolean,
    network_card_name character varying(255),
    node_activity_status_enum character varying(255),
    passive_liveness_version integer,
    previous_tag_name character varying(255),
    remark character varying(255),
    sync_status character varying(255),
    purchase_year integer,
    device_owner bigint,
    device_status_fk bigint,
    device_type bigint,
    enrollment_ref bigint,
    kit_type_fk bigint
);


ALTER TABLE biocapture_test.node_bkup OWNER TO enterprisedb;

--
-- TOC entry 639 (class 1259 OID 65788)
-- Name: offline_pnp_31032020; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.offline_pnp_31032020 (
    basic_data_pk bigint,
    status text,
    mode_type character varying(255),
    passport_data bytea,
    receipt_timestamp timestamp without time zone
);


ALTER TABLE biocapture_test.offline_pnp_31032020 OWNER TO enterprisedb;

--
-- TOC entry 503 (class 1259 OID 43459)
-- Name: onboarding_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.onboarding_status (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    onboardtimestamp timestamp without time zone,
    onboarded_ boolean,
    onboarded_by_user_fk bigint,
    user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.onboarding_status OWNER TO enterprisedb;

--
-- TOC entry 504 (class 1259 OID 43462)
-- Name: otp_status_record; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.otp_status_record (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    expiration_time timestamp without time zone,
    msisdn character varying(255) NOT NULL,
    otp character varying(255) NOT NULL,
    otp_status_record_type_enum character varying(255),
    otp_used boolean,
    time_generated timestamp without time zone,
    time_used timestamp without time zone
);


ALTER TABLE biocapture_test.otp_status_record OWNER TO enterprisedb;

--
-- TOC entry 505 (class 1259 OID 43468)
-- Name: outlet_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.outlet_type (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.outlet_type OWNER TO enterprisedb;

--
-- TOC entry 506 (class 1259 OID 43474)
-- Name: page_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.page_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    external_url character varying(255),
    icon character varying(255),
    name character varying(255),
    page_enum character varying(255) NOT NULL,
    page_order integer,
    page_fk bigint,
    community_fk bigint NOT NULL,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.page_ OWNER TO enterprisedb;

--
-- TOC entry 507 (class 1259 OID 43480)
-- Name: password_history_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.password_history_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    password character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.password_history_log OWNER TO enterprisedb;

--
-- TOC entry 508 (class 1259 OID 43483)
-- Name: password_policy; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.password_policy (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    date_created timestamp without time zone,
    policy_description character varying(255),
    last_edited_by bigint,
    lockout_duration integer,
    lockout_enabled boolean,
    maximum_age integer,
    maximum_failure integer,
    minimum_age integer,
    minimum_length integer,
    minimum_lowercase integer,
    minimum_numbers integer,
    minimum_symbols integer,
    minimum_uppercase integer,
    policy_name character varying(255),
    password_expiration_enabled boolean,
    password_history_limit integer,
    policy_active boolean,
    policy_regex character varying(255),
    syntax_checking_enabled boolean,
    user_message character varying(128)
);


ALTER TABLE biocapture_test.password_policy OWNER TO enterprisedb;

--
-- TOC entry 509 (class 1259 OID 43489)
-- Name: phone_number_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.phone_number_status (
    id bigint NOT NULL,
    churn_timestamp timestamp without time zone,
    final_timestamp timestamp without time zone,
    init_timestamp timestamp without time zone NOT NULL,
    remarks character varying(255),
    status character varying(255) NOT NULL,
    tabsfilenumber bigint
);


ALTER TABLE biocapture_test.phone_number_status OWNER TO enterprisedb;

--
-- TOC entry 640 (class 1259 OID 65794)
-- Name: pnp_new_31032020; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.pnp_new_31032020 (
    id bigint,
    phone_number character varying(255),
    unique_id character varying(255),
    status text,
    mode_type character varying(255),
    passport_data bytea,
    receipt_timestamp timestamp without time zone
);


ALTER TABLE biocapture_test.pnp_new_31032020 OWNER TO enterprisedb;

--
-- TOC entry 625 (class 1259 OID 49360)
-- Name: process_del; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.process_del (
    pk bigint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    area_fk bigint,
    kyc_dealer_fk bigint,
    state_fk bigint,
    zone_fk bigint,
    dm_user_fk bigint,
    fsa_user_fk bigint,
    lga_fk bigint,
    outlet_fk bigint,
    node_fk bigint,
    territory_fk bigint
);


ALTER TABLE biocapture_test.process_del OWNER TO enterprisedb;

--
-- TOC entry 510 (class 1259 OID 43495)
-- Name: quarantined_owc_record; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.quarantined_owc_record (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    crm_type character varying(255),
    error_category character varying(255),
    error_message character varying(255),
    file_source character varying(255),
    msisdn character varying(255),
    owc_push_timestamp timestamp without time zone,
    push_status character varying(255),
    sim_serial character varying(255),
    sync_file_path character varying(255),
    unique_id character varying(255)
);


ALTER TABLE biocapture_test.quarantined_owc_record OWNER TO enterprisedb;

--
-- TOC entry 511 (class 1259 OID 43501)
-- Name: registration_signature; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.registration_signature (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    finger_type character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    wsq_data oid NOT NULL,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.registration_signature OWNER TO enterprisedb;

--
-- TOC entry 638 (class 1259 OID 65785)
-- Name: report_status_of_reg; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.report_status_of_reg (
    phone_number character varying(255),
    time_entered_into_db timestamp without time zone,
    time_pushed_to_mcentric timestamp without time zone
);


ALTER TABLE biocapture_test.report_status_of_reg OWNER TO enterprisedb;

--
-- TOC entry 512 (class 1259 OID 43507)
-- Name: retried_bfp_sync_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.retried_bfp_sync_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    agent_email_address character varying(255),
    bfpsyncstatusenum character varying(255),
    capture_mode character varying(255),
    device_id character varying(255),
    file_name character varying(255),
    file_sync_date timestamp without time zone,
    instance_ip character varying(255),
    instance_port character varying(255),
    msisdn character varying(255),
    reg_type character varying(255),
    rejection_reason character varying(255),
    sim_serial character varying(255),
    source_path character varying(255),
    target_path character varying(255),
    transfer_mode character varying(255),
    unique_id character varying(255) NOT NULL,
    enrollment_ref_fk bigint
);


ALTER TABLE biocapture_test.retried_bfp_sync_log OWNER TO enterprisedb;

--
-- TOC entry 513 (class 1259 OID 43513)
-- Name: revinfo; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE biocapture_test.revinfo OWNER TO enterprisedb;

--
-- TOC entry 514 (class 1259 OID 43516)
-- Name: sar; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.sar AS
 SELECT sms_activation_request.id,
    sms_activation_request.phone_number AS msisdn,
    sms_activation_request.unique_id,
    sms_activation_request.customer_name,
    sms_activation_request.enrollment_ref AS tag,
    sms_activation_request.receipt_timestamp AS sync_time,
    sms_activation_request.registration_timestamp AS reg_time,
    sms_activation_request.state_id
   FROM biocapture_test.sms_activation_request
  ORDER BY sms_activation_request.receipt_timestamp DESC;


ALTER TABLE biocapture_test.sar OWNER TO enterprisedb;

--
-- TOC entry 515 (class 1259 OID 43520)
-- Name: serial_msisdn_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.serial_msisdn_mapper (
    id bigint NOT NULL,
    msisdn character varying(255),
    sim_serial character varying(255),
    status character varying(255)
);


ALTER TABLE biocapture_test.serial_msisdn_mapper OWNER TO enterprisedb;

--
-- TOC entry 516 (class 1259 OID 43526)
-- Name: setting; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.setting (
    id bigint NOT NULL,
    description character varying(512),
    name character varying(256) NOT NULL,
    value character varying(512) NOT NULL
);


ALTER TABLE biocapture_test.setting OWNER TO enterprisedb;

--
-- TOC entry 517 (class 1259 OID 43532)
-- Name: sim_swap_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.sim_swap_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    agent_email character varying(255) NOT NULL,
    capture_mode character varying(255),
    confirmation_timestamp timestamp without time zone,
    mac_address character varying(255) NOT NULL,
    msisdn character varying(255) NOT NULL,
    old_sim_serial character varying(255),
    order_number character varying(255),
    puk character varying(255),
    realtime_device_id character varying(255),
    new_sim_serial character varying(255) NOT NULL,
    subscriber_passport oid,
    swap_status character varying(255) NOT NULL,
    swap_time timestamp without time zone NOT NULL,
    kit_tag character varying(255) NOT NULL,
    unique_id character varying(255) NOT NULL,
    enrollment_ref_fk bigint
);


ALTER TABLE biocapture_test.sim_swap_log OWNER TO enterprisedb;

--
-- TOC entry 518 (class 1259 OID 43538)
-- Name: simrop_agent_trend; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.simrop_agent_trend (
    biometric_capture_agent character varying(255),
    enrollment_ref character varying(255),
    sync_date timestamp without time zone,
    total_syncs bigint,
    total_subscribers bigint,
    total_activated bigint,
    new_reg bigint,
    re_reg bigint,
    inbound bigint,
    outbound bigint,
    new_reg_msisdn bigint,
    new_reg_sim_serial bigint,
    add_reg bigint,
    sim_swap bigint,
    biometric_update bigint
);


ALTER TABLE biocapture_test.simrop_agent_trend OWNER TO enterprisedb;

--
-- TOC entry 519 (class 1259 OID 43544)
-- Name: simrop_issue_id_sequence; Type: SEQUENCE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE SEQUENCE biocapture_test.simrop_issue_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biocapture_test.simrop_issue_id_sequence OWNER TO enterprisedb;

--
-- TOC entry 520 (class 1259 OID 43546)
-- Name: simrop_registration_trend; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.simrop_registration_trend (
    node_id bigint,
    device_id character varying(255),
    mac_address character varying(255),
    sync_date timestamp without time zone,
    enrollment_ref character varying(255),
    total_syncs bigint,
    total_subscribers bigint,
    total_activated bigint,
    new_reg bigint,
    re_reg bigint,
    inbound bigint,
    outbound bigint
);


ALTER TABLE biocapture_test.simrop_registration_trend OWNER TO enterprisedb;

--
-- TOC entry 521 (class 1259 OID 43552)
-- Name: simrop_registration_trend_1; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.simrop_registration_trend_1 (
    node_id bigint,
    device_id character varying(255),
    mac_address character varying(255),
    sync_date timestamp without time zone,
    enrollment_ref character varying(255),
    total_syncs bigint,
    total_subscribers bigint,
    total_activated bigint,
    new_reg bigint,
    re_reg bigint,
    inbound bigint,
    outbound bigint
);


ALTER TABLE biocapture_test.simrop_registration_trend_1 OWNER TO enterprisedb;

--
-- TOC entry 522 (class 1259 OID 43558)
-- Name: social_media; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.social_media (
    id bigint NOT NULL,
    handle character varying(255),
    platform character varying(255),
    basic_data_fk bigint
);


ALTER TABLE biocapture_test.social_media OWNER TO enterprisedb;

--
-- TOC entry 523 (class 1259 OID 43564)
-- Name: special_data; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.special_data (
    id bigint NOT NULL,
    biometric_data oid NOT NULL,
    biometricdatatype character varying(255) NOT NULL,
    reason character varying(255),
    basic_data_fk bigint NOT NULL,
    document_number character varying(200)
);


ALTER TABLE biocapture_test.special_data OWNER TO enterprisedb;

--
-- TOC entry 524 (class 1259 OID 43570)
-- Name: state_lga_mapping_axon; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.state_lga_mapping_axon (
    state character varying(255),
    lga character varying(255)
);


ALTER TABLE biocapture_test.state_lga_mapping_axon OWNER TO enterprisedb;

--
-- TOC entry 525 (class 1259 OID 43576)
-- Name: subscriber_detail; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.subscriber_detail (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    agility_updated boolean,
    alternate_phone_number character varying(255),
    biometrics_updated boolean,
    channel character varying(255) NOT NULL,
    city character varying(255),
    company_city_address character varying(255),
    company_house_number character varying(255),
    company_name character varying(255),
    company_postal_code character varying(255),
    company_reg_number character varying(255),
    company_street_address character varying(255),
    date_of_birth timestamp without time zone,
    email_address character varying(255),
    first_name character varying(255),
    gender character varying(255),
    house_number character varying(255),
    identification_type character varying(255),
    issuing_country character varying(255),
    maiden_name character varying(255),
    msisdn character varying(255),
    occupation character varying(255),
    other_names character varying(255),
    passport_expiry_date timestamp without time zone,
    passport_image oid,
    passport_number character varying(255),
    postal_code character varying(255),
    registration_type character varying(255),
    resident boolean,
    street_address character varying(255),
    subscriber_type character varying(255),
    surname character varying(255),
    transaction_id character varying(255),
    txn_id_exp_date_time timestamp without time zone,
    validated boolean,
    area_of_residence bigint,
    company_lga bigint,
    country_of_origin bigint,
    lga_of_origin bigint,
    lga_of_registration bigint
);


ALTER TABLE biocapture_test.subscriber_detail OWNER TO enterprisedb;

--
-- TOC entry 526 (class 1259 OID 43582)
-- Name: subscriber_search_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.subscriber_search_history (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    activity character varying(255) NOT NULL,
    email_address character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    kmuser_fk bigint NOT NULL,
    parameter_value character varying(255),
    subscriber_search_params_fk bigint,
    mobile character varying(255),
    transaction_id character varying(255) NOT NULL,
    unique_id character varying(255),
    msisdn character varying(255),
    sim_serial character varying(255)
);


ALTER TABLE biocapture_test.subscriber_search_history OWNER TO enterprisedb;

--
-- TOC entry 527 (class 1259 OID 43588)
-- Name: subscriber_search_params; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.subscriber_search_params (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    name character varying(255) NOT NULL,
    transaction_id bigint NOT NULL
);


ALTER TABLE biocapture_test.subscriber_search_params OWNER TO enterprisedb;

--
-- TOC entry 637 (class 1259 OID 65779)
-- Name: ta; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.ta (
    one integer,
    one_ text,
    activationstatusenum character varying(2000),
    code character varying(2000)
);


ALTER TABLE biocapture_test.ta OWNER TO enterprisedb;

--
-- TOC entry 528 (class 1259 OID 43591)
-- Name: tag_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.tag_history (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    admin_email character varying(128),
    device_id character varying(255),
    mac_address character varying(128),
    new_tag character varying(128) NOT NULL,
    old_tag character varying(128)
);


ALTER TABLE biocapture_test.tag_history OWNER TO enterprisedb;

--
-- TOC entry 529 (class 1259 OID 43597)
-- Name: telecom_master_records; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.telecom_master_records (
    id bigint NOT NULL,
    insert_timestamp timestamp without time zone,
    msisdn character varying(255),
    pin_ref character varying(255),
    primary_msisdn character varying(255),
    processing_date timestamp without time zone,
    processing_status character varying(255),
    status character varying(255)
);


ALTER TABLE biocapture_test.telecom_master_records OWNER TO enterprisedb;

--
-- TOC entry 530 (class 1259 OID 43603)
-- Name: temp_agent; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.temp_agent (
    device_id character varying(255),
    code character varying(255),
    state character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    sex character varying(255),
    phone character varying(255)
);


ALTER TABLE biocapture_test.temp_agent OWNER TO enterprisedb;

--
-- TOC entry 531 (class 1259 OID 43609)
-- Name: temp_dealer; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.temp_dealer (
    dealer_name character varying(255),
    dealer_code character varying(255),
    dealer_email character varying(255),
    phone character varying(255),
    dealer_type character varying(255),
    division character varying(255),
    region character varying(255),
    address character varying(255)
);


ALTER TABLE biocapture_test.temp_dealer OWNER TO enterprisedb;

--
-- TOC entry 532 (class 1259 OID 43615)
-- Name: temp_state; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.temp_state (
    device_id character varying(255),
    code character varying(255),
    state character varying(255)
);


ALTER TABLE biocapture_test.temp_state OWNER TO enterprisedb;

--
-- TOC entry 533 (class 1259 OID 43621)
-- Name: trade_partners_state; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.trade_partners_state (
    trade_partners_fk bigint NOT NULL,
    state_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.trade_partners_state OWNER TO enterprisedb;

--
-- TOC entry 646 (class 1259 OID 65852)
-- Name: update_bio_demo_tbl; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.update_bio_demo_tbl AS
 SELECT DISTINCT bsl.unique_id,
    e.pk AS eyeballingpk,
    e.status,
    e.create_date,
    e.km_user_pk,
    e.infraction_fk,
    e.basic_data_fk,
    i.pk AS infractionpk,
    i.name,
    i.eyeballingfk,
    i.description,
    b.id AS basic_data_id,
    bsl.activationstatusenum
   FROM biocapture_test.eyeballing e,
    biocapture_test.infraction i,
    biocapture_test.basic_data b,
    biocapture_test.bfp_sync_log bsl,
    biocapture_test.user_id u
  WHERE ((e.infraction_fk = i.pk) AND (e.basic_data_fk = b.id) AND (u.id = b.user_id_fk) AND ((u.unique_id)::text = (bsl.unique_id)::text) AND ((bsl.bfpsyncstatusenum)::text = 'SUCCESS'::text));


ALTER TABLE biocapture_test.update_bio_demo_tbl OWNER TO enterprisedb;

--
-- TOC entry 534 (class 1259 OID 43624)
-- Name: user_act_deact_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.user_act_deact_reason (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    category character varying(255) NOT NULL,
    name character varying(256) NOT NULL,
    value character varying(512) NOT NULL
);


ALTER TABLE biocapture_test.user_act_deact_reason OWNER TO enterprisedb;

--
-- TOC entry 535 (class 1259 OID 43630)
-- Name: user_auth_mode_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.user_auth_mode_mapper (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    authentication_mode_fk bigint NOT NULL,
    km_user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.user_auth_mode_mapper OWNER TO enterprisedb;

--
-- TOC entry 536 (class 1259 OID 43633)
-- Name: user_creation_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.user_creation_request (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_date timestamp without time zone,
    approval_feedback_message character varying(255),
    status character varying(255) NOT NULL,
    email_address character varying(255),
    first_name character varying(255),
    gender character varying(255),
    outlet_location character varying(255),
    outlet_name character varying(255),
    phone_number character varying(255),
    surname character varying(255),
    agent_detail_pk bigint,
    approved_by_km_user_fk bigint,
    area_fk bigint,
    attachment_fk bigint,
    auth_mode_fk bigint,
    node_fk bigint,
    node_assignment_history_fk bigint,
    outlet_type_fk bigint,
    requested_by_km_user_fk bigint,
    requested_by_kyc_dealer_fk bigint,
    territory_fk bigint
);


ALTER TABLE biocapture_test.user_creation_request OWNER TO enterprisedb;

--
-- TOC entry 537 (class 1259 OID 43639)
-- Name: vendor_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vendor_type (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.vendor_type OWNER TO enterprisedb;

--
-- TOC entry 538 (class 1259 OID 43645)
-- Name: version_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.version_log (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    type_ integer,
    version_ character varying(255) NOT NULL,
    version_type character varying(255),
    node_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.version_log OWNER TO enterprisedb;

--
-- TOC entry 539 (class 1259 OID 43651)
-- Name: vl_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vl_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    msg character varying(512),
    type_ character varying(255),
    vr_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.vl_ OWNER TO enterprisedb;

--
-- TOC entry 540 (class 1259 OID 43657)
-- Name: vr_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vr_ (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_status character varying(255),
    approver character varying(1024),
    batch_name character varying(1024),
    capture_version character varying(1024),
    demo_threshold_ver character varying(255),
    dv_status character varying(255),
    file_path character varying(2048),
    finger_sdk_version character varying(255),
    fv_status character varying(255),
    lifv_status character varying(255),
    llfv_status character varying(255),
    lmfv_status character varying(255),
    lrfv_status character varying(255),
    ltfv_status character varying(255),
    multi_finger_threshold_ver character varying(255),
    pv_status character varying(255),
    portrait_capture_mode character varying(255),
    portrait_sdk_version character varying(255),
    pry_img_threshold_ver character varying(255),
    record_id bigint,
    revalidate boolean,
    rifv_status character varying(255),
    rlfv_status character varying(255),
    rmfv_status character varying(255),
    rrfv_status character varying(255),
    rtfv_status character varying(255),
    spv_status character varying(255),
    sec_img_threshold_ver character varying(255),
    single_finger_threshold_ver character varying(255),
    threshold_version character varying(255),
    unique_id character varying(64)
);


ALTER TABLE biocapture_test.vr_ OWNER TO enterprisedb;

--
-- TOC entry 541 (class 1259 OID 43663)
-- Name: vtu_category; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vtu_category (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    category_desc character varying(255),
    category_name character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.vtu_category OWNER TO enterprisedb;

--
-- TOC entry 542 (class 1259 OID 43669)
-- Name: vtu_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vtu_request (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_date timestamp without time zone,
    approval_status character varying(255),
    msisdn character varying(255) NOT NULL,
    agent_fk bigint NOT NULL,
    approved_by bigint,
    requested_by bigint NOT NULL,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.vtu_request OWNER TO enterprisedb;

--
-- TOC entry 543 (class 1259 OID 43675)
-- Name: vtu_request_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vtu_request_approval (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    approval_status character varying(255),
    feedback character varying(255) NOT NULL,
    approved_by bigint,
    vtu_request_fk bigint NOT NULL,
    workflow_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.vtu_request_approval OWNER TO enterprisedb;

--
-- TOC entry 544 (class 1259 OID 43681)
-- Name: vtu_transaction_logs; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.vtu_transaction_logs (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    amount double precision NOT NULL,
    client_txn_id character varying(255) NOT NULL,
    device_id character varying(255) NOT NULL,
    kit_tag character varying(255) NOT NULL,
    vtu_sequence_no bigint NOT NULL,
    subscriber_number character varying(255) NOT NULL,
    txn_date timestamp without time zone NOT NULL,
    txn_id character varying(255) NOT NULL,
    txn_status character varying(255) NOT NULL,
    txn_type character varying(255) NOT NULL,
    vend_status_code character varying(255),
    vtu_number character varying(255) NOT NULL,
    bundle_type_fk bigint,
    user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.vtu_transaction_logs OWNER TO enterprisedb;

--
-- TOC entry 545 (class 1259 OID 43687)
-- Name: vw_kit_performance; Type: VIEW; Schema: biocapture_test; Owner: enterprisedb
--

CREATE VIEW biocapture_test.vw_kit_performance AS
 SELECT (to_char(sms_activation_request.receipt_timestamp, 'YYYYMMDD'::character varying))::numeric AS date_key,
    (((234)::text || ((sms_activation_request.phone_number)::numeric)::text))::numeric AS msisdn_nsk,
    sms_activation_request.unique_id AS pin_ref,
    sms_activation_request.enrollment_ref AS kit_tag,
    1 AS gros_con
   FROM biocapture_test.sms_activation_request
  WHERE ((sms_activation_request.phone_number)::text ~~ '08%'::text);


ALTER TABLE biocapture_test.vw_kit_performance OWNER TO enterprisedb;

--
-- TOC entry 546 (class 1259 OID 43691)
-- Name: watch_list; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.watch_list (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    ip_ character varying(255) NOT NULL,
    body_ character varying(255),
    url_ character varying(255) NOT NULL
);


ALTER TABLE biocapture_test.watch_list OWNER TO enterprisedb;

--
-- TOC entry 547 (class 1259 OID 43697)
-- Name: whitelisted_name; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.whitelisted_name (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    category_ character varying(255) NOT NULL,
    channel_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    km_user_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.whitelisted_name OWNER TO enterprisedb;

--
-- TOC entry 548 (class 1259 OID 43703)
-- Name: workflow; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.workflow (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    description character varying(255),
    name character varying(255) NOT NULL,
    workflow_order integer NOT NULL,
    workflow_activity_enum character varying(255),
    workflow_fk bigint
);


ALTER TABLE biocapture_test.workflow OWNER TO enterprisedb;

--
-- TOC entry 549 (class 1259 OID 43709)
-- Name: wsq_image; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.wsq_image (
    id bigint NOT NULL,
    compression_ratio real,
    finger character varying(255) NOT NULL,
    nfiq integer,
    reason_code character varying(255),
    wsq_data oid NOT NULL,
    basic_data_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.wsq_image OWNER TO enterprisedb;

--
-- TOC entry 550 (class 1259 OID 43715)
-- Name: zonal_hourly_sync; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zonal_hourly_sync (
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    active_kits integer,
    day_active_kits integer,
    day_sync_count bigint,
    day_sync_diff bigint,
    hourly_diff bigint,
    prev_day_sync_count bigint,
    prev_sync_count bigint,
    sync_count bigint,
    sync_day integer,
    sync_month integer,
    sync_time integer,
    sync_week integer,
    sync_year integer,
    zone character varying(24) NOT NULL
);


ALTER TABLE biocapture_test.zonal_hourly_sync OWNER TO enterprisedb;

--
-- TOC entry 551 (class 1259 OID 43718)
-- Name: zone_state_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zone_state_mapper (
    id bigint NOT NULL,
    state_fk bigint NOT NULL,
    zone_fk bigint NOT NULL
);


ALTER TABLE biocapture_test.zone_state_mapper OWNER TO enterprisedb;

--
-- TOC entry 552 (class 1259 OID 43721)
-- Name: zz_agent_detail; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_agent_detail (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    account_number character varying(255),
    vtu_number character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_agent_detail OWNER TO enterprisedb;

--
-- TOC entry 553 (class 1259 OID 43727)
-- Name: zz_area; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_area (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(256),
    name character varying(256),
    lga_fk bigint
);


ALTER TABLE biocapture_test.zz_area OWNER TO enterprisedb;

--
-- TOC entry 554 (class 1259 OID 43733)
-- Name: zz_attachment_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_attachment_ (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    attachment_type_enum character varying(255),
    file_data_ oid,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_attachment_ OWNER TO enterprisedb;

--
-- TOC entry 555 (class 1259 OID 43736)
-- Name: zz_auditor; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_auditor (
    rev_no bigint NOT NULL,
    portal_url character varying(255),
    email_addr character varying(255),
    orbita_id bigint,
    remote_addr character varying(255),
    remote_host character varying(255),
    rev_timestamp timestamp without time zone,
    user_agent character varying(255)
);


ALTER TABLE biocapture_test.zz_auditor OWNER TO enterprisedb;

--
-- TOC entry 556 (class 1259 OID 43742)
-- Name: zz_authentication_mode; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_authentication_mode (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    description character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.zz_authentication_mode OWNER TO enterprisedb;

--
-- TOC entry 557 (class 1259 OID 43748)
-- Name: zz_b2b_location; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_b2b_location (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name character varying(255),
    short_code character varying(255),
    short_code_description character varying(255)
);


ALTER TABLE biocapture_test.zz_b2b_location OWNER TO enterprisedb;

--
-- TOC entry 558 (class 1259 OID 43754)
-- Name: zz_b2b_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_b2b_log (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    kit_image oid,
    kit_tag character varying(255),
    rejection_reason character varying(255),
    resolution_date timestamp without time zone,
    status_enum character varying(255),
    approved_by_km_user_fk bigint,
    b2b_location_fk bigint,
    kyc_dealer_fk bigint,
    node_fk bigint,
    originating_dealer_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_b2b_log OWNER TO enterprisedb;

--
-- TOC entry 559 (class 1259 OID 43760)
-- Name: zz_b2b_request_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_b2b_request_approval (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    approval_status character varying(255),
    feedback character varying(255),
    approved_by bigint,
    b2b_request_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_b2b_request_approval OWNER TO enterprisedb;

--
-- TOC entry 560 (class 1259 OID 43766)
-- Name: zz_blacklist_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_blacklist_reason (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    description character varying(255),
    name character varying(255),
    reason_type character varying(255)
);


ALTER TABLE biocapture_test.zz_blacklist_reason OWNER TO enterprisedb;

--
-- TOC entry 561 (class 1259 OID 43772)
-- Name: zz_blacklisted_name; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_blacklisted_name (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    name_ character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_blacklisted_name OWNER TO enterprisedb;

--
-- TOC entry 562 (class 1259 OID 43775)
-- Name: zz_blacklisted_name_settings; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_blacklisted_name_settings (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name_ character varying(255),
    value character varying(255)
);


ALTER TABLE biocapture_test.zz_blacklisted_name_settings OWNER TO enterprisedb;

--
-- TOC entry 563 (class 1259 OID 43781)
-- Name: zz_community_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_community_ (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name character varying(255),
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_community_ OWNER TO enterprisedb;

--
-- TOC entry 564 (class 1259 OID 43787)
-- Name: zz_country; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_country (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(256),
    country_id integer,
    name character varying(256)
);


ALTER TABLE biocapture_test.zz_country OWNER TO enterprisedb;

--
-- TOC entry 565 (class 1259 OID 43793)
-- Name: zz_dealer_division; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_dealer_division (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.zz_dealer_division OWNER TO enterprisedb;

--
-- TOC entry 566 (class 1259 OID 43799)
-- Name: zz_dealer_exclusion_list; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_dealer_exclusion_list (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    excluded_by character varying(255),
    dealer_fk bigint
);


ALTER TABLE biocapture_test.zz_dealer_exclusion_list OWNER TO enterprisedb;

--
-- TOC entry 567 (class 1259 OID 43802)
-- Name: zz_dealer_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_dealer_type (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    code character varying(64),
    name character varying(128)
);


ALTER TABLE biocapture_test.zz_dealer_type OWNER TO enterprisedb;

--
-- TOC entry 568 (class 1259 OID 43805)
-- Name: zz_device; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    device_tag character varying(255),
    device_status_fk bigint,
    device_type_fk bigint,
    node_fk bigint
);


ALTER TABLE biocapture_test.zz_device OWNER TO enterprisedb;

--
-- TOC entry 569 (class 1259 OID 43808)
-- Name: zz_device_license_quota; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_license_quota (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    purchase_date timestamp without time zone,
    purchased_licences integer
);


ALTER TABLE biocapture_test.zz_device_license_quota OWNER TO enterprisedb;

--
-- TOC entry 570 (class 1259 OID 43811)
-- Name: zz_device_owner; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_owner (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.zz_device_owner OWNER TO enterprisedb;

--
-- TOC entry 571 (class 1259 OID 43817)
-- Name: zz_device_requisition_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_requisition_approval (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    approval_feedback_message character varying(255),
    approval_status_enum character varying(255),
    approved_by_km_user_fk bigint,
    device_requisition_request_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_device_requisition_approval OWNER TO enterprisedb;

--
-- TOC entry 572 (class 1259 OID 43823)
-- Name: zz_device_requisition_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_requisition_request (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    item_count integer,
    peripheral boolean,
    request_description character varying(255),
    approval_status_enum character varying(255),
    area_fk bigint,
    kyc_dealer_fk bigint,
    requested_by_km_user_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_device_requisition_request OWNER TO enterprisedb;

--
-- TOC entry 573 (class 1259 OID 43829)
-- Name: zz_device_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_status (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    name character varying(255),
    remark character varying(255)
);


ALTER TABLE biocapture_test.zz_device_status OWNER TO enterprisedb;

--
-- TOC entry 574 (class 1259 OID 43835)
-- Name: zz_device_tag_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_tag_request (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    app_version character varying(255),
    device_type_enum character varying(255),
    kit_tag character varying(255),
    requested_device_id character varying(255),
    tag_approval_status_enum character varying(255),
    tag_request_type_enum character varying(255),
    kyc_dealer_fk bigint,
    device_type_fk bigint,
    enrollment_ref_fk bigint,
    lga_fk bigint,
    requested_by_km_user_fk bigint,
    workflow_fk bigint,
    alt_kit_tag character varying(255)
);


ALTER TABLE biocapture_test.zz_device_tag_request OWNER TO enterprisedb;

--
-- TOC entry 575 (class 1259 OID 43841)
-- Name: zz_device_tag_request_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_tag_request_approval (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    approval_feedback_message character varying(255),
    tag_approval_status_enum character varying(255),
    approved_by_km_user_fk bigint,
    device_tag_request_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_device_tag_request_approval OWNER TO enterprisedb;

--
-- TOC entry 576 (class 1259 OID 43847)
-- Name: zz_device_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_device_type (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    description character varying(255),
    device_type_enum character varying(255),
    name character varying(255),
    peripheral boolean
);


ALTER TABLE biocapture_test.zz_device_type OWNER TO enterprisedb;

--
-- TOC entry 577 (class 1259 OID 43853)
-- Name: zz_enrollment_ref; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_enrollment_ref (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    is_corporate boolean,
    custom1 character varying(255),
    custom2 character varying(255),
    custom3 character varying(255),
    date_installed timestamp without time zone,
    description character varying(255),
    device_id character varying(255),
    installed_by character varying(255),
    mac_address character varying(255),
    name character varying(255),
    network_card_name character varying(255)
);


ALTER TABLE biocapture_test.zz_enrollment_ref OWNER TO enterprisedb;

--
-- TOC entry 578 (class 1259 OID 43859)
-- Name: zz_field_edit_details; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_field_edit_details (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    field_name character varying(255),
    reasons character varying(255),
    accessibility_status_enum character varying(255)
);


ALTER TABLE biocapture_test.zz_field_edit_details OWNER TO enterprisedb;

--
-- TOC entry 579 (class 1259 OID 43865)
-- Name: zz_fm_license_approval_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_fm_license_approval_history (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    approval_date timestamp without time zone,
    is_approved boolean,
    approver_id bigint,
    comments character varying(255),
    ip_address character varying(255),
    kit_tag character varying(255),
    mac_address character varying(255),
    node_fk bigint
);


ALTER TABLE biocapture_test.zz_fm_license_approval_history OWNER TO enterprisedb;

--
-- TOC entry 580 (class 1259 OID 43871)
-- Name: zz_fm_license_quota; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_fm_license_quota (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    purchase_date timestamp without time zone,
    purchased_licences integer
);


ALTER TABLE biocapture_test.zz_fm_license_quota OWNER TO enterprisedb;

--
-- TOC entry 581 (class 1259 OID 43874)
-- Name: zz_fm_license_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_fm_license_request (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    agent_name character varying(255),
    approval_date timestamp without time zone,
    is_approved boolean,
    authorized_by_email_address character varying(255),
    comments character varying(255),
    email_address character varying(255),
    kit_tag character varying(255),
    license_hash character varying(255),
    license_request_type character varying(255),
    mac_address character varying(255),
    request_date timestamp without time zone,
    approved_by bigint,
    enrollment_ref_fk bigint,
    requested_by bigint
);


ALTER TABLE biocapture_test.zz_fm_license_request OWNER TO enterprisedb;

--
-- TOC entry 582 (class 1259 OID 43880)
-- Name: zz_issue_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_issue_log (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    issue_id character varying(255),
    issue_type_enum character varying(255),
    resolution_date timestamp without time zone,
    resolution_message character varying(255),
    sla_status character varying(255),
    status_enum character varying(255),
    approved_by_km_user_fk bigint,
    issue_summary_fk bigint,
    km_user_fk bigint,
    kyc_dealer_fk bigint,
    node_fk bigint
);


ALTER TABLE biocapture_test.zz_issue_log OWNER TO enterprisedb;

--
-- TOC entry 583 (class 1259 OID 43886)
-- Name: zz_issue_log_attachment; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_issue_log_attachment (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    attachment_type_enum character varying(255),
    file_data_ oid,
    file_name character varying(255),
    issue_log_fk bigint
);


ALTER TABLE biocapture_test.zz_issue_log_attachment OWNER TO enterprisedb;

--
-- TOC entry 584 (class 1259 OID 43892)
-- Name: zz_issue_summary; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_issue_summary (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    issue_category_enum character varying(255),
    issue_type_enum character varying(255),
    kit_issue_enum character varying(255),
    name character varying(255)
);


ALTER TABLE biocapture_test.zz_issue_summary OWNER TO enterprisedb;

--
-- TOC entry 585 (class 1259 OID 43898)
-- Name: zz_kit_mapping_approval; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kit_mapping_approval (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    approval_status character varying(255),
    feedback character varying(255),
    approved_by bigint,
    node_assignment_history_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_kit_mapping_approval OWNER TO enterprisedb;

--
-- TOC entry 586 (class 1259 OID 43904)
-- Name: zz_kit_retrieval_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kit_retrieval_history (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    other_feedback character varying(255),
    assigned_user bigint,
    kit_retrieval_reason_fk bigint,
    node_fk bigint,
    performed_by bigint
);


ALTER TABLE biocapture_test.zz_kit_retrieval_history OWNER TO enterprisedb;

--
-- TOC entry 587 (class 1259 OID 43907)
-- Name: zz_kit_retrieval_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kit_retrieval_reason (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    reason character varying(255)
);


ALTER TABLE biocapture_test.zz_kit_retrieval_reason OWNER TO enterprisedb;

--
-- TOC entry 588 (class 1259 OID 43913)
-- Name: zz_kit_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kit_type (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    description character varying(255),
    type character varying(255)
);


ALTER TABLE biocapture_test.zz_kit_type OWNER TO enterprisedb;

--
-- TOC entry 589 (class 1259 OID 43919)
-- Name: zz_km_privilege; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_privilege (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    name character varying(255),
    privilege character varying(255)
);


ALTER TABLE biocapture_test.zz_km_privilege OWNER TO enterprisedb;

--
-- TOC entry 590 (class 1259 OID 43925)
-- Name: zz_km_role; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_role (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    is_admin boolean,
    code character varying(255),
    created_by bigint,
    description character varying(255),
    role character varying(255)
);


ALTER TABLE biocapture_test.zz_km_role OWNER TO enterprisedb;

--
-- TOC entry 591 (class 1259 OID 43931)
-- Name: zz_km_role_community_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_role_community_mapper (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    community_fk bigint,
    km_role_fk bigint
);


ALTER TABLE biocapture_test.zz_km_role_community_mapper OWNER TO enterprisedb;

--
-- TOC entry 592 (class 1259 OID 43934)
-- Name: zz_km_role_division; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_role_division (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    dealer_division_fk bigint,
    role_fk bigint
);


ALTER TABLE biocapture_test.zz_km_role_division OWNER TO enterprisedb;

--
-- TOC entry 593 (class 1259 OID 43937)
-- Name: zz_km_role_privilege; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_role_privilege (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    privilege_fk bigint,
    role_fk bigint
);


ALTER TABLE biocapture_test.zz_km_role_privilege OWNER TO enterprisedb;

--
-- TOC entry 594 (class 1259 OID 43940)
-- Name: zz_km_role_workflow_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_role_workflow_mapper (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    km_role_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_km_role_workflow_mapper OWNER TO enterprisedb;

--
-- TOC entry 595 (class 1259 OID 43943)
-- Name: zz_km_user; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_user (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    blacklisted boolean,
    client_first_login timestamp without time zone,
    email_address character varying(255),
    failed_login_attempts integer,
    first_name character varying(128),
    gender character varying(255),
    last_failed_login timestamp without time zone,
    last_password_change timestamp without time zone,
    last_successful_login timestamp without time zone,
    locked_out boolean,
    mobile character varying(255),
    nin character varying(255),
    orbita_id bigint,
    other_name character varying(128),
    password character varying(255),
    surname character varying(128),
    ad_username character varying(255),
    last_logout timestamp without time zone
);


ALTER TABLE biocapture_test.zz_km_user OWNER TO enterprisedb;

--
-- TOC entry 596 (class 1259 OID 43949)
-- Name: zz_km_user_dealer_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_user_dealer_mapper (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    kyc_dealer_fk bigint,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_km_user_dealer_mapper OWNER TO enterprisedb;

--
-- TOC entry 597 (class 1259 OID 43952)
-- Name: zz_km_user_history_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_user_history_ (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    approved_by character varying(255),
    feedback_message character varying(255),
    operation_performed character varying(255),
    reason character varying(255),
    user_act_deact_reason_fk bigint,
    km_user_fk bigint,
    performed_by bigint
);


ALTER TABLE biocapture_test.zz_km_user_history_ OWNER TO enterprisedb;

--
-- TOC entry 598 (class 1259 OID 43958)
-- Name: zz_km_user_region_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_km_user_region_mapper (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    region_fk bigint,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_km_user_region_mapper OWNER TO enterprisedb;

--
-- TOC entry 599 (class 1259 OID 43961)
-- Name: zz_kyc_blacklist; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kyc_blacklist (
    pk character varying(255) NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    blacklisted_item character varying(255),
    item_type character varying(255),
    mac_address character varying(255),
    revoked boolean,
    enrollment_ref bigint
);


ALTER TABLE biocapture_test.zz_kyc_blacklist OWNER TO enterprisedb;

--
-- TOC entry 600 (class 1259 OID 43967)
-- Name: zz_kyc_broadcast; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kyc_broadcast (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    is_expired boolean,
    is_global boolean,
    message character varying(2048),
    created_by bigint,
    node_fk bigint,
    user_fk bigint
);


ALTER TABLE biocapture_test.zz_kyc_broadcast OWNER TO enterprisedb;

--
-- TOC entry 601 (class 1259 OID 43973)
-- Name: zz_kyc_dealer; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_kyc_dealer (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    address character varying(255),
    contact_address character varying(255),
    deal_code character varying(255),
    email_address character varying(255),
    km_user_pk bigint,
    mobile_number character varying(16),
    name character varying(255),
    orbita_id bigint,
    dealer_division_fk bigint
);


ALTER TABLE biocapture_test.zz_kyc_dealer OWNER TO enterprisedb;

--
-- TOC entry 602 (class 1259 OID 43979)
-- Name: zz_lga; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_lga (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(255),
    coordinate_boundaries character varying(5225),
    lga_id integer,
    name character varying(255),
    state_fk bigint,
    territory_fk bigint
);


ALTER TABLE biocapture_test.zz_lga OWNER TO enterprisedb;

--
-- TOC entry 603 (class 1259 OID 43985)
-- Name: zz_license; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_license (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    application_license text,
    kit_approved boolean,
    disapproval_description character varying(255),
    face_license text,
    finger_license text,
    last_updated timestamp without time zone,
    mac_address character varying(32),
    misc_license1 text,
    misc_license2 text,
    receipt_timestamp timestamp without time zone,
    request_status character varying(255),
    revoked boolean,
    update_description character varying(512),
    upload_timestamp timestamp without time zone,
    wsq_license text,
    approved_by bigint
);


ALTER TABLE biocapture_test.zz_license OWNER TO enterprisedb;

--
-- TOC entry 604 (class 1259 OID 43991)
-- Name: zz_node; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_node (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    aware_liveness_version integer,
    blacklist_date timestamp without time zone,
    black_listed boolean,
    commissioned boolean,
    is_corporate boolean,
    data_list_tag_name character varying(255),
    deployment_category character varying(255),
    geotracker_app_version real,
    geotracker_install_date timestamp without time zone,
    google_vision_version integer,
    image_clean_up_version integer,
    installation_timestamp timestamp without time zone,
    installed_by character varying(255),
    last_installed_update real,
    last_sync_time timestamp without time zone,
    last_updated timestamp without time zone,
    location character varying(255),
    mac_address character varying(255),
    machine_architecture character varying(255),
    machine_manufacturer character varying(255),
    machine_model character varying(255),
    machine_os character varying(255),
    machine_runtime_version character varying(255),
    machine_serial_number character varying(255),
    migrated boolean,
    network_card_name character varying(255),
    node_activity_status_enum character varying(255),
    passive_liveness_version integer,
    previous_tag_name character varying(255),
    remark character varying(255),
    sync_status character varying(255),
    purchase_year integer,
    device_owner bigint,
    device_status_fk bigint,
    device_type bigint,
    enrollment_ref bigint,
    kit_type_fk bigint,
    active boolean
);


ALTER TABLE biocapture_test.zz_node OWNER TO enterprisedb;

--
-- TOC entry 605 (class 1259 OID 43997)
-- Name: zz_node_assignment; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_node_assignment (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    active boolean,
    create_date timestamp without time zone,
    deleted boolean,
    last_modified timestamp without time zone,
    area_fk bigint,
    kyc_dealer_fk bigint,
    state_fk bigint,
    zone_fk bigint,
    dm_user_fk bigint,
    fsa_user_fk bigint,
    lga_fk bigint,
    outlet_fk bigint,
    node_fk bigint,
    territory_fk bigint
);


ALTER TABLE biocapture_test.zz_node_assignment OWNER TO enterprisedb;

--
-- TOC entry 606 (class 1259 OID 44000)
-- Name: zz_node_assignment_history; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_node_assignment_history (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    assigned_agent_status character varying(255),
    approval_date timestamp without time zone,
    approval_status_enum character varying(255),
    rejection_reason character varying(255),
    approved_by_km_user_fk bigint,
    area_fk bigint,
    field_support_agent_km_user_fk bigint,
    node_assignment_fk bigint,
    outlet_fk bigint,
    territory_fk bigint,
    workflow_fk bigint
);


ALTER TABLE biocapture_test.zz_node_assignment_history OWNER TO enterprisedb;

--
-- TOC entry 607 (class 1259 OID 44006)
-- Name: zz_onboarding_status; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_onboarding_status (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    onboardtimestamp timestamp without time zone,
    onboarded_ boolean,
    onboarded_by_user_fk bigint,
    user_fk bigint
);


ALTER TABLE biocapture_test.zz_onboarding_status OWNER TO enterprisedb;

--
-- TOC entry 608 (class 1259 OID 44009)
-- Name: zz_outlet; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_outlet (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    address character varying(255),
    center_id character varying(255),
    coordinate_address character varying(255),
    latitude double precision,
    longitude double precision,
    name character varying(255),
    outlet_picture oid,
    owner_name character varying(255),
    owner_phone_number character varying(255),
    owner_vtu_number character varying(255),
    kyc_dealer_fk bigint,
    outlet_type_fk bigint
);


ALTER TABLE biocapture_test.zz_outlet OWNER TO enterprisedb;

--
-- TOC entry 609 (class 1259 OID 44015)
-- Name: zz_outlet_type; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_outlet_type (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name character varying(255),
    id bigint NOT NULL
);


ALTER TABLE biocapture_test.zz_outlet_type OWNER TO enterprisedb;

--
-- TOC entry 610 (class 1259 OID 44021)
-- Name: zz_page_; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_page_ (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    external_url character varying(255),
    icon character varying(255),
    name character varying(255),
    page_enum character varying(255),
    page_order integer,
    page_fk bigint,
    community_fk bigint,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_page_ OWNER TO enterprisedb;

--
-- TOC entry 611 (class 1259 OID 44027)
-- Name: zz_password_history_log; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_password_history_log (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    password character varying(255)
);


ALTER TABLE biocapture_test.zz_password_history_log OWNER TO enterprisedb;

--
-- TOC entry 612 (class 1259 OID 44030)
-- Name: zz_password_policy; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_password_policy (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    date_created timestamp without time zone,
    policy_description character varying(255),
    last_edited_by bigint,
    lockout_duration integer,
    lockout_enabled boolean,
    maximum_age integer,
    maximum_failure integer,
    minimum_age integer,
    minimum_length integer,
    minimum_lowercase integer,
    minimum_numbers integer,
    minimum_symbols integer,
    minimum_uppercase integer,
    policy_name character varying(255),
    password_expiration_enabled boolean,
    password_history_limit integer,
    policy_active boolean,
    policy_regex character varying(255),
    syntax_checking_enabled boolean,
    user_message character varying(128)
);


ALTER TABLE biocapture_test.zz_password_policy OWNER TO enterprisedb;

--
-- TOC entry 613 (class 1259 OID 44036)
-- Name: zz_region; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_region (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(256),
    name character varying(256)
);


ALTER TABLE biocapture_test.zz_region OWNER TO enterprisedb;

--
-- TOC entry 614 (class 1259 OID 44042)
-- Name: zz_serial_msisdn_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_serial_msisdn_mapper (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    msisdn character varying(255),
    sim_serial character varying(255),
    status character varying(255)
);


ALTER TABLE biocapture_test.zz_serial_msisdn_mapper OWNER TO enterprisedb;

--
-- TOC entry 615 (class 1259 OID 44048)
-- Name: zz_setting; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_setting (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(512),
    name character varying(256),
    value character varying(512)
);


ALTER TABLE biocapture_test.zz_setting OWNER TO enterprisedb;

--
-- TOC entry 616 (class 1259 OID 44054)
-- Name: zz_state; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_state (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(256),
    coordinate_boundaries character varying(5225),
    name character varying(256),
    state_id integer
);


ALTER TABLE biocapture_test.zz_state OWNER TO enterprisedb;

--
-- TOC entry 617 (class 1259 OID 44060)
-- Name: zz_telecom_master_records; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_telecom_master_records (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    insert_timestamp timestamp without time zone,
    msisdn character varying(255),
    pin_ref character varying(255),
    primary_msisdn character varying(255),
    processing_date timestamp without time zone,
    processing_status character varying(255),
    status character varying(255)
);


ALTER TABLE biocapture_test.zz_telecom_master_records OWNER TO enterprisedb;

--
-- TOC entry 618 (class 1259 OID 44066)
-- Name: zz_territory; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_territory (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name character varying(255),
    state_fk bigint,
    zone_fk bigint
);


ALTER TABLE biocapture_test.zz_territory OWNER TO enterprisedb;

--
-- TOC entry 619 (class 1259 OID 44072)
-- Name: zz_user_act_deact_reason; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_user_act_deact_reason (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    category character varying(255),
    name character varying(256),
    value character varying(512)
);


ALTER TABLE biocapture_test.zz_user_act_deact_reason OWNER TO enterprisedb;

--
-- TOC entry 620 (class 1259 OID 44078)
-- Name: zz_user_auth_mode_mapper; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_user_auth_mode_mapper (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    authentication_mode_fk bigint,
    km_user_fk bigint
);


ALTER TABLE biocapture_test.zz_user_auth_mode_mapper OWNER TO enterprisedb;

--
-- TOC entry 621 (class 1259 OID 44081)
-- Name: zz_user_creation_request; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_user_creation_request (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    approval_date timestamp without time zone,
    approval_feedback_message character varying(255),
    status character varying(255),
    email_address character varying(255),
    first_name character varying(255),
    gender character varying(255),
    outlet_location character varying(255),
    outlet_name character varying(255),
    phone_number character varying(255),
    surname character varying(255),
    agent_detail_pk bigint,
    approved_by_km_user_fk bigint,
    area_fk bigint,
    attachment_fk bigint,
    auth_mode_fk bigint,
    node_fk bigint,
    node_assignment_history_fk bigint,
    outlet_type_fk bigint,
    requested_by_km_user_fk bigint,
    requested_by_kyc_dealer_fk bigint,
    territory_fk bigint
);


ALTER TABLE biocapture_test.zz_user_creation_request OWNER TO enterprisedb;

--
-- TOC entry 622 (class 1259 OID 44087)
-- Name: zz_whitelisted_name; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_whitelisted_name (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    category_ character varying(255),
    channel_ character varying(255),
    name_ character varying(255)
);


ALTER TABLE biocapture_test.zz_whitelisted_name OWNER TO enterprisedb;

--
-- TOC entry 623 (class 1259 OID 44093)
-- Name: zz_workflow; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_workflow (
    pk bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    description character varying(255),
    name character varying(255),
    workflow_order integer,
    workflow_activity_enum character varying(255)
);


ALTER TABLE biocapture_test.zz_workflow OWNER TO enterprisedb;

--
-- TOC entry 624 (class 1259 OID 44099)
-- Name: zz_zone; Type: TABLE; Schema: biocapture_test; Owner: enterprisedb
--

CREATE TABLE biocapture_test.zz_zone (
    id bigint NOT NULL,
    rev bigint NOT NULL,
    revtype smallint,
    code character varying(256),
    name character varying(256),
    region_fk bigint
);


ALTER TABLE biocapture_test.zz_zone OWNER TO enterprisedb;

--
-- TOC entry 5564 (class 2606 OID 44106)
-- Name: access_log access_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.access_log
    ADD CONSTRAINT access_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5566 (class 2606 OID 44108)
-- Name: agent_detail agent_detail_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_detail
    ADD CONSTRAINT agent_detail_pkey PRIMARY KEY (pk);


--
-- TOC entry 5568 (class 2606 OID 44110)
-- Name: agent_fingerprint agent_fingerprint_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_fingerprint
    ADD CONSTRAINT agent_fingerprint_pkey PRIMARY KEY (pk);


--
-- TOC entry 5570 (class 2606 OID 44112)
-- Name: agent_passport agent_passport_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_passport
    ADD CONSTRAINT agent_passport_pkey PRIMARY KEY (pk);


--
-- TOC entry 5576 (class 2606 OID 44114)
-- Name: agility_integration_log_ agility_integration_log__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agility_integration_log_
    ADD CONSTRAINT agility_integration_log__pkey PRIMARY KEY (pk);


--
-- TOC entry 5578 (class 2606 OID 44116)
-- Name: agility_push_status agility_push_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agility_push_status
    ADD CONSTRAINT agility_push_status_pkey PRIMARY KEY (pk);


--
-- TOC entry 5580 (class 2606 OID 44118)
-- Name: area area_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- TOC entry 5586 (class 2606 OID 44120)
-- Name: attachment_ attachment__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.attachment_
    ADD CONSTRAINT attachment__pkey PRIMARY KEY (pk);


--
-- TOC entry 5588 (class 2606 OID 44122)
-- Name: authentication_mode authentication_mode_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.authentication_mode
    ADD CONSTRAINT authentication_mode_pkey PRIMARY KEY (pk);


--
-- TOC entry 5590 (class 2606 OID 44124)
-- Name: b2b_location b2b_location_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_location
    ADD CONSTRAINT b2b_location_pkey PRIMARY KEY (pk);


--
-- TOC entry 5592 (class 2606 OID 44126)
-- Name: b2b_log b2b_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT b2b_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5594 (class 2606 OID 44128)
-- Name: b2b_request_approval b2b_request_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_request_approval
    ADD CONSTRAINT b2b_request_approval_pkey PRIMARY KEY (pk);


--
-- TOC entry 5596 (class 2606 OID 44130)
-- Name: banned_ banned__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.banned_
    ADD CONSTRAINT banned__pkey PRIMARY KEY (pk);


--
-- TOC entry 5598 (class 2606 OID 44132)
-- Name: basic_data basic_data_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.basic_data
    ADD CONSTRAINT basic_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5602 (class 2606 OID 44134)
-- Name: bfp_failure_log bfp_failure_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bfp_failure_log
    ADD CONSTRAINT bfp_failure_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5606 (class 2606 OID 44136)
-- Name: bfp_sync_log bfp_sync_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bfp_sync_log
    ADD CONSTRAINT bfp_sync_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5614 (class 2606 OID 44138)
-- Name: blacklist_history blacklist_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklist_history
    ADD CONSTRAINT blacklist_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5616 (class 2606 OID 44140)
-- Name: blacklist_reason blacklist_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklist_reason
    ADD CONSTRAINT blacklist_reason_pkey PRIMARY KEY (pk);


--
-- TOC entry 5618 (class 2606 OID 44142)
-- Name: blacklisted_data blacklisted_data_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_data
    ADD CONSTRAINT blacklisted_data_pkey PRIMARY KEY (pk);


--
-- TOC entry 5623 (class 2606 OID 44144)
-- Name: blacklisted_name blacklisted_name_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_name
    ADD CONSTRAINT blacklisted_name_pkey PRIMARY KEY (pk);


--
-- TOC entry 5627 (class 2606 OID 44146)
-- Name: blacklisted_name_settings blacklisted_name_settings_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_name_settings
    ADD CONSTRAINT blacklisted_name_settings_pkey PRIMARY KEY (pk);


--
-- TOC entry 5631 (class 2606 OID 44148)
-- Name: bundle_type bundle_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bundle_type
    ADD CONSTRAINT bundle_type_pkey PRIMARY KEY (pk);


--
-- TOC entry 5633 (class 2606 OID 44150)
-- Name: churn_detail churn_detail_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.churn_detail
    ADD CONSTRAINT churn_detail_pkey PRIMARY KEY (pk);


--
-- TOC entry 5635 (class 2606 OID 44152)
-- Name: churn_msisdn churn_msisdn_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.churn_msisdn
    ADD CONSTRAINT churn_msisdn_pkey PRIMARY KEY (pk);


--
-- TOC entry 5641 (class 2606 OID 44154)
-- Name: client_activity_log client_activity_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.client_activity_log
    ADD CONSTRAINT client_activity_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5643 (class 2606 OID 44156)
-- Name: client_lock_out_log client_lock_out_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.client_lock_out_log
    ADD CONSTRAINT client_lock_out_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5645 (class 2606 OID 44158)
-- Name: community_ community__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.community_
    ADD CONSTRAINT community__pkey PRIMARY KEY (pk);


--
-- TOC entry 5649 (class 2606 OID 44160)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 5657 (class 2606 OID 44162)
-- Name: crm_log crm_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.crm_log
    ADD CONSTRAINT crm_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5659 (class 2606 OID 44164)
-- Name: crm_push_status crm_push_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.crm_push_status
    ADD CONSTRAINT crm_push_status_pkey PRIMARY KEY (id);


--
-- TOC entry 5661 (class 2606 OID 44166)
-- Name: dealer_division dealer_division_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dealer_division
    ADD CONSTRAINT dealer_division_pkey PRIMARY KEY (pk);


--
-- TOC entry 5663 (class 2606 OID 44168)
-- Name: dealer_exclusion_list dealer_exclusion_list_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dealer_exclusion_list
    ADD CONSTRAINT dealer_exclusion_list_pkey PRIMARY KEY (pk);


--
-- TOC entry 5665 (class 2606 OID 44170)
-- Name: dealer_type dealer_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dealer_type
    ADD CONSTRAINT dealer_type_pkey PRIMARY KEY (pk);


--
-- TOC entry 5681 (class 2606 OID 44172)
-- Name: device_license_quota device_license_quota_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_license_quota
    ADD CONSTRAINT device_license_quota_pkey PRIMARY KEY (pk);


--
-- TOC entry 5719 (class 2606 OID 44174)
-- Name: device_owner device_owner_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_owner
    ADD CONSTRAINT device_owner_pkey PRIMARY KEY (pk);


--
-- TOC entry 5679 (class 2606 OID 44176)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (id);


--
-- TOC entry 5721 (class 2606 OID 44178)
-- Name: device_requisition_approval device_requisition_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_approval
    ADD CONSTRAINT device_requisition_approval_pkey PRIMARY KEY (pk);


--
-- TOC entry 5723 (class 2606 OID 44180)
-- Name: device_requisition_request device_requisition_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_request
    ADD CONSTRAINT device_requisition_request_pkey PRIMARY KEY (pk);


--
-- TOC entry 5725 (class 2606 OID 44182)
-- Name: device_specific_setting device_specific_setting_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_specific_setting
    ADD CONSTRAINT device_specific_setting_pkey PRIMARY KEY (pk);


--
-- TOC entry 5729 (class 2606 OID 44184)
-- Name: device_status device_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_status
    ADD CONSTRAINT device_status_pkey PRIMARY KEY (id);


--
-- TOC entry 5753 (class 2606 OID 44186)
-- Name: device_tag_request_approval device_tag_request_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request_approval
    ADD CONSTRAINT device_tag_request_approval_pkey PRIMARY KEY (pk);


--
-- TOC entry 5751 (class 2606 OID 44188)
-- Name: device_tag_request device_tag_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT device_tag_request_pkey PRIMARY KEY (pk);


--
-- TOC entry 5731 (class 2606 OID 44190)
-- Name: device_type device_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_type
    ADD CONSTRAINT device_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5755 (class 2606 OID 44192)
-- Name: dispute dispute_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dispute
    ADD CONSTRAINT dispute_pkey PRIMARY KEY (pk);


--
-- TOC entry 5757 (class 2606 OID 44194)
-- Name: duplicate_node duplicate_node_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.duplicate_node
    ADD CONSTRAINT duplicate_node_pkey PRIMARY KEY (id);


--
-- TOC entry 5671 (class 2606 OID 44196)
-- Name: dynamic_data dynamic_data_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dynamic_data
    ADD CONSTRAINT dynamic_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5760 (class 2606 OID 44198)
-- Name: enrollment_log enrollment_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.enrollment_log
    ADD CONSTRAINT enrollment_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5683 (class 2606 OID 44200)
-- Name: enrollment_ref enrollment_ref_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.enrollment_ref
    ADD CONSTRAINT enrollment_ref_pkey PRIMARY KEY (id);


--
-- TOC entry 5764 (class 2606 OID 44202)
-- Name: failed_reg_notify_log failed_reg_notify_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.failed_reg_notify_log
    ADD CONSTRAINT failed_reg_notify_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5766 (class 2606 OID 44204)
-- Name: faq_information faq_information_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.faq_information
    ADD CONSTRAINT faq_information_pkey PRIMARY KEY (pk);


--
-- TOC entry 5768 (class 2606 OID 44206)
-- Name: fault fault_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fault
    ADD CONSTRAINT fault_pkey PRIMARY KEY (id);


--
-- TOC entry 5770 (class 2606 OID 44208)
-- Name: field_edit_details field_edit_details_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.field_edit_details
    ADD CONSTRAINT field_edit_details_pkey PRIMARY KEY (pk);


--
-- TOC entry 5774 (class 2606 OID 44210)
-- Name: field_edit_reason field_edit_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.field_edit_reason
    ADD CONSTRAINT field_edit_reason_pkey PRIMARY KEY (pk);


--
-- TOC entry 5776 (class 2606 OID 44212)
-- Name: fm_license_approval_history fm_license_approval_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_approval_history
    ADD CONSTRAINT fm_license_approval_history_pkey PRIMARY KEY (pk);


--
-- TOC entry 5778 (class 2606 OID 44214)
-- Name: fm_license_quota fm_license_quota_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_quota
    ADD CONSTRAINT fm_license_quota_pkey PRIMARY KEY (pk);


--
-- TOC entry 5780 (class 2606 OID 44216)
-- Name: fm_license_request fm_license_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_request
    ADD CONSTRAINT fm_license_request_pkey PRIMARY KEY (pk);


--
-- TOC entry 5782 (class 2606 OID 44218)
-- Name: geo_fence_log geo_fence_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.geo_fence_log
    ADD CONSTRAINT geo_fence_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5784 (class 2606 OID 44220)
-- Name: heart_beat heart_beat_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.heart_beat
    ADD CONSTRAINT heart_beat_pkey PRIMARY KEY (id);


--
-- TOC entry 5733 (class 2606 OID 44222)
-- Name: heart_beat_status heart_beat_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.heart_beat_status
    ADD CONSTRAINT heart_beat_status_pkey PRIMARY KEY (pk);


--
-- TOC entry 5790 (class 2606 OID 44224)
-- Name: issue_log_attachment issue_log_attachment_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log_attachment
    ADD CONSTRAINT issue_log_attachment_pkey PRIMARY KEY (pk);


--
-- TOC entry 5786 (class 2606 OID 44226)
-- Name: issue_log issue_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT issue_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5792 (class 2606 OID 44228)
-- Name: issue_summary issue_summary_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_summary
    ADD CONSTRAINT issue_summary_pkey PRIMARY KEY (pk);


--
-- TOC entry 5794 (class 2606 OID 44230)
-- Name: kit_mapping_approval kit_mapping_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_mapping_approval
    ADD CONSTRAINT kit_mapping_approval_pkey PRIMARY KEY (pk);


--
-- TOC entry 5796 (class 2606 OID 44232)
-- Name: kit_marker kit_marker_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_marker
    ADD CONSTRAINT kit_marker_pkey PRIMARY KEY (id);


--
-- TOC entry 5798 (class 2606 OID 44234)
-- Name: kit_retrieval_history kit_retrieval_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_retrieval_history
    ADD CONSTRAINT kit_retrieval_history_pkey PRIMARY KEY (pk);


--
-- TOC entry 5800 (class 2606 OID 44236)
-- Name: kit_retrieval_reason kit_retrieval_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_retrieval_reason
    ADD CONSTRAINT kit_retrieval_reason_pkey PRIMARY KEY (pk);


--
-- TOC entry 5802 (class 2606 OID 44238)
-- Name: kit_sync_mode kit_sync_mode_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_sync_mode
    ADD CONSTRAINT kit_sync_mode_pkey PRIMARY KEY (id);


--
-- TOC entry 5806 (class 2606 OID 44240)
-- Name: kit_type kit_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_type
    ADD CONSTRAINT kit_type_pkey PRIMARY KEY (pk);


--
-- TOC entry 5808 (class 2606 OID 44242)
-- Name: km_privilege km_privilege_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_privilege
    ADD CONSTRAINT km_privilege_pkey PRIMARY KEY (pk);


--
-- TOC entry 5814 (class 2606 OID 44244)
-- Name: km_role_community_mapper km_role_community_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_community_mapper
    ADD CONSTRAINT km_role_community_mapper_pkey PRIMARY KEY (pk);


--
-- TOC entry 5818 (class 2606 OID 44246)
-- Name: km_role_division km_role_division_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_division
    ADD CONSTRAINT km_role_division_pkey PRIMARY KEY (pk);


--
-- TOC entry 5810 (class 2606 OID 44248)
-- Name: km_role km_role_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role
    ADD CONSTRAINT km_role_pkey PRIMARY KEY (pk);


--
-- TOC entry 5820 (class 2606 OID 44250)
-- Name: km_role_privilege km_role_privilege_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_privilege
    ADD CONSTRAINT km_role_privilege_pkey PRIMARY KEY (role_fk, privilege_fk);


--
-- TOC entry 5824 (class 2606 OID 44252)
-- Name: km_role_workflow_mapper km_role_workflow_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_workflow_mapper
    ADD CONSTRAINT km_role_workflow_mapper_pkey PRIMARY KEY (pk);


--
-- TOC entry 5826 (class 2606 OID 44254)
-- Name: km_user_dealer_mapper km_user_dealer_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_dealer_mapper
    ADD CONSTRAINT km_user_dealer_mapper_pkey PRIMARY KEY (pk);


--
-- TOC entry 5828 (class 2606 OID 44256)
-- Name: km_user_history_ km_user_history__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_history_
    ADD CONSTRAINT km_user_history__pkey PRIMARY KEY (pk);


--
-- TOC entry 5737 (class 2606 OID 44258)
-- Name: km_user km_user_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT km_user_pkey PRIMARY KEY (pk);


--
-- TOC entry 5830 (class 2606 OID 44260)
-- Name: km_user_region_mapper km_user_region_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_region_mapper
    ADD CONSTRAINT km_user_region_mapper_pkey PRIMARY KEY (pk);


--
-- TOC entry 5832 (class 2606 OID 44262)
-- Name: km_user_vtu km_user_vtu_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_vtu
    ADD CONSTRAINT km_user_vtu_pkey PRIMARY KEY (pk);


--
-- TOC entry 5836 (class 2606 OID 44264)
-- Name: kyc_agility_mapper kyc_agility_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_agility_mapper
    ADD CONSTRAINT kyc_agility_mapper_pkey PRIMARY KEY (id);


--
-- TOC entry 5841 (class 2606 OID 44266)
-- Name: kyc_blacklist kyc_blacklist_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_blacklist
    ADD CONSTRAINT kyc_blacklist_pkey PRIMARY KEY (pk);


--
-- TOC entry 5844 (class 2606 OID 44268)
-- Name: kyc_broadcast kyc_broadcast_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT kyc_broadcast_pkey PRIMARY KEY (pk);


--
-- TOC entry 5687 (class 2606 OID 44270)
-- Name: kyc_dealer kyc_dealer_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT kyc_dealer_pkey PRIMARY KEY (pk);


--
-- TOC entry 5690 (class 2606 OID 44272)
-- Name: lga lga_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.lga
    ADD CONSTRAINT lga_pkey PRIMARY KEY (id);


--
-- TOC entry 5846 (class 2606 OID 44274)
-- Name: license license_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.license
    ADD CONSTRAINT license_pkey PRIMARY KEY (id);


--
-- TOC entry 5848 (class 2606 OID 44276)
-- Name: log_ log__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.log_
    ADD CONSTRAINT log__pkey PRIMARY KEY (pk);


--
-- TOC entry 5851 (class 2606 OID 44278)
-- Name: meta_data meta_data_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.meta_data
    ADD CONSTRAINT meta_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5855 (class 2606 OID 44280)
-- Name: msisdn_detail msisdn_detail_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_detail
    ADD CONSTRAINT msisdn_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 5859 (class 2606 OID 44282)
-- Name: msisdn_provision_status_log msisdn_provision_status_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_provision_status_log
    ADD CONSTRAINT msisdn_provision_status_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5857 (class 2606 OID 44284)
-- Name: msisdn_provision_status msisdn_provision_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_provision_status
    ADD CONSTRAINT msisdn_provision_status_pkey PRIMARY KEY (pk);


--
-- TOC entry 5866 (class 2606 OID 44286)
-- Name: msisdn_status_log msisdn_status_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_status_log
    ADD CONSTRAINT msisdn_status_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5861 (class 2606 OID 44288)
-- Name: msisdn_status msisdn_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_status
    ADD CONSTRAINT msisdn_status_pkey PRIMARY KEY (id);


--
-- TOC entry 6132 (class 2606 OID 65880)
-- Name: new_kd_4 new_kd_4_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.new_kd_4
    ADD CONSTRAINT new_kd_4_pkey PRIMARY KEY (sn);


--
-- TOC entry 6134 (class 2606 OID 65888)
-- Name: new_kd_5 new_kd_5_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.new_kd_5
    ADD CONSTRAINT new_kd_5_pkey PRIMARY KEY (sn);


--
-- TOC entry 6136 (class 2606 OID 65901)
-- Name: new_kd_6 new_kd_6_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.new_kd_6
    ADD CONSTRAINT new_kd_6_pkey PRIMARY KEY (sn);


--
-- TOC entry 5880 (class 2606 OID 44290)
-- Name: nin_enrollment_log nin_enrollment_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.nin_enrollment_log
    ADD CONSTRAINT nin_enrollment_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5882 (class 2606 OID 44292)
-- Name: node_assignment_history node_assignment_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT node_assignment_history_pkey PRIMARY KEY (pk);


--
-- TOC entry 5697 (class 2606 OID 44294)
-- Name: node_assignment node_assignment_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT node_assignment_pkey PRIMARY KEY (pk);


--
-- TOC entry 5693 (class 2606 OID 44296)
-- Name: node node_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- TOC entry 5884 (class 2606 OID 44298)
-- Name: onboarding_status onboarding_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.onboarding_status
    ADD CONSTRAINT onboarding_status_pkey PRIMARY KEY (pk);


--
-- TOC entry 5886 (class 2606 OID 44300)
-- Name: otp_status_record otp_status_record_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.otp_status_record
    ADD CONSTRAINT otp_status_record_pkey PRIMARY KEY (pk);


--
-- TOC entry 5699 (class 2606 OID 44302)
-- Name: outlet outlet_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.outlet
    ADD CONSTRAINT outlet_pkey PRIMARY KEY (pk);


--
-- TOC entry 5888 (class 2606 OID 44304)
-- Name: outlet_type outlet_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.outlet_type
    ADD CONSTRAINT outlet_type_pkey PRIMARY KEY (pk);


--
-- TOC entry 5890 (class 2606 OID 44306)
-- Name: page_ page__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.page_
    ADD CONSTRAINT page__pkey PRIMARY KEY (pk);


--
-- TOC entry 5872 (class 2606 OID 44308)
-- Name: passport_detail passport_detail_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport_detail
    ADD CONSTRAINT passport_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 5868 (class 2606 OID 44310)
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (id);


--
-- TOC entry 5894 (class 2606 OID 44312)
-- Name: password_history_log password_history_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.password_history_log
    ADD CONSTRAINT password_history_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5896 (class 2606 OID 44314)
-- Name: password_policy password_policy_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.password_policy
    ADD CONSTRAINT password_policy_pkey PRIMARY KEY (pk);


--
-- TOC entry 5898 (class 2606 OID 44316)
-- Name: phone_number_status phone_number_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.phone_number_status
    ADD CONSTRAINT phone_number_status_pkey PRIMARY KEY (id);


--
-- TOC entry 5900 (class 2606 OID 44318)
-- Name: quarantined_owc_record quarantined_owc_record_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.quarantined_owc_record
    ADD CONSTRAINT quarantined_owc_record_pkey PRIMARY KEY (pk);


--
-- TOC entry 5745 (class 2606 OID 44320)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 5902 (class 2606 OID 44322)
-- Name: registration_signature registration_signature_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.registration_signature
    ADD CONSTRAINT registration_signature_pkey PRIMARY KEY (pk);


--
-- TOC entry 5904 (class 2606 OID 44324)
-- Name: retried_bfp_sync_log retried_bfp_sync_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.retried_bfp_sync_log
    ADD CONSTRAINT retried_bfp_sync_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5906 (class 2606 OID 44326)
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- TOC entry 5908 (class 2606 OID 44328)
-- Name: serial_msisdn_mapper serial_msisdn_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.serial_msisdn_mapper
    ADD CONSTRAINT serial_msisdn_mapper_pkey PRIMARY KEY (id);


--
-- TOC entry 5911 (class 2606 OID 44330)
-- Name: setting setting_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.setting
    ADD CONSTRAINT setting_pkey PRIMARY KEY (id);


--
-- TOC entry 5876 (class 2606 OID 44332)
-- Name: signature signature_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.signature
    ADD CONSTRAINT signature_pkey PRIMARY KEY (id);


--
-- TOC entry 5915 (class 2606 OID 44334)
-- Name: sim_swap_log sim_swap_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.sim_swap_log
    ADD CONSTRAINT sim_swap_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5676 (class 2606 OID 44336)
-- Name: sms_activation_request sms_activation_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.sms_activation_request
    ADD CONSTRAINT sms_activation_request_pkey PRIMARY KEY (id);


--
-- TOC entry 5917 (class 2606 OID 44338)
-- Name: social_media social_media_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.social_media
    ADD CONSTRAINT social_media_pkey PRIMARY KEY (id);


--
-- TOC entry 5919 (class 2606 OID 44340)
-- Name: special_data special_data_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.special_data
    ADD CONSTRAINT special_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5703 (class 2606 OID 44342)
-- Name: state state_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);


--
-- TOC entry 5921 (class 2606 OID 44344)
-- Name: subscriber_detail subscriber_detail_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT subscriber_detail_pkey PRIMARY KEY (pk);


--
-- TOC entry 5927 (class 2606 OID 44346)
-- Name: subscriber_search_history subscriber_search_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_search_history
    ADD CONSTRAINT subscriber_search_history_pkey PRIMARY KEY (pk);


--
-- TOC entry 5929 (class 2606 OID 44348)
-- Name: subscriber_search_params subscriber_search_params_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_search_params
    ADD CONSTRAINT subscriber_search_params_pkey PRIMARY KEY (pk);


--
-- TOC entry 5931 (class 2606 OID 44350)
-- Name: tag_history tag_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.tag_history
    ADD CONSTRAINT tag_history_pkey PRIMARY KEY (pk);


--
-- TOC entry 5933 (class 2606 OID 44352)
-- Name: telecom_master_records telecom_master_records_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.telecom_master_records
    ADD CONSTRAINT telecom_master_records_pkey PRIMARY KEY (id);


--
-- TOC entry 5709 (class 2606 OID 44354)
-- Name: territory territory_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.territory
    ADD CONSTRAINT territory_pkey PRIMARY KEY (id);


--
-- TOC entry 5936 (class 2606 OID 44356)
-- Name: trade_partners_state trade_partners_state_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.trade_partners_state
    ADD CONSTRAINT trade_partners_state_pkey PRIMARY KEY (trade_partners_fk, state_fk);


--
-- TOC entry 5608 (class 2606 OID 44358)
-- Name: user_id uk76uk7fqn0c5k0e2sbt1cm0kee; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_id
    ADD CONSTRAINT uk76uk7fqn0c5k0e2sbt1cm0kee UNIQUE (unique_id);


--
-- TOC entry 5923 (class 2606 OID 44360)
-- Name: subscriber_detail uk_2onlugbaqbauqtnbecenle13p; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT uk_2onlugbaqbauqtnbecenle13p UNIQUE (msisdn);


--
-- TOC entry 5747 (class 2606 OID 44362)
-- Name: region uk_5l9evnjyj8g38e7ls3ywfovuk; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.region
    ADD CONSTRAINT uk_5l9evnjyj8g38e7ls3ywfovuk UNIQUE (name);


--
-- TOC entry 5610 (class 2606 OID 44364)
-- Name: user_id uk_76uk7fqn0c5k0e2sbt1cm0kee; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_id
    ADD CONSTRAINT uk_76uk7fqn0c5k0e2sbt1cm0kee UNIQUE (unique_id);


--
-- TOC entry 5713 (class 2606 OID 44366)
-- Name: zone uk_7ijow8s6exhorub4sdyf9m4cq; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone
    ADD CONSTRAINT uk_7ijow8s6exhorub4sdyf9m4cq UNIQUE (name);


--
-- TOC entry 5667 (class 2606 OID 44368)
-- Name: dealer_type uk_7w46cj6x1k8nyp2ph4d1s5ak9; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dealer_type
    ADD CONSTRAINT uk_7w46cj6x1k8nyp2ph4d1s5ak9 UNIQUE (name);


--
-- TOC entry 5629 (class 2606 OID 44370)
-- Name: blacklisted_name_settings uk_8e97xfn2f4mn1v18aqjgfg94m; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_name_settings
    ADD CONSTRAINT uk_8e97xfn2f4mn1v18aqjgfg94m UNIQUE (name_);


--
-- TOC entry 5685 (class 2606 OID 44372)
-- Name: enrollment_ref uk_91d1715lbbbe2m1juvqst2i8v; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.enrollment_ref
    ADD CONSTRAINT uk_91d1715lbbbe2m1juvqst2i8v UNIQUE (device_id);


--
-- TOC entry 5625 (class 2606 OID 44374)
-- Name: blacklisted_name uk_ah9x8xj2jj4usk61mkb66osah; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_name
    ADD CONSTRAINT uk_ah9x8xj2jj4usk61mkb66osah UNIQUE (name_);


--
-- TOC entry 5739 (class 2606 OID 44376)
-- Name: km_user uk_b6biny6f95je2cv8kui9k24b4; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT uk_b6biny6f95je2cv8kui9k24b4 UNIQUE (email_address);


--
-- TOC entry 5788 (class 2606 OID 44378)
-- Name: issue_log uk_b6k6uu1tw7wedxsviw7nrrm95; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT uk_b6k6uu1tw7wedxsviw7nrrm95 UNIQUE (issue_id);


--
-- TOC entry 5974 (class 2606 OID 44380)
-- Name: workflow uk_b872ns64qbqy5lpw5uj3m2w2j; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.workflow
    ADD CONSTRAINT uk_b872ns64qbqy5lpw5uj3m2w2j UNIQUE (name);


--
-- TOC entry 5582 (class 2606 OID 44382)
-- Name: area uk_bwug04loft70r5alm613yepyp; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.area
    ADD CONSTRAINT uk_bwug04loft70r5alm613yepyp UNIQUE (name, lga_fk);


--
-- TOC entry 5946 (class 2606 OID 44384)
-- Name: vendor_type uk_bynomtv0055ip4wpybfy4beha; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vendor_type
    ADD CONSTRAINT uk_bynomtv0055ip4wpybfy4beha UNIQUE (code);


--
-- TOC entry 5673 (class 2606 OID 44386)
-- Name: dynamic_data uk_cto6xw72ra8jft1kk5g0pny2l; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dynamic_data
    ADD CONSTRAINT uk_cto6xw72ra8jft1kk5g0pny2l UNIQUE (basic_data_fk);


--
-- TOC entry 5870 (class 2606 OID 44388)
-- Name: passport uk_dfkd82jpjjviyp67tmcehsy5k; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport
    ADD CONSTRAINT uk_dfkd82jpjjviyp67tmcehsy5k UNIQUE (basic_data_fk);


--
-- TOC entry 5853 (class 2606 OID 44390)
-- Name: meta_data uk_e7obcyprwlwonubm4h5xfvy1i; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.meta_data
    ADD CONSTRAINT uk_e7obcyprwlwonubm4h5xfvy1i UNIQUE (basic_data_fk);


--
-- TOC entry 5834 (class 2606 OID 44392)
-- Name: km_user_vtu uk_eeun4o0pt5d996mhgjfxsneu; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_vtu
    ADD CONSTRAINT uk_eeun4o0pt5d996mhgjfxsneu UNIQUE (vtu_number);


--
-- TOC entry 5572 (class 2606 OID 44394)
-- Name: agent_passport uk_ejl4n4pm7lob93uf9xc4qsixw; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_passport
    ADD CONSTRAINT uk_ejl4n4pm7lob93uf9xc4qsixw UNIQUE (user_fk);


--
-- TOC entry 5695 (class 2606 OID 44396)
-- Name: node uk_ejscjsp5665tbcxst0kkp8ai4; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT uk_ejscjsp5665tbcxst0kkp8ai4 UNIQUE (data_list_tag_name);


--
-- TOC entry 5878 (class 2606 OID 44398)
-- Name: signature uk_f4apgvhvdgkqh6jl0p1knqsxq; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.signature
    ADD CONSTRAINT uk_f4apgvhvdgkqh6jl0p1knqsxq UNIQUE (basic_data_fk);


--
-- TOC entry 5938 (class 2606 OID 44400)
-- Name: user_act_deact_reason uk_f7e1lrhgrqiq1dhnunmt1qr9l; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_act_deact_reason
    ADD CONSTRAINT uk_f7e1lrhgrqiq1dhnunmt1qr9l UNIQUE (name);


--
-- TOC entry 5647 (class 2606 OID 44402)
-- Name: community_ uk_foya01jmrbm7rf02a0nvkj71b; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.community_
    ADD CONSTRAINT uk_foya01jmrbm7rf02a0nvkj71b UNIQUE (name);


--
-- TOC entry 5864 (class 2606 OID 44404)
-- Name: msisdn_status uk_fsl5mvdddq9p85kd94mvyy324; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_status
    ADD CONSTRAINT uk_fsl5mvdddq9p85kd94mvyy324 UNIQUE (msisdn_detail_fk);


--
-- TOC entry 5762 (class 2606 OID 44406)
-- Name: enrollment_log uk_gur3rqtr0y8u14fx9cksnvtyy; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.enrollment_log
    ADD CONSTRAINT uk_gur3rqtr0y8u14fx9cksnvtyy UNIQUE (basic_data_fk);


--
-- TOC entry 5705 (class 2606 OID 44408)
-- Name: state uk_hivlx3rlbwdpupxc4nn58esc; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT uk_hivlx3rlbwdpupxc4nn58esc UNIQUE (code);


--
-- TOC entry 5735 (class 2606 OID 44410)
-- Name: heart_beat_status uk_i5ktnesh9neo1lvsx95h1s5ey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.heart_beat_status
    ADD CONSTRAINT uk_i5ktnesh9neo1lvsx95h1s5ey UNIQUE (ref_device_id);


--
-- TOC entry 5804 (class 2606 OID 44412)
-- Name: kit_sync_mode uk_ivjiw8s4pvixarr8aow5iyupy; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_sync_mode
    ADD CONSTRAINT uk_ivjiw8s4pvixarr8aow5iyupy UNIQUE (device_id);


--
-- TOC entry 5637 (class 2606 OID 44414)
-- Name: churn_msisdn uk_l5kkee95ja60osmpid53ri6ls; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.churn_msisdn
    ADD CONSTRAINT uk_l5kkee95ja60osmpid53ri6ls UNIQUE (msisdn);


--
-- TOC entry 5653 (class 2606 OID 44416)
-- Name: country uk_l7qlysdc1xbo69vsmueersr2k; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.country
    ADD CONSTRAINT uk_l7qlysdc1xbo69vsmueersr2k UNIQUE (name);


--
-- TOC entry 5948 (class 2606 OID 44418)
-- Name: vendor_type uk_lrsd6mi2bmiw9oy88p03xgr6t; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vendor_type
    ADD CONSTRAINT uk_lrsd6mi2bmiw9oy88p03xgr6t UNIQUE (name);


--
-- TOC entry 5968 (class 2606 OID 44420)
-- Name: whitelisted_name uk_mlvipslew9jqkd0bchv2bpy7c; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.whitelisted_name
    ADD CONSTRAINT uk_mlvipslew9jqkd0bchv2bpy7c UNIQUE (name_, category_);


--
-- TOC entry 5925 (class 2606 OID 44422)
-- Name: subscriber_detail uk_mry7chsumoivn4jua1t81tiku; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT uk_mry7chsumoivn4jua1t81tiku UNIQUE (transaction_id);


--
-- TOC entry 5816 (class 2606 OID 44424)
-- Name: km_role_community_mapper uk_n2bpwebr08qxjx5c3h61ttrf; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_community_mapper
    ADD CONSTRAINT uk_n2bpwebr08qxjx5c3h61ttrf UNIQUE (km_role_fk, community_fk);


--
-- TOC entry 5655 (class 2606 OID 44426)
-- Name: country uk_ne9s5fj7rlke6boqw3ibxsh0i; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.country
    ADD CONSTRAINT uk_ne9s5fj7rlke6boqw3ibxsh0i UNIQUE (code);


--
-- TOC entry 5741 (class 2606 OID 44428)
-- Name: km_user uk_o02jmjrn9j97sabudbyf3bef2; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT uk_o02jmjrn9j97sabudbyf3bef2 UNIQUE (orbita_id);


--
-- TOC entry 5772 (class 2606 OID 44430)
-- Name: field_edit_details uk_pu54j3hv5s5jk0jluxr59cfxf; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.field_edit_details
    ADD CONSTRAINT uk_pu54j3hv5s5jk0jluxr59cfxf UNIQUE (field_name);


--
-- TOC entry 5715 (class 2606 OID 44432)
-- Name: zone uk_pv2ixfknaoal6h55prnqmyexi; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone
    ADD CONSTRAINT uk_pv2ixfknaoal6h55prnqmyexi UNIQUE (code);


--
-- TOC entry 5892 (class 2606 OID 44434)
-- Name: page_ uk_q2tiui18tmymon68hbb3l3nvc; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.page_
    ADD CONSTRAINT uk_q2tiui18tmymon68hbb3l3nvc UNIQUE (name, community_fk);


--
-- TOC entry 5669 (class 2606 OID 44436)
-- Name: dealer_type uk_qygsuj1l5hs8bki4f65nvkmun; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dealer_type
    ADD CONSTRAINT uk_qygsuj1l5hs8bki4f65nvkmun UNIQUE (code);


--
-- TOC entry 5707 (class 2606 OID 44438)
-- Name: state uk_r5c4xwjw40vx7uq1ljwqrksa8; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT uk_r5c4xwjw40vx7uq1ljwqrksa8 UNIQUE (name);


--
-- TOC entry 5874 (class 2606 OID 44440)
-- Name: passport_detail uk_rb0euc5idfdboie9q16dmwesg; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport_detail
    ADD CONSTRAINT uk_rb0euc5idfdboie9q16dmwesg UNIQUE (signature_fk);


--
-- TOC entry 5812 (class 2606 OID 44442)
-- Name: km_role uk_reuc4863tmuwej0crv1wrphwn; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role
    ADD CONSTRAINT uk_reuc4863tmuwej0crv1wrphwn UNIQUE (role);


--
-- TOC entry 5749 (class 2606 OID 44444)
-- Name: region uk_s8f0cjqgsreuvo2ph8mj3m5ej; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.region
    ADD CONSTRAINT uk_s8f0cjqgsreuvo2ph8mj3m5ej UNIQUE (code);


--
-- TOC entry 5838 (class 2606 OID 44446)
-- Name: kyc_agility_mapper uk_su0haej69n1geeb2w0uqal6xc; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_agility_mapper
    ADD CONSTRAINT uk_su0haej69n1geeb2w0uqal6xc UNIQUE (basic_data_fk);


--
-- TOC entry 5913 (class 2606 OID 44448)
-- Name: setting uk_tjkxxbqile6d4epwwmuon7g6e; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.setting
    ADD CONSTRAINT uk_tjkxxbqile6d4epwwmuon7g6e UNIQUE (name);


--
-- TOC entry 5584 (class 2606 OID 44450)
-- Name: area ukbwug04loft70r5alm613yepyp; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.area
    ADD CONSTRAINT ukbwug04loft70r5alm613yepyp UNIQUE (name, lga_fk);


--
-- TOC entry 5727 (class 2606 OID 44452)
-- Name: device_specific_setting ukmjctsxv04i031c8ugahhemtt; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_specific_setting
    ADD CONSTRAINT ukmjctsxv04i031c8ugahhemtt UNIQUE (enrollment_ref_fk, setting_name);


--
-- TOC entry 5970 (class 2606 OID 44454)
-- Name: whitelisted_name ukmlvipslew9jqkd0bchv2bpy7c; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.whitelisted_name
    ADD CONSTRAINT ukmlvipslew9jqkd0bchv2bpy7c UNIQUE (name_, category_);


--
-- TOC entry 5940 (class 2606 OID 44456)
-- Name: user_act_deact_reason user_act_deact_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_act_deact_reason
    ADD CONSTRAINT user_act_deact_reason_pkey PRIMARY KEY (pk);


--
-- TOC entry 5942 (class 2606 OID 44458)
-- Name: user_auth_mode_mapper user_auth_mode_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_auth_mode_mapper
    ADD CONSTRAINT user_auth_mode_mapper_pkey PRIMARY KEY (pk);


--
-- TOC entry 5944 (class 2606 OID 44460)
-- Name: user_creation_request user_creation_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT user_creation_request_pkey PRIMARY KEY (pk);


--
-- TOC entry 5612 (class 2606 OID 44462)
-- Name: user_id user_id_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_id
    ADD CONSTRAINT user_id_pkey PRIMARY KEY (id);


--
-- TOC entry 5822 (class 2606 OID 44464)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_fk, role_fk);


--
-- TOC entry 5950 (class 2606 OID 44466)
-- Name: vendor_type vendor_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vendor_type
    ADD CONSTRAINT vendor_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5952 (class 2606 OID 44468)
-- Name: version_log version_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.version_log
    ADD CONSTRAINT version_log_pkey PRIMARY KEY (pk);


--
-- TOC entry 5954 (class 2606 OID 44470)
-- Name: vl_ vl__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vl_
    ADD CONSTRAINT vl__pkey PRIMARY KEY (pk);


--
-- TOC entry 5956 (class 2606 OID 44472)
-- Name: vr_ vr__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vr_
    ADD CONSTRAINT vr__pkey PRIMARY KEY (pk);


--
-- TOC entry 5958 (class 2606 OID 44474)
-- Name: vtu_category vtu_category_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_category
    ADD CONSTRAINT vtu_category_pkey PRIMARY KEY (pk);


--
-- TOC entry 5962 (class 2606 OID 44476)
-- Name: vtu_request_approval vtu_request_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request_approval
    ADD CONSTRAINT vtu_request_approval_pkey PRIMARY KEY (pk);


--
-- TOC entry 5960 (class 2606 OID 44478)
-- Name: vtu_request vtu_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request
    ADD CONSTRAINT vtu_request_pkey PRIMARY KEY (pk);


--
-- TOC entry 5964 (class 2606 OID 44480)
-- Name: vtu_transaction_logs vtu_transaction_logs_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_transaction_logs
    ADD CONSTRAINT vtu_transaction_logs_pkey PRIMARY KEY (pk);


--
-- TOC entry 5966 (class 2606 OID 44482)
-- Name: watch_list watch_list_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.watch_list
    ADD CONSTRAINT watch_list_pkey PRIMARY KEY (pk);


--
-- TOC entry 5972 (class 2606 OID 44484)
-- Name: whitelisted_name whitelisted_name_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.whitelisted_name
    ADD CONSTRAINT whitelisted_name_pkey PRIMARY KEY (pk);


--
-- TOC entry 5976 (class 2606 OID 44486)
-- Name: workflow workflow_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.workflow
    ADD CONSTRAINT workflow_pkey PRIMARY KEY (pk);


--
-- TOC entry 5978 (class 2606 OID 44488)
-- Name: wsq_image wsq_image_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.wsq_image
    ADD CONSTRAINT wsq_image_pkey PRIMARY KEY (id);


--
-- TOC entry 5980 (class 2606 OID 44490)
-- Name: zonal_hourly_sync zonal_hourly_sync_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zonal_hourly_sync
    ADD CONSTRAINT zonal_hourly_sync_pkey PRIMARY KEY (pk);


--
-- TOC entry 5717 (class 2606 OID 44492)
-- Name: zone zone_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone
    ADD CONSTRAINT zone_pkey PRIMARY KEY (id);


--
-- TOC entry 5982 (class 2606 OID 44494)
-- Name: zone_state_mapper zone_state_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone_state_mapper
    ADD CONSTRAINT zone_state_mapper_pkey PRIMARY KEY (id);


--
-- TOC entry 5984 (class 2606 OID 44496)
-- Name: zz_agent_detail zz_agent_detail_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_agent_detail
    ADD CONSTRAINT zz_agent_detail_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 5986 (class 2606 OID 44498)
-- Name: zz_area zz_area_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_area
    ADD CONSTRAINT zz_area_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 5988 (class 2606 OID 44500)
-- Name: zz_attachment_ zz_attachment__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_attachment_
    ADD CONSTRAINT zz_attachment__pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 5990 (class 2606 OID 44502)
-- Name: zz_auditor zz_auditor_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_auditor
    ADD CONSTRAINT zz_auditor_pkey PRIMARY KEY (rev_no);


--
-- TOC entry 5992 (class 2606 OID 44504)
-- Name: zz_authentication_mode zz_authentication_mode_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_authentication_mode
    ADD CONSTRAINT zz_authentication_mode_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 5994 (class 2606 OID 44506)
-- Name: zz_b2b_location zz_b2b_location_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_b2b_location
    ADD CONSTRAINT zz_b2b_location_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 5996 (class 2606 OID 44508)
-- Name: zz_b2b_log zz_b2b_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_b2b_log
    ADD CONSTRAINT zz_b2b_log_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 5998 (class 2606 OID 44510)
-- Name: zz_b2b_request_approval zz_b2b_request_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_b2b_request_approval
    ADD CONSTRAINT zz_b2b_request_approval_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6000 (class 2606 OID 44512)
-- Name: zz_blacklist_reason zz_blacklist_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_blacklist_reason
    ADD CONSTRAINT zz_blacklist_reason_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6002 (class 2606 OID 44514)
-- Name: zz_blacklisted_name zz_blacklisted_name_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_blacklisted_name
    ADD CONSTRAINT zz_blacklisted_name_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6004 (class 2606 OID 44516)
-- Name: zz_blacklisted_name_settings zz_blacklisted_name_settings_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_blacklisted_name_settings
    ADD CONSTRAINT zz_blacklisted_name_settings_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6006 (class 2606 OID 44518)
-- Name: zz_community_ zz_community__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_community_
    ADD CONSTRAINT zz_community__pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6008 (class 2606 OID 44520)
-- Name: zz_country zz_country_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_country
    ADD CONSTRAINT zz_country_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6010 (class 2606 OID 44522)
-- Name: zz_dealer_division zz_dealer_division_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_dealer_division
    ADD CONSTRAINT zz_dealer_division_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6012 (class 2606 OID 44524)
-- Name: zz_dealer_exclusion_list zz_dealer_exclusion_list_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_dealer_exclusion_list
    ADD CONSTRAINT zz_dealer_exclusion_list_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6014 (class 2606 OID 44526)
-- Name: zz_dealer_type zz_dealer_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_dealer_type
    ADD CONSTRAINT zz_dealer_type_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6018 (class 2606 OID 44528)
-- Name: zz_device_license_quota zz_device_license_quota_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_license_quota
    ADD CONSTRAINT zz_device_license_quota_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6020 (class 2606 OID 44530)
-- Name: zz_device_owner zz_device_owner_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_owner
    ADD CONSTRAINT zz_device_owner_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6016 (class 2606 OID 44532)
-- Name: zz_device zz_device_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device
    ADD CONSTRAINT zz_device_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6022 (class 2606 OID 44534)
-- Name: zz_device_requisition_approval zz_device_requisition_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_requisition_approval
    ADD CONSTRAINT zz_device_requisition_approval_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6024 (class 2606 OID 44536)
-- Name: zz_device_requisition_request zz_device_requisition_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_requisition_request
    ADD CONSTRAINT zz_device_requisition_request_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6026 (class 2606 OID 44538)
-- Name: zz_device_status zz_device_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_status
    ADD CONSTRAINT zz_device_status_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6030 (class 2606 OID 44540)
-- Name: zz_device_tag_request_approval zz_device_tag_request_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_tag_request_approval
    ADD CONSTRAINT zz_device_tag_request_approval_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6028 (class 2606 OID 44542)
-- Name: zz_device_tag_request zz_device_tag_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_tag_request
    ADD CONSTRAINT zz_device_tag_request_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6032 (class 2606 OID 44544)
-- Name: zz_device_type zz_device_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_type
    ADD CONSTRAINT zz_device_type_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6034 (class 2606 OID 44546)
-- Name: zz_enrollment_ref zz_enrollment_ref_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_enrollment_ref
    ADD CONSTRAINT zz_enrollment_ref_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6036 (class 2606 OID 44548)
-- Name: zz_field_edit_details zz_field_edit_details_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_field_edit_details
    ADD CONSTRAINT zz_field_edit_details_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6038 (class 2606 OID 44550)
-- Name: zz_fm_license_approval_history zz_fm_license_approval_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_fm_license_approval_history
    ADD CONSTRAINT zz_fm_license_approval_history_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6040 (class 2606 OID 44552)
-- Name: zz_fm_license_quota zz_fm_license_quota_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_fm_license_quota
    ADD CONSTRAINT zz_fm_license_quota_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6042 (class 2606 OID 44554)
-- Name: zz_fm_license_request zz_fm_license_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_fm_license_request
    ADD CONSTRAINT zz_fm_license_request_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6046 (class 2606 OID 44556)
-- Name: zz_issue_log_attachment zz_issue_log_attachment_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_issue_log_attachment
    ADD CONSTRAINT zz_issue_log_attachment_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6044 (class 2606 OID 44558)
-- Name: zz_issue_log zz_issue_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_issue_log
    ADD CONSTRAINT zz_issue_log_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6048 (class 2606 OID 44560)
-- Name: zz_issue_summary zz_issue_summary_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_issue_summary
    ADD CONSTRAINT zz_issue_summary_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6050 (class 2606 OID 44562)
-- Name: zz_kit_mapping_approval zz_kit_mapping_approval_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_mapping_approval
    ADD CONSTRAINT zz_kit_mapping_approval_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6052 (class 2606 OID 44564)
-- Name: zz_kit_retrieval_history zz_kit_retrieval_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_retrieval_history
    ADD CONSTRAINT zz_kit_retrieval_history_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6054 (class 2606 OID 44566)
-- Name: zz_kit_retrieval_reason zz_kit_retrieval_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_retrieval_reason
    ADD CONSTRAINT zz_kit_retrieval_reason_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6056 (class 2606 OID 44568)
-- Name: zz_kit_type zz_kit_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_type
    ADD CONSTRAINT zz_kit_type_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6058 (class 2606 OID 44570)
-- Name: zz_km_privilege zz_km_privilege_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_privilege
    ADD CONSTRAINT zz_km_privilege_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6062 (class 2606 OID 44572)
-- Name: zz_km_role_community_mapper zz_km_role_community_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_community_mapper
    ADD CONSTRAINT zz_km_role_community_mapper_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6064 (class 2606 OID 44574)
-- Name: zz_km_role_division zz_km_role_division_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_division
    ADD CONSTRAINT zz_km_role_division_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6060 (class 2606 OID 44576)
-- Name: zz_km_role zz_km_role_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role
    ADD CONSTRAINT zz_km_role_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6066 (class 2606 OID 44578)
-- Name: zz_km_role_privilege zz_km_role_privilege_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_privilege
    ADD CONSTRAINT zz_km_role_privilege_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6068 (class 2606 OID 44580)
-- Name: zz_km_role_workflow_mapper zz_km_role_workflow_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_workflow_mapper
    ADD CONSTRAINT zz_km_role_workflow_mapper_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6072 (class 2606 OID 44582)
-- Name: zz_km_user_dealer_mapper zz_km_user_dealer_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user_dealer_mapper
    ADD CONSTRAINT zz_km_user_dealer_mapper_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6074 (class 2606 OID 44584)
-- Name: zz_km_user_history_ zz_km_user_history__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user_history_
    ADD CONSTRAINT zz_km_user_history__pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6070 (class 2606 OID 44586)
-- Name: zz_km_user zz_km_user_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user
    ADD CONSTRAINT zz_km_user_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6076 (class 2606 OID 44588)
-- Name: zz_km_user_region_mapper zz_km_user_region_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user_region_mapper
    ADD CONSTRAINT zz_km_user_region_mapper_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6078 (class 2606 OID 44590)
-- Name: zz_kyc_blacklist zz_kyc_blacklist_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kyc_blacklist
    ADD CONSTRAINT zz_kyc_blacklist_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6080 (class 2606 OID 44592)
-- Name: zz_kyc_broadcast zz_kyc_broadcast_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kyc_broadcast
    ADD CONSTRAINT zz_kyc_broadcast_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6082 (class 2606 OID 44594)
-- Name: zz_kyc_dealer zz_kyc_dealer_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kyc_dealer
    ADD CONSTRAINT zz_kyc_dealer_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6084 (class 2606 OID 44596)
-- Name: zz_lga zz_lga_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_lga
    ADD CONSTRAINT zz_lga_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6086 (class 2606 OID 44598)
-- Name: zz_license zz_license_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_license
    ADD CONSTRAINT zz_license_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6092 (class 2606 OID 44600)
-- Name: zz_node_assignment_history zz_node_assignment_history_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_node_assignment_history
    ADD CONSTRAINT zz_node_assignment_history_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6090 (class 2606 OID 44602)
-- Name: zz_node_assignment zz_node_assignment_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_node_assignment
    ADD CONSTRAINT zz_node_assignment_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6088 (class 2606 OID 44604)
-- Name: zz_node zz_node_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_node
    ADD CONSTRAINT zz_node_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6094 (class 2606 OID 44606)
-- Name: zz_onboarding_status zz_onboarding_status_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_onboarding_status
    ADD CONSTRAINT zz_onboarding_status_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6096 (class 2606 OID 44608)
-- Name: zz_outlet zz_outlet_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_outlet
    ADD CONSTRAINT zz_outlet_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6098 (class 2606 OID 44610)
-- Name: zz_outlet_type zz_outlet_type_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_outlet_type
    ADD CONSTRAINT zz_outlet_type_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6100 (class 2606 OID 44612)
-- Name: zz_page_ zz_page__pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_page_
    ADD CONSTRAINT zz_page__pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6102 (class 2606 OID 44614)
-- Name: zz_password_history_log zz_password_history_log_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_password_history_log
    ADD CONSTRAINT zz_password_history_log_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6104 (class 2606 OID 44616)
-- Name: zz_password_policy zz_password_policy_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_password_policy
    ADD CONSTRAINT zz_password_policy_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6106 (class 2606 OID 44618)
-- Name: zz_region zz_region_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_region
    ADD CONSTRAINT zz_region_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6108 (class 2606 OID 44620)
-- Name: zz_serial_msisdn_mapper zz_serial_msisdn_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_serial_msisdn_mapper
    ADD CONSTRAINT zz_serial_msisdn_mapper_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6110 (class 2606 OID 44622)
-- Name: zz_setting zz_setting_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_setting
    ADD CONSTRAINT zz_setting_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6112 (class 2606 OID 44624)
-- Name: zz_state zz_state_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_state
    ADD CONSTRAINT zz_state_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6114 (class 2606 OID 44626)
-- Name: zz_telecom_master_records zz_telecom_master_records_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_telecom_master_records
    ADD CONSTRAINT zz_telecom_master_records_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6116 (class 2606 OID 44628)
-- Name: zz_territory zz_territory_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_territory
    ADD CONSTRAINT zz_territory_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 6118 (class 2606 OID 44630)
-- Name: zz_user_act_deact_reason zz_user_act_deact_reason_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_user_act_deact_reason
    ADD CONSTRAINT zz_user_act_deact_reason_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6120 (class 2606 OID 44632)
-- Name: zz_user_auth_mode_mapper zz_user_auth_mode_mapper_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_user_auth_mode_mapper
    ADD CONSTRAINT zz_user_auth_mode_mapper_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6122 (class 2606 OID 44634)
-- Name: zz_user_creation_request zz_user_creation_request_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_user_creation_request
    ADD CONSTRAINT zz_user_creation_request_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6124 (class 2606 OID 44636)
-- Name: zz_whitelisted_name zz_whitelisted_name_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_whitelisted_name
    ADD CONSTRAINT zz_whitelisted_name_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6126 (class 2606 OID 44638)
-- Name: zz_workflow zz_workflow_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_workflow
    ADD CONSTRAINT zz_workflow_pkey PRIMARY KEY (pk, rev);


--
-- TOC entry 6128 (class 2606 OID 44640)
-- Name: zz_zone zz_zone_pkey; Type: CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_zone
    ADD CONSTRAINT zz_zone_pkey PRIMARY KEY (id, rev);


--
-- TOC entry 5573 (class 1259 OID 44641)
-- Name: agility_integration_log__create_date_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX agility_integration_log__create_date_idx ON biocapture_test.agility_integration_log_ USING btree (create_date);


--
-- TOC entry 5574 (class 1259 OID 44642)
-- Name: agility_integration_log__pk_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX agility_integration_log__pk_idx ON biocapture_test.agility_integration_log_ USING btree (pk);


--
-- TOC entry 5599 (class 1259 OID 44643)
-- Name: bfp_failure_log_create_date_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX bfp_failure_log_create_date_idx ON biocapture_test.bfp_failure_log USING btree (create_date);


--
-- TOC entry 5600 (class 1259 OID 44644)
-- Name: bfp_failure_log_pk_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX bfp_failure_log_pk_idx ON biocapture_test.bfp_failure_log USING btree (pk);


--
-- TOC entry 5603 (class 1259 OID 44645)
-- Name: bfp_sync_log_create_date_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX bfp_sync_log_create_date_idx ON biocapture_test.bfp_sync_log USING btree (create_date);


--
-- TOC entry 5604 (class 1259 OID 44646)
-- Name: bfp_sync_log_pk_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX bfp_sync_log_pk_idx ON biocapture_test.bfp_sync_log USING btree (pk);


--
-- TOC entry 6130 (class 1259 OID 65765)
-- Name: blist_usr_indx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX blist_usr_indx ON biocapture_test.blacklist_users USING btree (biometric_capture_agent);


--
-- TOC entry 5638 (class 1259 OID 44647)
-- Name: client_activity_log_create_date_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX client_activity_log_create_date_idx ON biocapture_test.client_activity_log USING btree (create_date);


--
-- TOC entry 5639 (class 1259 OID 44648)
-- Name: client_activity_log_pk_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX client_activity_log_pk_idx ON biocapture_test.client_activity_log USING btree (pk);


--
-- TOC entry 5758 (class 1259 OID 44649)
-- Name: enrollment_log_basic_data_fk_key; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE UNIQUE INDEX enrollment_log_basic_data_fk_key ON biocapture_test.enrollment_log USING btree (basic_data_fk);


--
-- TOC entry 5710 (class 1259 OID 44650)
-- Name: idx1p85ll68e2tq19e3b6l8fva0m; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idx1p85ll68e2tq19e3b6l8fva0m ON biocapture_test.zone USING btree (code);


--
-- TOC entry 5711 (class 1259 OID 44651)
-- Name: idx3nq6trv9256c8g9i0cpf9tsfw; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idx3nq6trv9256c8g9i0cpf9tsfw ON biocapture_test.zone USING btree (name);


--
-- TOC entry 5650 (class 1259 OID 44652)
-- Name: idxce3qhf4apejwsftagno3vvaqo; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxce3qhf4apejwsftagno3vvaqo ON biocapture_test.country USING btree (code);


--
-- TOC entry 5909 (class 1259 OID 44653)
-- Name: idxgsg1hpm4d5d9h68ibkj11xnus; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxgsg1hpm4d5d9h68ibkj11xnus ON biocapture_test.setting USING btree (name);


--
-- TOC entry 5688 (class 1259 OID 44654)
-- Name: idxhj6j8v30y5fk09r57w0d28cq6; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxhj6j8v30y5fk09r57w0d28cq6 ON biocapture_test.lga USING btree (name);


--
-- TOC entry 5651 (class 1259 OID 44655)
-- Name: idxjgef5463gpyuagbp2v8q7uron; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxjgef5463gpyuagbp2v8q7uron ON biocapture_test.country USING btree (name);


--
-- TOC entry 5742 (class 1259 OID 44656)
-- Name: idxl4pg08mbn0wxj3jnjpq54c20u; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxl4pg08mbn0wxj3jnjpq54c20u ON biocapture_test.region USING btree (name);


--
-- TOC entry 5743 (class 1259 OID 44657)
-- Name: idxmq1mut9bsnn36u4lmmai2q148; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxmq1mut9bsnn36u4lmmai2q148 ON biocapture_test.region USING btree (code);


--
-- TOC entry 5839 (class 1259 OID 44658)
-- Name: idxnw973jh6j91kcnmwcdl4ununv; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxnw973jh6j91kcnmwcdl4ununv ON biocapture_test.kyc_blacklist USING btree (blacklisted_item, mac_address);


--
-- TOC entry 5700 (class 1259 OID 44659)
-- Name: idxqg4i8ndi2fdnrldiqw1d7b47j; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxqg4i8ndi2fdnrldiqw1d7b47j ON biocapture_test.state USING btree (name);


--
-- TOC entry 5701 (class 1259 OID 44660)
-- Name: idxsw91k6pve5bxo5tf407bt8luv; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX idxsw91k6pve5bxo5tf407bt8luv ON biocapture_test.state USING btree (code);


--
-- TOC entry 5849 (class 1259 OID 65778)
-- Name: meta_data_lower_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX meta_data_lower_idx ON biocapture_test.meta_data USING btree (lower((capture_machine_id)::text));


--
-- TOC entry 5674 (class 1259 OID 44661)
-- Name: sms_activation_request_id_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX sms_activation_request_id_idx ON biocapture_test.sms_activation_request USING btree (id);


--
-- TOC entry 5677 (class 1259 OID 44662)
-- Name: sms_activation_request_receipt_timestamp_idx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX sms_activation_request_receipt_timestamp_idx ON biocapture_test.sms_activation_request USING btree (receipt_timestamp);


--
-- TOC entry 5862 (class 1259 OID 44663)
-- Name: sys_c0013142; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE UNIQUE INDEX sys_c0013142 ON biocapture_test.msisdn_status USING btree (id);


--
-- TOC entry 6129 (class 1259 OID 57577)
-- Name: temp_cr_indx; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX temp_cr_indx ON biocapture_test.cr USING btree (code);


--
-- TOC entry 5934 (class 1259 OID 44664)
-- Name: tmr_ps_ix; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX tmr_ps_ix ON biocapture_test.telecom_master_records USING btree (processing_status);


--
-- TOC entry 5619 (class 1259 OID 44665)
-- Name: uk_dgghxosflgr36esldmpjinq8j; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX uk_dgghxosflgr36esldmpjinq8j ON biocapture_test.blacklisted_data USING btree (process_method);


--
-- TOC entry 5691 (class 1259 OID 44666)
-- Name: uk_kkc1lebn29m5da2tly3j4h7gd; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX uk_kkc1lebn29m5da2tly3j4h7gd ON biocapture_test.lga USING btree (name);


--
-- TOC entry 5620 (class 1259 OID 44667)
-- Name: uk_nd8yp8hk3dsokbtre4d2axnak; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX uk_nd8yp8hk3dsokbtre4d2axnak ON biocapture_test.blacklisted_data USING btree (sender);


--
-- TOC entry 5842 (class 1259 OID 44668)
-- Name: uk_nw973jh6j91kcnmwcdl4ununv; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX uk_nw973jh6j91kcnmwcdl4ununv ON biocapture_test.kyc_blacklist USING btree (blacklisted_item, mac_address);


--
-- TOC entry 5621 (class 1259 OID 44669)
-- Name: uk_sf3smttkwm9nrvie88rm4gbns; Type: INDEX; Schema: biocapture_test; Owner: enterprisedb
--

CREATE INDEX uk_sf3smttkwm9nrvie88rm4gbns ON biocapture_test.blacklisted_data USING btree (target_record);


--
-- TOC entry 6176 (class 2606 OID 44670)
-- Name: device fk16q5i0vnircfsdt8pkgxk7prw; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT fk16q5i0vnircfsdt8pkgxk7prw FOREIGN KEY (device_status_fk) REFERENCES biocapture_test.device_status(id);


--
-- TOC entry 6152 (class 2606 OID 44675)
-- Name: basic_data fk1ksfrgcp1jdwkcuuljhul7oh7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.basic_data
    ADD CONSTRAINT fk1ksfrgcp1jdwkcuuljhul7oh7 FOREIGN KEY (user_id_fk) REFERENCES biocapture_test.user_id(id);


--
-- TOC entry 6467 (class 2606 OID 44680)
-- Name: zz_territory fk1w7s8xmj3spb05x64vp6bjevl; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_territory
    ADD CONSTRAINT fk1w7s8xmj3spb05x64vp6bjevl FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6222 (class 2606 OID 44685)
-- Name: outlet fk22ftkexcw65t7w5gdn6hrun9u; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.outlet
    ADD CONSTRAINT fk22ftkexcw65t7w5gdn6hrun9u FOREIGN KEY (outlet_type_fk) REFERENCES biocapture_test.outlet_type(pk);


--
-- TOC entry 6396 (class 2606 OID 44690)
-- Name: zz_area fk36vgju8lcb5bkgid49qd3hbut; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_area
    ADD CONSTRAINT fk36vgju8lcb5bkgid49qd3hbut FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6411 (class 2606 OID 44695)
-- Name: zz_dealer_type fk37ltya6latukr5kcdsrmh3im7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_dealer_type
    ADD CONSTRAINT fk37ltya6latukr5kcdsrmh3im7 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6174 (class 2606 OID 44700)
-- Name: sms_activation_request fk3fsm3nlm0mir3yfp1e9tfsylt; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.sms_activation_request
    ADD CONSTRAINT fk3fsm3nlm0mir3yfp1e9tfsylt FOREIGN KEY (phone_number_status_fk) REFERENCES biocapture_test.phone_number_status(id);


--
-- TOC entry 6221 (class 2606 OID 49363)
-- Name: node_assignment fk40aq9207ikmvuxhfgikyfobwb; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk40aq9207ikmvuxhfgikyfobwb FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6246 (class 2606 OID 44710)
-- Name: km_user fk47g329bojea1toogw4evv4wy8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT fk47g329bojea1toogw4evv4wy8 FOREIGN KEY (dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6407 (class 2606 OID 44715)
-- Name: zz_country fk4osfflnmetdtkg61irjtrevj5; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_country
    ADD CONSTRAINT fk4osfflnmetdtkg61irjtrevj5 FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6447 (class 2606 OID 44720)
-- Name: zz_kyc_dealer fk4r7yb79wkynjrjqc0n9pjmfyd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kyc_dealer
    ADD CONSTRAINT fk4r7yb79wkynjrjqc0n9pjmfyd FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6436 (class 2606 OID 44725)
-- Name: zz_km_role fk57gnj4yflmigfjm8l3uht9c86; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role
    ADD CONSTRAINT fk57gnj4yflmigfjm8l3uht9c86 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6351 (class 2606 OID 44730)
-- Name: retried_bfp_sync_log fk58arxbldiqgscctm3goljw1cd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.retried_bfp_sync_log
    ADD CONSTRAINT fk58arxbldiqgscctm3goljw1cd FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6475 (class 2606 OID 44735)
-- Name: zz_zone fk5atog6co1vgihfp74nm5vsnug; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_zone
    ADD CONSTRAINT fk5atog6co1vgihfp74nm5vsnug FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6355 (class 2606 OID 44740)
-- Name: subscriber_detail fk5dmaioce8r2xa0cxqsdimui8r; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT fk5dmaioce8r2xa0cxqsdimui8r FOREIGN KEY (lga_of_origin) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6424 (class 2606 OID 44745)
-- Name: zz_field_edit_details fk5jlh7eunkv71rot0drhwqmxx7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_field_edit_details
    ADD CONSTRAINT fk5jlh7eunkv71rot0drhwqmxx7 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6202 (class 2606 OID 44750)
-- Name: node_assignment fk5p75klqtk6ft1oibxy6vgcoj3; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk5p75klqtk6ft1oibxy6vgcoj3 FOREIGN KEY (lga_fk) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6412 (class 2606 OID 44755)
-- Name: zz_device fk6ak4rgivok56kwpwu1807j9ek; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device
    ADD CONSTRAINT fk6ak4rgivok56kwpwu1807j9ek FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6356 (class 2606 OID 44760)
-- Name: subscriber_detail fk6oa7nj1agegvomdpl7y3stfxj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT fk6oa7nj1agegvomdpl7y3stfxj FOREIGN KEY (company_lga) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6418 (class 2606 OID 44765)
-- Name: zz_device_status fk6pbwi5xcgml79lao0y0yvwoyp; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_status
    ADD CONSTRAINT fk6pbwi5xcgml79lao0y0yvwoyp FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6350 (class 2606 OID 44770)
-- Name: registration_signature fk7jjjcjp1japy9ts9hxvj8xhji; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.registration_signature
    ADD CONSTRAINT fk7jjjcjp1japy9ts9hxvj8xhji FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6448 (class 2606 OID 44775)
-- Name: zz_lga fk7q5cilm81e82rgmbpwvxq71rg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_lga
    ADD CONSTRAINT fk7q5cilm81e82rgmbpwvxq71rg FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6472 (class 2606 OID 44780)
-- Name: zz_whitelisted_name fk7yc2k3hvvt9wu3w8w5llf3p57; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_whitelisted_name
    ADD CONSTRAINT fk7yc2k3hvvt9wu3w8w5llf3p57 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6354 (class 2606 OID 44785)
-- Name: special_data fk8414hgp59b57b8978bnd5sbve; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.special_data
    ADD CONSTRAINT fk8414hgp59b57b8978bnd5sbve FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6468 (class 2606 OID 44790)
-- Name: zz_territory fk862uuqp83nmu80k0dflbfne9u; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_territory
    ADD CONSTRAINT fk862uuqp83nmu80k0dflbfne9u FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6459 (class 2606 OID 44795)
-- Name: zz_password_policy fk87dyfhjmjjsa8761pib7fu64s; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_password_policy
    ADD CONSTRAINT fk87dyfhjmjjsa8761pib7fu64s FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6153 (class 2606 OID 44800)
-- Name: basic_data fk8eagn8ovhn4lfh6r0rc6c28wp; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.basic_data
    ADD CONSTRAINT fk8eagn8ovhn4lfh6r0rc6c28wp FOREIGN KEY (state_of_registration_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6266 (class 2606 OID 44805)
-- Name: enrollment_log fk8odakachctjm2684pf8wb4id2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.enrollment_log
    ADD CONSTRAINT fk8odakachctjm2684pf8wb4id2 FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6325 (class 2606 OID 44810)
-- Name: meta_data fk9i711c57talc12jwx0ofp6oub; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.meta_data
    ADD CONSTRAINT fk9i711c57talc12jwx0ofp6oub FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6232 (class 2606 OID 44815)
-- Name: territory fk9jkjq9281ywtrwldw1tor9x21; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.territory
    ADD CONSTRAINT fk9jkjq9281ywtrwldw1tor9x21 FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6357 (class 2606 OID 44820)
-- Name: subscriber_detail fk9na9qx01xrnsg8r1a9oh0mg6m; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT fk9na9qx01xrnsg8r1a9oh0mg6m FOREIGN KEY (area_of_residence) REFERENCES biocapture_test.area(id);


--
-- TOC entry 6397 (class 2606 OID 44825)
-- Name: zz_area fk9o1odj0xn9sg952lkq38rvkl9; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_area
    ADD CONSTRAINT fk9o1odj0xn9sg952lkq38rvkl9 FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6317 (class 2606 OID 44830)
-- Name: kyc_broadcast fk9qwikeosv1fg33hr9t0ifyeao; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT fk9qwikeosv1fg33hr9t0ifyeao FOREIGN KEY (created_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6360 (class 2606 OID 44835)
-- Name: trade_partners_state fk9tgpvaoipsuw689tvt5tqsaj7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.trade_partners_state
    ADD CONSTRAINT fk9tgpvaoipsuw689tvt5tqsaj7 FOREIGN KEY (trade_partners_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6250 (class 2606 OID 44840)
-- Name: device_tag_request fk9u66madtr1oqjca299g0yl4m4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk9u66madtr1oqjca299g0yl4m4 FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6251 (class 2606 OID 44845)
-- Name: device_tag_request fk_13f2pp1uk8pnd97ao4skmj6p7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk_13f2pp1uk8pnd97ao4skmj6p7 FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6338 (class 2606 OID 44850)
-- Name: node_assignment_history fk_17saq9f1dmg9nu9ju3lc0uv71; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_17saq9f1dmg9nu9ju3lc0uv71 FOREIGN KEY (area_fk) REFERENCES biocapture_test.area(id);


--
-- TOC entry 6430 (class 2606 OID 44855)
-- Name: zz_issue_summary fk_1gn62106w2p243sjdcya7bfux; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_issue_summary
    ADD CONSTRAINT fk_1gn62106w2p243sjdcya7bfux FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6161 (class 2606 OID 44860)
-- Name: blacklisted_data fk_1hrhm40exsnplc62vtjq4uv8e; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_data
    ADD CONSTRAINT fk_1hrhm40exsnplc62vtjq4uv8e FOREIGN KEY (blacklist_fk) REFERENCES biocapture_test.kyc_blacklist(pk);


--
-- TOC entry 6366 (class 2606 OID 44865)
-- Name: user_creation_request fk_1jj1xkbvne4k2cq7onmlb0ifk; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_1jj1xkbvne4k2cq7onmlb0ifk FOREIGN KEY (area_fk) REFERENCES biocapture_test.area(id);


--
-- TOC entry 6165 (class 2606 OID 44870)
-- Name: churn_detail fk_1mr633he4trmaeh8ly3u8i4ip; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.churn_detail
    ADD CONSTRAINT fk_1mr633he4trmaeh8ly3u8i4ip FOREIGN KEY (churn_msisdn_fk) REFERENCES biocapture_test.churn_msisdn(pk);


--
-- TOC entry 6402 (class 2606 OID 44875)
-- Name: zz_b2b_request_approval fk_1q06aw8ct13etihlkgmx38urn; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_b2b_request_approval
    ADD CONSTRAINT fk_1q06aw8ct13etihlkgmx38urn FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6339 (class 2606 OID 44880)
-- Name: node_assignment_history fk_1upb5spvkmsgn1lprjxwp136y; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_1upb5spvkmsgn1lprjxwp136y FOREIGN KEY (field_support_agent_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6380 (class 2606 OID 44885)
-- Name: vtu_request fk_1uvwhq2a2cdgfbwm5rxvcyhxb; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request
    ADD CONSTRAINT fk_1uvwhq2a2cdgfbwm5rxvcyhxb FOREIGN KEY (agent_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6247 (class 2606 OID 44890)
-- Name: km_user fk_26ysinh050aj6madlx4q9tq5b; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT fk_26ysinh050aj6madlx4q9tq5b FOREIGN KEY (dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6416 (class 2606 OID 44895)
-- Name: zz_device_requisition_approval fk_27r7n05v2rqqret4lh31snac9; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_requisition_approval
    ADD CONSTRAINT fk_27r7n05v2rqqret4lh31snac9 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6169 (class 2606 OID 44900)
-- Name: crm_push_status fk_29nlyx37ribe20pdk3xjs3bsi; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.crm_push_status
    ADD CONSTRAINT fk_29nlyx37ribe20pdk3xjs3bsi FOREIGN KEY (msisdn_detail_fk) REFERENCES biocapture_test.msisdn_detail(id);


--
-- TOC entry 6306 (class 2606 OID 44905)
-- Name: km_user_history_ fk_2bobby64d100sp0hnoqhmb6df; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_history_
    ADD CONSTRAINT fk_2bobby64d100sp0hnoqhmb6df FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6387 (class 2606 OID 44910)
-- Name: vtu_transaction_logs fk_2mhuq7qv69l6iy2qu8q2okkiu; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_transaction_logs
    ADD CONSTRAINT fk_2mhuq7qv69l6iy2qu8q2okkiu FOREIGN KEY (bundle_type_fk) REFERENCES biocapture_test.bundle_type(pk);


--
-- TOC entry 6318 (class 2606 OID 44915)
-- Name: kyc_broadcast fk_2tnivcwiswhs3jfhw19uh4otd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT fk_2tnivcwiswhs3jfhw19uh4otd FOREIGN KEY (created_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6275 (class 2606 OID 44920)
-- Name: issue_log fk_2u6n009953t3wsds2g00h1cee; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT fk_2u6n009953t3wsds2g00h1cee FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6290 (class 2606 OID 44925)
-- Name: km_role_community_mapper fk_2vk4dqyr173igw35jlx6q0iou; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_community_mapper
    ADD CONSTRAINT fk_2vk4dqyr173igw35jlx6q0iou FOREIGN KEY (km_role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6438 (class 2606 OID 44930)
-- Name: zz_km_role_division fk_37jv1ag1o0le2pwjnqailk2el; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_division
    ADD CONSTRAINT fk_37jv1ag1o0le2pwjnqailk2el FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6268 (class 2606 OID 44935)
-- Name: fault fk_3ahsg0or3gbmis04yfq2o6y26; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fault
    ADD CONSTRAINT fk_3ahsg0or3gbmis04yfq2o6y26 FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6203 (class 2606 OID 44940)
-- Name: node_assignment fk_3f01o07wfsbc20f5khlchfnm2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_3f01o07wfsbc20f5khlchfnm2 FOREIGN KEY (lga_fk) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6164 (class 2606 OID 44945)
-- Name: bundle_type fk_3il21d7r4bglyyav2fthu0am1; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bundle_type
    ADD CONSTRAINT fk_3il21d7r4bglyyav2fthu0am1 FOREIGN KEY (vtu_category_fk) REFERENCES biocapture_test.vtu_category(pk);


--
-- TOC entry 6162 (class 2606 OID 44950)
-- Name: blacklisted_name fk_3lix2y5a9ctk58dcna7nurmfr; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_name
    ADD CONSTRAINT fk_3lix2y5a9ctk58dcna7nurmfr FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6315 (class 2606 OID 44955)
-- Name: kyc_blacklist fk_3nyiupebctfxmcb23oyn4yvjj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_blacklist
    ADD CONSTRAINT fk_3nyiupebctfxmcb23oyn4yvjj FOREIGN KEY (enrollment_ref) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6367 (class 2606 OID 44960)
-- Name: user_creation_request fk_3puilmptfpd1b24587ib0ic73; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_3puilmptfpd1b24587ib0ic73 FOREIGN KEY (approved_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6470 (class 2606 OID 44965)
-- Name: zz_user_auth_mode_mapper fk_4av4dtaaag6pniw30p3bfski4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_user_auth_mode_mapper
    ADD CONSTRAINT fk_4av4dtaaag6pniw30p3bfski4 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6271 (class 2606 OID 44970)
-- Name: fm_license_request fk_4e1p6ej6gixt19mw7jc4obw9q; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_request
    ADD CONSTRAINT fk_4e1p6ej6gixt19mw7jc4obw9q FOREIGN KEY (requested_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6274 (class 2606 OID 44975)
-- Name: geo_fence_log fk_4fs8ow6p3dv9ofes20ve9s332; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.geo_fence_log
    ADD CONSTRAINT fk_4fs8ow6p3dv9ofes20ve9s332 FOREIGN KEY (heart_beat_status_fk) REFERENCES biocapture_test.heart_beat_status(pk);


--
-- TOC entry 6453 (class 2606 OID 44980)
-- Name: zz_node_assignment_history fk_4rgcotsjl5tpct2o32ln8j9t0; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_node_assignment_history
    ADD CONSTRAINT fk_4rgcotsjl5tpct2o32ln8j9t0 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6307 (class 2606 OID 44985)
-- Name: km_user_history_ fk_4ubvva52ayxug5ov8q0h7gb64; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_history_
    ADD CONSTRAINT fk_4ubvva52ayxug5ov8q0h7gb64 FOREIGN KEY (user_act_deact_reason_fk) REFERENCES biocapture_test.user_act_deact_reason(pk);


--
-- TOC entry 6252 (class 2606 OID 44990)
-- Name: device_tag_request fk_4vx1w7q2nsq05dn1uj43vnq1s; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk_4vx1w7q2nsq05dn1uj43vnq1s FOREIGN KEY (lga_fk) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6143 (class 2606 OID 44995)
-- Name: b2b_log fk_4wl9ii87vvvtoorr2hri6130c; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT fk_4wl9ii87vvvtoorr2hri6130c FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6168 (class 2606 OID 45000)
-- Name: community_ fk_4ybqxc8cf6ohmvmia5v1m4yqf; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.community_
    ADD CONSTRAINT fk_4ybqxc8cf6ohmvmia5v1m4yqf FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6262 (class 2606 OID 45005)
-- Name: device_tag_request_approval fk_5fweffumk9v52aok6m5q01hii; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request_approval
    ADD CONSTRAINT fk_5fweffumk9v52aok6m5q01hii FOREIGN KEY (device_tag_request_fk) REFERENCES biocapture_test.device_tag_request(pk);


--
-- TOC entry 6204 (class 2606 OID 45010)
-- Name: node_assignment fk_5guc8chua9fow9vallcohxoj9; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_5guc8chua9fow9vallcohxoj9 FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6361 (class 2606 OID 45015)
-- Name: trade_partners_state fk_5hafg1tpjot2hqotghva98p7e; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.trade_partners_state
    ADD CONSTRAINT fk_5hafg1tpjot2hqotghva98p7e FOREIGN KEY (trade_partners_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6432 (class 2606 OID 45020)
-- Name: zz_kit_retrieval_history fk_5ieous0tmf9sfliakw69h2ahd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_retrieval_history
    ADD CONSTRAINT fk_5ieous0tmf9sfliakw69h2ahd FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6223 (class 2606 OID 45025)
-- Name: outlet fk_5mvjtcn6grecj4uuhbe8vxtla; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.outlet
    ADD CONSTRAINT fk_5mvjtcn6grecj4uuhbe8vxtla FOREIGN KEY (outlet_type_fk) REFERENCES biocapture_test.outlet_type(pk);


--
-- TOC entry 6138 (class 2606 OID 45030)
-- Name: agent_fingerprint fk_5n1croto7jfrdwimv7bclhr3k; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_fingerprint
    ADD CONSTRAINT fk_5n1croto7jfrdwimv7bclhr3k FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6253 (class 2606 OID 45035)
-- Name: device_tag_request fk_5wsl07ra6fc2jq6kreellcyyv; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk_5wsl07ra6fc2jq6kreellcyyv FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6238 (class 2606 OID 45040)
-- Name: device_requisition_approval fk_68uewlhst3v0iewd5xt7y9wbe; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_approval
    ADD CONSTRAINT fk_68uewlhst3v0iewd5xt7y9wbe FOREIGN KEY (approved_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6233 (class 2606 OID 45045)
-- Name: territory fk_6hwdblalhyqddrnk08otj92rf; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.territory
    ADD CONSTRAINT fk_6hwdblalhyqddrnk08otj92rf FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6426 (class 2606 OID 45050)
-- Name: zz_fm_license_quota fk_6kfooyp5sl5n8pj1deffpirho; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_fm_license_quota
    ADD CONSTRAINT fk_6kfooyp5sl5n8pj1deffpirho FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6254 (class 2606 OID 45055)
-- Name: device_tag_request fk_734n3gj79dgvhxcnv5l0oob77; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk_734n3gj79dgvhxcnv5l0oob77 FOREIGN KEY (requested_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6352 (class 2606 OID 45060)
-- Name: sim_swap_log fk_756hdej544px2qmsmagwybial; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.sim_swap_log
    ADD CONSTRAINT fk_756hdej544px2qmsmagwybial FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6425 (class 2606 OID 45065)
-- Name: zz_fm_license_approval_history fk_7j6u8le3o2hhu5tcw25gumqli; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_fm_license_approval_history
    ADD CONSTRAINT fk_7j6u8le3o2hhu5tcw25gumqli FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6276 (class 2606 OID 45070)
-- Name: issue_log fk_7luthbua14gm960vlul2s897s; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT fk_7luthbua14gm960vlul2s897s FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6450 (class 2606 OID 45075)
-- Name: zz_license fk_7q5w5u0ex22psknyw2dpc0uhm; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_license
    ADD CONSTRAINT fk_7q5w5u0ex22psknyw2dpc0uhm FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6241 (class 2606 OID 45080)
-- Name: device_requisition_request fk_7qf6xiskfwfnfqwt9o6fh47rk; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_request
    ADD CONSTRAINT fk_7qf6xiskfwfnfqwt9o6fh47rk FOREIGN KEY (area_fk) REFERENCES biocapture_test.area(id);


--
-- TOC entry 6417 (class 2606 OID 45085)
-- Name: zz_device_requisition_request fk_7sdeuj5nvgmgaisdpefekexqe; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_requisition_request
    ADD CONSTRAINT fk_7sdeuj5nvgmgaisdpefekexqe FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6311 (class 2606 OID 45090)
-- Name: km_user_vtu fk_7tgnrwld20mwecyy3fnhw8amv; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_vtu
    ADD CONSTRAINT fk_7tgnrwld20mwecyy3fnhw8amv FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6188 (class 2606 OID 45095)
-- Name: lga fk_7w5oq2koh19314eyx81w8mm70; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.lga
    ADD CONSTRAINT fk_7w5oq2koh19314eyx81w8mm70 FOREIGN KEY (territory_fk) REFERENCES biocapture_test.territory(id);


--
-- TOC entry 6292 (class 2606 OID 45100)
-- Name: km_role_division fk_82xcoiw2ey7wkw8qlcy9s9xmd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_division
    ADD CONSTRAINT fk_82xcoiw2ey7wkw8qlcy9s9xmd FOREIGN KEY (dealer_division_fk) REFERENCES biocapture_test.dealer_division(pk);


--
-- TOC entry 6272 (class 2606 OID 45105)
-- Name: fm_license_request fk_87uurwqgd3ttoekwobbput051; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_request
    ADD CONSTRAINT fk_87uurwqgd3ttoekwobbput051 FOREIGN KEY (approved_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6239 (class 2606 OID 45110)
-- Name: device_requisition_approval fk_88yykwj5ya2wh7aypsa3khsid; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_approval
    ADD CONSTRAINT fk_88yykwj5ya2wh7aypsa3khsid FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6205 (class 2606 OID 45115)
-- Name: node_assignment fk_8fxayd1sss5bfmplj3u1sy5gi; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_8fxayd1sss5bfmplj3u1sy5gi FOREIGN KEY (territory_fk) REFERENCES biocapture_test.territory(id);


--
-- TOC entry 6192 (class 2606 OID 45120)
-- Name: node fk_8mlomdngve3uqeppbi6oj1n3v; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fk_8mlomdngve3uqeppbi6oj1n3v FOREIGN KEY (device_type) REFERENCES biocapture_test.device_type(id);


--
-- TOC entry 6242 (class 2606 OID 45125)
-- Name: device_requisition_request fk_8rxp8sp0x486wva147xee0wlr; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_request
    ADD CONSTRAINT fk_8rxp8sp0x486wva147xee0wlr FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6340 (class 2606 OID 45130)
-- Name: node_assignment_history fk_8xl3yghlrlxtsrpxya67pk66r; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_8xl3yghlrlxtsrpxya67pk66r FOREIGN KEY (outlet_fk) REFERENCES biocapture_test.outlet(pk);


--
-- TOC entry 6293 (class 2606 OID 45135)
-- Name: km_role_division fk_93n4cu7mbxtbbrqlf029bsibk; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_division
    ADD CONSTRAINT fk_93n4cu7mbxtbbrqlf029bsibk FOREIGN KEY (role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6341 (class 2606 OID 45140)
-- Name: node_assignment_history fk_94crry3hxpgx8uuqhhw437m4h; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_94crry3hxpgx8uuqhhw437m4h FOREIGN KEY (node_assignment_fk) REFERENCES biocapture_test.node_assignment(pk);


--
-- TOC entry 6144 (class 2606 OID 45145)
-- Name: b2b_log fk_96xqgbowkqr7nm181hrf3jxkb; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT fk_96xqgbowkqr7nm181hrf3jxkb FOREIGN KEY (b2b_location_fk) REFERENCES biocapture_test.b2b_location(pk);


--
-- TOC entry 6342 (class 2606 OID 45150)
-- Name: node_assignment_history fk_988ypkwlnwwrj12y628twly1x; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_988ypkwlnwwrj12y628twly1x FOREIGN KEY (approved_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6263 (class 2606 OID 45155)
-- Name: device_tag_request_approval fk_99sm4lw2gmtv5jgh8amqly9eu; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request_approval
    ADD CONSTRAINT fk_99sm4lw2gmtv5jgh8amqly9eu FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6291 (class 2606 OID 45160)
-- Name: km_role_community_mapper fk_9fvdq5lufg6l2a76ad96xah4m; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_community_mapper
    ADD CONSTRAINT fk_9fvdq5lufg6l2a76ad96xah4m FOREIGN KEY (community_fk) REFERENCES biocapture_test.community_(pk);


--
-- TOC entry 6154 (class 2606 OID 45165)
-- Name: basic_data fk_9hruu3xo118np5v2h4aaf7p0x; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.basic_data
    ADD CONSTRAINT fk_9hruu3xo118np5v2h4aaf7p0x FOREIGN KEY (state_of_registration_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6368 (class 2606 OID 45170)
-- Name: user_creation_request fk_9j5slxscxps2r02pui3u77qbt; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_9j5slxscxps2r02pui3u77qbt FOREIGN KEY (territory_fk) REFERENCES biocapture_test.territory(id);


--
-- TOC entry 6193 (class 2606 OID 45175)
-- Name: node fk_9m12npl8p9m1b78sdiqkv170f; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fk_9m12npl8p9m1b78sdiqkv170f FOREIGN KEY (enrollment_ref) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6398 (class 2606 OID 45180)
-- Name: zz_attachment_ fk_9rpnqi88bdd7lp6ii3eudso7l; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_attachment_
    ADD CONSTRAINT fk_9rpnqi88bdd7lp6ii3eudso7l FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6206 (class 2606 OID 45185)
-- Name: node_assignment fk_9rq1ysl42s81gbx4nnogy15wg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_9rq1ysl42s81gbx4nnogy15wg FOREIGN KEY (area_fk) REFERENCES biocapture_test.area(id);


--
-- TOC entry 6298 (class 2606 OID 45190)
-- Name: user_role fk_9x2cw22falkjifmlkemqo7prs; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_role
    ADD CONSTRAINT fk_9x2cw22falkjifmlkemqo7prs FOREIGN KEY (role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6345 (class 2606 OID 45195)
-- Name: onboarding_status fk_a0o14pbccqmpuftstgry8xb34; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.onboarding_status
    ADD CONSTRAINT fk_a0o14pbccqmpuftstgry8xb34 FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6145 (class 2606 OID 45200)
-- Name: b2b_log fk_aal2u3qulatgvjxffnoydyr77; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT fk_aal2u3qulatgvjxffnoydyr77 FOREIGN KEY (approved_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6458 (class 2606 OID 45205)
-- Name: zz_password_history_log fk_aamed40f3u7cwkhccgyql499a; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_password_history_log
    ADD CONSTRAINT fk_aamed40f3u7cwkhccgyql499a FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6431 (class 2606 OID 45210)
-- Name: zz_kit_mapping_approval fk_acuijxr70bwehervl81dvsgwt; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_mapping_approval
    ADD CONSTRAINT fk_acuijxr70bwehervl81dvsgwt FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6255 (class 2606 OID 45215)
-- Name: device_tag_request fk_adxcot5d4m6bfw73ybklkgpee; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk_adxcot5d4m6bfw73ybklkgpee FOREIGN KEY (device_type_fk) REFERENCES biocapture_test.device_type(id);


--
-- TOC entry 6159 (class 2606 OID 45220)
-- Name: blacklist_history fk_amgm8n5eu8mdvug47xkxdswv9; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklist_history
    ADD CONSTRAINT fk_amgm8n5eu8mdvug47xkxdswv9 FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6393 (class 2606 OID 45225)
-- Name: zone_state_mapper fk_aoovkd7wy4o244l58mv9pq9l4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone_state_mapper
    ADD CONSTRAINT fk_aoovkd7wy4o244l58mv9pq9l4 FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6166 (class 2606 OID 45230)
-- Name: client_lock_out_log fk_aorlligyq5qujwno4nj0bv4vy; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.client_lock_out_log
    ADD CONSTRAINT fk_aorlligyq5qujwno4nj0bv4vy FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6286 (class 2606 OID 45235)
-- Name: kit_retrieval_history fk_ayktjxxeb2fbx67807dgifbhu; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_retrieval_history
    ADD CONSTRAINT fk_ayktjxxeb2fbx67807dgifbhu FOREIGN KEY (assigned_user) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6369 (class 2606 OID 45240)
-- Name: user_creation_request fk_b1erleu3icfq5ps5vsi85hikh; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_b1erleu3icfq5ps5vsi85hikh FOREIGN KEY (attachment_fk) REFERENCES biocapture_test.attachment_(pk);


--
-- TOC entry 6349 (class 2606 OID 45245)
-- Name: password_history_log fk_b2p15kkd50c9ayjitlcy5yebi; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.password_history_log
    ADD CONSTRAINT fk_b2p15kkd50c9ayjitlcy5yebi FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6312 (class 2606 OID 45250)
-- Name: km_user_vtu fk_bgkbg3jwvt6t27oenlylmk1b1; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_vtu
    ADD CONSTRAINT fk_bgkbg3jwvt6t27oenlylmk1b1 FOREIGN KEY (vtu_request_fk) REFERENCES biocapture_test.vtu_request(pk);


--
-- TOC entry 6155 (class 2606 OID 45255)
-- Name: basic_data fk_bhvnjmj6mju4r7r3vb7lfge5s; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.basic_data
    ADD CONSTRAINT fk_bhvnjmj6mju4r7r3vb7lfge5s FOREIGN KEY (user_id_fk) REFERENCES biocapture_test.user_id(id);


--
-- TOC entry 6207 (class 2606 OID 45260)
-- Name: node_assignment fk_bk520rbe5n86tsbjabjheknx1; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_bk520rbe5n86tsbjabjheknx1 FOREIGN KEY (fsa_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6347 (class 2606 OID 45265)
-- Name: page_ fk_bobn9xske23ncce500ijc92sl; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.page_
    ADD CONSTRAINT fk_bobn9xske23ncce500ijc92sl FOREIGN KEY (community_fk) REFERENCES biocapture_test.community_(pk);


--
-- TOC entry 6395 (class 2606 OID 45270)
-- Name: zz_agent_detail fk_bou8otq8wgetsuwqkbbqis3j4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_agent_detail
    ADD CONSTRAINT fk_bou8otq8wgetsuwqkbbqis3j4 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6182 (class 2606 OID 45275)
-- Name: kyc_dealer fk_bu2ywl9ugfokwiiy4eau0qd5q; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT fk_bu2ywl9ugfokwiiy4eau0qd5q FOREIGN KEY (dealer_division_fk) REFERENCES biocapture_test.dealer_division(pk);


--
-- TOC entry 6428 (class 2606 OID 45280)
-- Name: zz_issue_log fk_bwenlmdgmm0nq4odv9961ylut; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_issue_log
    ADD CONSTRAINT fk_bwenlmdgmm0nq4odv9961ylut FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6421 (class 2606 OID 45285)
-- Name: zz_device_tag_request_approval fk_c448clxer3gw01je0c431bpk2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_tag_request_approval
    ADD CONSTRAINT fk_c448clxer3gw01je0c431bpk2 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6160 (class 2606 OID 45290)
-- Name: blacklist_history fk_cb1xvonp5ywjuh7500x8xxxid; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklist_history
    ADD CONSTRAINT fk_cb1xvonp5ywjuh7500x8xxxid FOREIGN KEY (blacklist_reason_fk) REFERENCES biocapture_test.blacklist_reason(pk);


--
-- TOC entry 6309 (class 2606 OID 45295)
-- Name: km_user_region_mapper fk_cfke1oyl8dwolkxcx1mc3h8g0; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_region_mapper
    ADD CONSTRAINT fk_cfke1oyl8dwolkxcx1mc3h8g0 FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6299 (class 2606 OID 45300)
-- Name: user_role fk_cjifee7ge9a0997dobfbwbfbo; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_role
    ADD CONSTRAINT fk_cjifee7ge9a0997dobfbwbfbo FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6399 (class 2606 OID 45305)
-- Name: zz_authentication_mode fk_ck5ed6bpvw0cnl7xtqjohxtbk; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_authentication_mode
    ADD CONSTRAINT fk_ck5ed6bpvw0cnl7xtqjohxtbk FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6304 (class 2606 OID 45310)
-- Name: km_user_dealer_mapper fk_clc6idknn7jgr855d3kpjhihj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_dealer_mapper
    ADD CONSTRAINT fk_clc6idknn7jgr855d3kpjhihj FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6370 (class 2606 OID 45315)
-- Name: user_creation_request fk_cpg0tetdmla5an4y3rlnshcdn; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_cpg0tetdmla5an4y3rlnshcdn FOREIGN KEY (outlet_type_fk) REFERENCES biocapture_test.outlet_type(pk);


--
-- TOC entry 6172 (class 2606 OID 45320)
-- Name: dynamic_data fk_cto6xw72ra8jft1kk5g0pny2l; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dynamic_data
    ADD CONSTRAINT fk_cto6xw72ra8jft1kk5g0pny2l FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6364 (class 2606 OID 45325)
-- Name: user_auth_mode_mapper fk_cy41f9nr68tyqsc237ylpf928; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_auth_mode_mapper
    ADD CONSTRAINT fk_cy41f9nr68tyqsc237ylpf928 FOREIGN KEY (authentication_mode_fk) REFERENCES biocapture_test.authentication_mode(pk);


--
-- TOC entry 6310 (class 2606 OID 45330)
-- Name: km_user_region_mapper fk_daar297buihtdb2j7xfj5yrld; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_region_mapper
    ADD CONSTRAINT fk_daar297buihtdb2j7xfj5yrld FOREIGN KEY (region_fk) REFERENCES biocapture_test.region(id);


--
-- TOC entry 6346 (class 2606 OID 45335)
-- Name: onboarding_status fk_dagi31p4vsnll02rh758m0u7p; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.onboarding_status
    ADD CONSTRAINT fk_dagi31p4vsnll02rh758m0u7p FOREIGN KEY (onboarded_by_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6381 (class 2606 OID 45340)
-- Name: vtu_request fk_ddmaiqmen3ig38ud9if2he90i; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request
    ADD CONSTRAINT fk_ddmaiqmen3ig38ud9if2he90i FOREIGN KEY (requested_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6332 (class 2606 OID 45345)
-- Name: passport fk_dfkd82jpjjviyp67tmcehsy5k; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport
    ADD CONSTRAINT fk_dfkd82jpjjviyp67tmcehsy5k FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6177 (class 2606 OID 45350)
-- Name: device fk_dxjnse7440ywnjbmof86ljh4m; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT fk_dxjnse7440ywnjbmof86ljh4m FOREIGN KEY (device_type_fk) REFERENCES biocapture_test.device_type(id);


--
-- TOC entry 6323 (class 2606 OID 45355)
-- Name: license fk_e33xu3uqc3lrsov4jddd8cpc6; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.license
    ADD CONSTRAINT fk_e33xu3uqc3lrsov4jddd8cpc6 FOREIGN KEY (approved_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6348 (class 2606 OID 45360)
-- Name: page_ fk_e656ot9p1uyice3jlgadfp6mx; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.page_
    ADD CONSTRAINT fk_e656ot9p1uyice3jlgadfp6mx FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6365 (class 2606 OID 45365)
-- Name: user_auth_mode_mapper fk_efr9lkuhqpkd8ghs92ys28slo; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_auth_mode_mapper
    ADD CONSTRAINT fk_efr9lkuhqpkd8ghs92ys28slo FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6139 (class 2606 OID 45370)
-- Name: agent_passport fk_ejl4n4pm7lob93uf9xc4qsixw; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_passport
    ADD CONSTRAINT fk_ejl4n4pm7lob93uf9xc4qsixw FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6175 (class 2606 OID 45375)
-- Name: sms_activation_request fk_ejrj0440i731v2x7n3ul2cbyr; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.sms_activation_request
    ADD CONSTRAINT fk_ejrj0440i731v2x7n3ul2cbyr FOREIGN KEY (phone_number_status_fk) REFERENCES biocapture_test.phone_number_status(id);


--
-- TOC entry 6243 (class 2606 OID 45380)
-- Name: device_requisition_request fk_els60mf2togae3smptlcwsvgh; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_request
    ADD CONSTRAINT fk_els60mf2togae3smptlcwsvgh FOREIGN KEY (requested_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6371 (class 2606 OID 45385)
-- Name: user_creation_request fk_eow623etxgjmhhexxfamioxgn; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_eow623etxgjmhhexxfamioxgn FOREIGN KEY (requested_by_kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6146 (class 2606 OID 45390)
-- Name: b2b_log fk_eq5315fnp4j52xni23ihregbw; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT fk_eq5315fnp4j52xni23ihregbw FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6277 (class 2606 OID 45395)
-- Name: issue_log fk_esxaclc9htx4e0xoi1kg3shct; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT fk_esxaclc9htx4e0xoi1kg3shct FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6391 (class 2606 OID 45400)
-- Name: wsq_image fk_euvw1bjbpu5rtakaot63hxfsq; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.wsq_image
    ADD CONSTRAINT fk_euvw1bjbpu5rtakaot63hxfsq FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6284 (class 2606 OID 45405)
-- Name: kit_marker fk_ewarurhf7p3l7yg2u17ib2dse; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_marker
    ADD CONSTRAINT fk_ewarurhf7p3l7yg2u17ib2dse FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6234 (class 2606 OID 45410)
-- Name: territory fk_f2p573y7kur7v6yiimhi7x1gr; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.territory
    ADD CONSTRAINT fk_f2p573y7kur7v6yiimhi7x1gr FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6336 (class 2606 OID 45415)
-- Name: signature fk_f4apgvhvdgkqh6jl0p1knqsxq; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.signature
    ADD CONSTRAINT fk_f4apgvhvdgkqh6jl0p1knqsxq FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6208 (class 2606 OID 45420)
-- Name: node_assignment fk_fejs07msfviqndrydk2ghje8t; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_fejs07msfviqndrydk2ghje8t FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6469 (class 2606 OID 45425)
-- Name: zz_user_act_deact_reason fk_fp5xlyw5eaxrb8j7p3551go4g; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_user_act_deact_reason
    ADD CONSTRAINT fk_fp5xlyw5eaxrb8j7p3551go4g FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6454 (class 2606 OID 45430)
-- Name: zz_onboarding_status fk_g5qex57xxld6i1n5ik3a684wh; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_onboarding_status
    ADD CONSTRAINT fk_g5qex57xxld6i1n5ik3a684wh FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6149 (class 2606 OID 45435)
-- Name: b2b_request_approval fk_gl2iu7llao8jy6euqrej23vln; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_request_approval
    ADD CONSTRAINT fk_gl2iu7llao8jy6euqrej23vln FOREIGN KEY (approved_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6137 (class 2606 OID 45440)
-- Name: agent_detail fk_gnhh4iqvmddxa5uq1lcqbtw; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.agent_detail
    ADD CONSTRAINT fk_gnhh4iqvmddxa5uq1lcqbtw FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6362 (class 2606 OID 45445)
-- Name: trade_partners_state fk_gu6kw39cvqnsp8mmfslgr2vtq; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.trade_partners_state
    ADD CONSTRAINT fk_gu6kw39cvqnsp8mmfslgr2vtq FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6443 (class 2606 OID 45450)
-- Name: zz_km_user_history_ fk_gug482pitfphqjgbfs3nvcysg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user_history_
    ADD CONSTRAINT fk_gug482pitfphqjgbfs3nvcysg FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6278 (class 2606 OID 45455)
-- Name: issue_log fk_h0gnkmef0852xb21jr7m2y3qf; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT fk_h0gnkmef0852xb21jr7m2y3qf FOREIGN KEY (approved_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6372 (class 2606 OID 45460)
-- Name: user_creation_request fk_h0out5bt93m5bbqhlbvm7ea3g; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_h0out5bt93m5bbqhlbvm7ea3g FOREIGN KEY (agent_detail_pk) REFERENCES biocapture_test.agent_detail(pk);


--
-- TOC entry 6427 (class 2606 OID 45465)
-- Name: zz_fm_license_request fk_h1clspjwuuqo6suwm1lqcp00x; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_fm_license_request
    ADD CONSTRAINT fk_h1clspjwuuqo6suwm1lqcp00x FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6224 (class 2606 OID 45470)
-- Name: outlet fk_h3nqlnvk5fx13j1ivrhj1u812; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.outlet
    ADD CONSTRAINT fk_h3nqlnvk5fx13j1ivrhj1u812 FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6343 (class 2606 OID 45475)
-- Name: node_assignment_history fk_h4rq0eho4s6779hhaesoj6ie; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_h4rq0eho4s6779hhaesoj6ie FOREIGN KEY (territory_fk) REFERENCES biocapture_test.territory(id);


--
-- TOC entry 6270 (class 2606 OID 45480)
-- Name: fm_license_approval_history fk_hlbuv4pbojr90hvr27kie62sp; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_approval_history
    ADD CONSTRAINT fk_hlbuv4pbojr90hvr27kie62sp FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6280 (class 2606 OID 45485)
-- Name: issue_log_attachment fk_hmou05bh1ba6w1mme7id56xdg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log_attachment
    ADD CONSTRAINT fk_hmou05bh1ba6w1mme7id56xdg FOREIGN KEY (issue_log_fk) REFERENCES biocapture_test.issue_log(pk);


--
-- TOC entry 6400 (class 2606 OID 45490)
-- Name: zz_b2b_location fk_hrw3jobujxy660fcjmtb45hcg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_b2b_location
    ADD CONSTRAINT fk_hrw3jobujxy660fcjmtb45hcg FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6394 (class 2606 OID 45495)
-- Name: zone_state_mapper fk_hwvnnaq0rb6tr8j339et9im5c; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone_state_mapper
    ADD CONSTRAINT fk_hwvnnaq0rb6tr8j339et9im5c FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6319 (class 2606 OID 45500)
-- Name: kyc_broadcast fk_ii742bwdhxtdqxlbyhwhoi7sa; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT fk_ii742bwdhxtdqxlbyhwhoi7sa FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6226 (class 2606 OID 45505)
-- Name: state fk_ilmkgo8u7gwfohbuj3a0s5jm3; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT fk_ilmkgo8u7gwfohbuj3a0s5jm3 FOREIGN KEY (region_fk) REFERENCES biocapture_test.region(id);


--
-- TOC entry 6437 (class 2606 OID 45510)
-- Name: zz_km_role_community_mapper fk_imerc7hftc3vdna0plrbk3iru; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_community_mapper
    ADD CONSTRAINT fk_imerc7hftc3vdna0plrbk3iru FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6373 (class 2606 OID 45515)
-- Name: user_creation_request fk_ipd6wkej8i6adq7prtnv50d1u; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_ipd6wkej8i6adq7prtnv50d1u FOREIGN KEY (auth_mode_fk) REFERENCES biocapture_test.authentication_mode(pk);


--
-- TOC entry 6473 (class 2606 OID 45520)
-- Name: zz_workflow fk_ipu8keq7l7najnc14md2umbmg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_workflow
    ADD CONSTRAINT fk_ipu8keq7l7najnc14md2umbmg FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6273 (class 2606 OID 45525)
-- Name: fm_license_request fk_ivb7nb51051kseuxbylcx6251; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.fm_license_request
    ADD CONSTRAINT fk_ivb7nb51051kseuxbylcx6251 FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6281 (class 2606 OID 45530)
-- Name: kit_mapping_approval fk_iylst7prx7kguc8nw7hfcl9l3; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_mapping_approval
    ADD CONSTRAINT fk_iylst7prx7kguc8nw7hfcl9l3 FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6183 (class 2606 OID 45535)
-- Name: kyc_dealer fk_jd9v3m71emrekicy849f7ta7f; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT fk_jd9v3m71emrekicy849f7ta7f FOREIGN KEY (dealer_type_fk) REFERENCES biocapture_test.dealer_type(pk);


--
-- TOC entry 6189 (class 2606 OID 45540)
-- Name: lga fk_jfpkah0ke9gkbg3c3b3be5j4k; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.lga
    ADD CONSTRAINT fk_jfpkah0ke9gkbg3c3b3be5j4k FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6171 (class 2606 OID 45545)
-- Name: dealer_exclusion_list fk_jhgaogjj8mc8iqqr54igspdyg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dealer_exclusion_list
    ADD CONSTRAINT fk_jhgaogjj8mc8iqqr54igspdyg FOREIGN KEY (dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6142 (class 2606 OID 45550)
-- Name: attachment_ fk_jmh3cjsp5ekpwpymxih47br8a; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.attachment_
    ADD CONSTRAINT fk_jmh3cjsp5ekpwpymxih47br8a FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6388 (class 2606 OID 45555)
-- Name: vtu_transaction_logs fk_johj94io89hl1m3f7f8gghr9a; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_transaction_logs
    ADD CONSTRAINT fk_johj94io89hl1m3f7f8gghr9a FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6256 (class 2606 OID 45560)
-- Name: device_tag_request fk_jrtq1qbj30ha7i7rf4gfa9ey7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fk_jrtq1qbj30ha7i7rf4gfa9ey7 FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6194 (class 2606 OID 45565)
-- Name: node fk_jyke5g5ppmkvw9re3dwhi7bl9; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fk_jyke5g5ppmkvw9re3dwhi7bl9 FOREIGN KEY (device_owner) REFERENCES biocapture_test.device_owner(pk);


--
-- TOC entry 6287 (class 2606 OID 45570)
-- Name: kit_retrieval_history fk_k0kigno5hhdtp72tj5i78j6g; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_retrieval_history
    ADD CONSTRAINT fk_k0kigno5hhdtp72tj5i78j6g FOREIGN KEY (kit_retrieval_reason_fk) REFERENCES biocapture_test.kit_retrieval_reason(pk);


--
-- TOC entry 6320 (class 2606 OID 45575)
-- Name: kyc_broadcast fk_k1kegif8cf9cy3cch19wtmpjo; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT fk_k1kegif8cf9cy3cch19wtmpjo FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6240 (class 2606 OID 45580)
-- Name: device_requisition_approval fk_k2n0oufbmt1q0rm018bgdw0bq; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_approval
    ADD CONSTRAINT fk_k2n0oufbmt1q0rm018bgdw0bq FOREIGN KEY (device_requisition_request_fk) REFERENCES biocapture_test.device_requisition_request(pk);


--
-- TOC entry 6442 (class 2606 OID 45585)
-- Name: zz_km_user_dealer_mapper fk_k9wqdw1bh1wvwudslc58pn6yr; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user_dealer_mapper
    ADD CONSTRAINT fk_k9wqdw1bh1wvwudslc58pn6yr FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6302 (class 2606 OID 45590)
-- Name: km_role_workflow_mapper fk_kdn3yd44i2v3wf21eyqfcf36x; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_workflow_mapper
    ADD CONSTRAINT fk_kdn3yd44i2v3wf21eyqfcf36x FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6410 (class 2606 OID 45595)
-- Name: zz_dealer_exclusion_list fk_kpe07gjf9vomk5ka4s7xi7xed; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_dealer_exclusion_list
    ADD CONSTRAINT fk_kpe07gjf9vomk5ka4s7xi7xed FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6140 (class 2606 OID 45600)
-- Name: area fk_kyp3g03tat7himcgb1hfb8gli; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.area
    ADD CONSTRAINT fk_kyp3g03tat7himcgb1hfb8gli FOREIGN KEY (lga_fk) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6429 (class 2606 OID 45605)
-- Name: zz_issue_log_attachment fk_lj7onu6yp5yhfl6do8rn85c7k; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_issue_log_attachment
    ADD CONSTRAINT fk_lj7onu6yp5yhfl6do8rn85c7k FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6209 (class 2606 OID 45610)
-- Name: node_assignment fk_loivss2ylweyd44yb45ho2srd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_loivss2ylweyd44yb45ho2srd FOREIGN KEY (dm_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6419 (class 2606 OID 45615)
-- Name: zz_device_tag_request fk_lrvmpnn49v7e0rn6uac5dyvfl; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_tag_request
    ADD CONSTRAINT fk_lrvmpnn49v7e0rn6uac5dyvfl FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6288 (class 2606 OID 45620)
-- Name: kit_retrieval_history fk_ltv9wfrky5cprtpaf9suqgvj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_retrieval_history
    ADD CONSTRAINT fk_ltv9wfrky5cprtpaf9suqgvj FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6184 (class 2606 OID 45625)
-- Name: kyc_dealer fk_m3rwjub6afsiopkrjcc7i2t7l; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT fk_m3rwjub6afsiopkrjcc7i2t7l FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6150 (class 2606 OID 45630)
-- Name: b2b_request_approval fk_m69vpwdfy00aeob6em0lxxm4s; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_request_approval
    ADD CONSTRAINT fk_m69vpwdfy00aeob6em0lxxm4s FOREIGN KEY (b2b_request_fk) REFERENCES biocapture_test.b2b_log(pk);


--
-- TOC entry 6403 (class 2606 OID 45635)
-- Name: zz_blacklist_reason fk_mhlexeuiwt2q0qw1agg8485bv; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_blacklist_reason
    ADD CONSTRAINT fk_mhlexeuiwt2q0qw1agg8485bv FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6210 (class 2606 OID 45640)
-- Name: node_assignment fk_mmm86qi7xko5moyy9p3j26v6u; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_mmm86qi7xko5moyy9p3j26v6u FOREIGN KEY (outlet_fk) REFERENCES biocapture_test.outlet(pk);


--
-- TOC entry 6147 (class 2606 OID 45645)
-- Name: b2b_log fk_moulk16okscr29yj58rae34pr; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT fk_moulk16okscr29yj58rae34pr FOREIGN KEY (originating_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6148 (class 2606 OID 45650)
-- Name: b2b_log fk_n9ac5y5c6mfoc8trch744iq52; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_log
    ADD CONSTRAINT fk_n9ac5y5c6mfoc8trch744iq52 FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6282 (class 2606 OID 45655)
-- Name: kit_mapping_approval fk_nn44j122ticyiiadgw70msx5x; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_mapping_approval
    ADD CONSTRAINT fk_nn44j122ticyiiadgw70msx5x FOREIGN KEY (approved_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6151 (class 2606 OID 45660)
-- Name: b2b_request_approval fk_o5l95eup9gjkdi42yw4f0goa; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.b2b_request_approval
    ADD CONSTRAINT fk_o5l95eup9gjkdi42yw4f0goa FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6374 (class 2606 OID 45665)
-- Name: user_creation_request fk_ob8p1krw8vq8qf4qdkw3d1o7h; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_ob8p1krw8vq8qf4qdkw3d1o7h FOREIGN KEY (node_assignment_history_fk) REFERENCES biocapture_test.node_assignment_history(pk);


--
-- TOC entry 6308 (class 2606 OID 45670)
-- Name: km_user_history_ fk_oej4u5rkihteufcmvhddy6pik; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_history_
    ADD CONSTRAINT fk_oej4u5rkihteufcmvhddy6pik FOREIGN KEY (performed_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6294 (class 2606 OID 45675)
-- Name: km_role_privilege fk_oiymdxkc6bmgbtq63e9fuecqw; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_privilege
    ADD CONSTRAINT fk_oiymdxkc6bmgbtq63e9fuecqw FOREIGN KEY (role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6413 (class 2606 OID 45680)
-- Name: zz_device fk_ortppi8jcg6q171e3e7tx8hy6; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device
    ADD CONSTRAINT fk_ortppi8jcg6q171e3e7tx8hy6 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6178 (class 2606 OID 45685)
-- Name: device fk_ot1paw2bu6n7nela4f3g6a1i4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT fk_ot1paw2bu6n7nela4f3g6a1i4 FOREIGN KEY (device_status_fk) REFERENCES biocapture_test.device_status(id);


--
-- TOC entry 6457 (class 2606 OID 45690)
-- Name: zz_page_ fk_oxbg8ja8mb00lwvs5texool08; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_page_
    ADD CONSTRAINT fk_oxbg8ja8mb00lwvs5texool08 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6433 (class 2606 OID 45695)
-- Name: zz_kit_retrieval_reason fk_oycfdom38ar8xs2o2troji3j2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_retrieval_reason
    ADD CONSTRAINT fk_oycfdom38ar8xs2o2troji3j2 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6264 (class 2606 OID 45700)
-- Name: device_tag_request_approval fk_p7ow7jeabjx79fvsq0qg3g73y; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request_approval
    ADD CONSTRAINT fk_p7ow7jeabjx79fvsq0qg3g73y FOREIGN KEY (approved_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6377 (class 2606 OID 45705)
-- Name: version_log fk_p8o1ul8n8s0m33cvo029xw0qu; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.version_log
    ADD CONSTRAINT fk_p8o1ul8n8s0m33cvo029xw0qu FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6414 (class 2606 OID 45710)
-- Name: zz_device_license_quota fk_pdfr45lef1ee3slmnwsfmxccs; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_license_quota
    ADD CONSTRAINT fk_pdfr45lef1ee3slmnwsfmxccs FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6248 (class 2606 OID 45715)
-- Name: km_user fk_pe56ufqudacsj7hn29ej7njkh; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT fk_pe56ufqudacsj7hn29ej7njkh FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6440 (class 2606 OID 45720)
-- Name: zz_km_role_workflow_mapper fk_pm0k5243qpx329jbwfhvhphdf; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_workflow_mapper
    ADD CONSTRAINT fk_pm0k5243qpx329jbwfhvhphdf FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6227 (class 2606 OID 45725)
-- Name: state fk_pmqsfxduco5eoiikm9pytw0qx; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT fk_pmqsfxduco5eoiikm9pytw0qx FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6167 (class 2606 OID 45730)
-- Name: client_lock_out_log fk_poggjckl9q8slmmxy887joyhl; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.client_lock_out_log
    ADD CONSTRAINT fk_poggjckl9q8slmmxy887joyhl FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6384 (class 2606 OID 45735)
-- Name: vtu_request_approval fk_pwpvcxwch21xrtxny840mli6b; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request_approval
    ADD CONSTRAINT fk_pwpvcxwch21xrtxny840mli6b FOREIGN KEY (approved_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6236 (class 2606 OID 45740)
-- Name: zone fk_pxpj2ka6wpolu7bkbvbudld5c; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone
    ADD CONSTRAINT fk_pxpj2ka6wpolu7bkbvbudld5c FOREIGN KEY (region_fk) REFERENCES biocapture_test.region(id);


--
-- TOC entry 6385 (class 2606 OID 45745)
-- Name: vtu_request_approval fk_py5a0qr4j8lmbdras16v6fat3; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request_approval
    ADD CONSTRAINT fk_py5a0qr4j8lmbdras16v6fat3 FOREIGN KEY (vtu_request_fk) REFERENCES biocapture_test.vtu_request(pk);


--
-- TOC entry 6344 (class 2606 OID 45750)
-- Name: node_assignment_history fk_q3wi4dxhgna4jut0k6unx60ge; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment_history
    ADD CONSTRAINT fk_q3wi4dxhgna4jut0k6unx60ge FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6211 (class 2606 OID 45755)
-- Name: node_assignment fk_q45h9ywxm5sjq3gff05uy2y1t; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_q45h9ywxm5sjq3gff05uy2y1t FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6386 (class 2606 OID 45760)
-- Name: vtu_request_approval fk_q6be2tgr4sigcwtcg3du71jqp; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request_approval
    ADD CONSTRAINT fk_q6be2tgr4sigcwtcg3du71jqp FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6179 (class 2606 OID 45765)
-- Name: device fk_qbhfyihc404ca33auakq8hwwg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT fk_qbhfyihc404ca33auakq8hwwg FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6401 (class 2606 OID 45770)
-- Name: zz_b2b_log fk_qcmrrx52ogj2wdun22k99o0ea; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_b2b_log
    ADD CONSTRAINT fk_qcmrrx52ogj2wdun22k99o0ea FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6212 (class 2606 OID 45775)
-- Name: node_assignment fk_qd122tfu58wcfmrdytgp6l9jv; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fk_qd122tfu58wcfmrdytgp6l9jv FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6228 (class 2606 OID 45780)
-- Name: state fk_qeseiahylbc9dpi9y66ofe0s2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT fk_qeseiahylbc9dpi9y66ofe0s2 FOREIGN KEY (country_fk) REFERENCES biocapture_test.country(id);


--
-- TOC entry 6295 (class 2606 OID 45785)
-- Name: km_role_privilege fk_qf4a8kox9m2582d2m9c9rblp3; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_privilege
    ADD CONSTRAINT fk_qf4a8kox9m2582d2m9c9rblp3 FOREIGN KEY (privilege_fk) REFERENCES biocapture_test.km_privilege(pk);


--
-- TOC entry 6305 (class 2606 OID 45790)
-- Name: km_user_dealer_mapper fk_qs4pu8fr347dkucdtn2b1t4eu; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user_dealer_mapper
    ADD CONSTRAINT fk_qs4pu8fr347dkucdtn2b1t4eu FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6460 (class 2606 OID 45795)
-- Name: zz_password_policy fk_r7i70cu7ge8hg0b8j1qpws6sd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_password_policy
    ADD CONSTRAINT fk_r7i70cu7ge8hg0b8j1qpws6sd FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6279 (class 2606 OID 45800)
-- Name: issue_log fk_r927hhk36mgmi8w907ewmaj6f; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.issue_log
    ADD CONSTRAINT fk_r927hhk36mgmi8w907ewmaj6f FOREIGN KEY (issue_summary_fk) REFERENCES biocapture_test.issue_summary(pk);


--
-- TOC entry 6334 (class 2606 OID 45805)
-- Name: passport_detail fk_rb0euc5idfdboie9q16dmwesg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport_detail
    ADD CONSTRAINT fk_rb0euc5idfdboie9q16dmwesg FOREIGN KEY (signature_fk) REFERENCES biocapture_test.signature(id);


--
-- TOC entry 6195 (class 2606 OID 45810)
-- Name: node fk_rcr8qo8xjdi8w9bjnu8jnphka; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fk_rcr8qo8xjdi8w9bjnu8jnphka FOREIGN KEY (device_status_fk) REFERENCES biocapture_test.device_status(id);


--
-- TOC entry 6327 (class 2606 OID 45815)
-- Name: msisdn_detail fk_rj802lghggp6y07aikecgfv4u; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_detail
    ADD CONSTRAINT fk_rj802lghggp6y07aikecgfv4u FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6196 (class 2606 OID 45820)
-- Name: node fk_rkqyha03beyiglij3kcfwt2mv; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fk_rkqyha03beyiglij3kcfwt2mv FOREIGN KEY (kit_type_fk) REFERENCES biocapture_test.kit_type(pk);


--
-- TOC entry 6471 (class 2606 OID 45825)
-- Name: zz_user_creation_request fk_rqbkr55inqdlv5rem7v3t30bi; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_user_creation_request
    ADD CONSTRAINT fk_rqbkr55inqdlv5rem7v3t30bi FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6375 (class 2606 OID 45830)
-- Name: user_creation_request fk_rwlabjm3773rjoflyqb8hiey3; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_rwlabjm3773rjoflyqb8hiey3 FOREIGN KEY (requested_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6439 (class 2606 OID 45835)
-- Name: zz_km_role_privilege fk_s17d3sdbk0v5vognd85csybgj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_role_privilege
    ADD CONSTRAINT fk_s17d3sdbk0v5vognd85csybgj FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6406 (class 2606 OID 45840)
-- Name: zz_community_ fk_s2s64slx6a7t6flpnbe3ro6dl; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_community_
    ADD CONSTRAINT fk_s2s64slx6a7t6flpnbe3ro6dl FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6289 (class 2606 OID 45845)
-- Name: kit_retrieval_history fk_s5overgugym9ihjq58bhc8qg8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_retrieval_history
    ADD CONSTRAINT fk_s5overgugym9ihjq58bhc8qg8 FOREIGN KEY (performed_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6444 (class 2606 OID 45850)
-- Name: zz_km_user_region_mapper fk_seayenu43l3ubyk0jd2turdx8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user_region_mapper
    ADD CONSTRAINT fk_seayenu43l3ubyk0jd2turdx8 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6283 (class 2606 OID 45855)
-- Name: kit_mapping_approval fk_sm5968kt7rlocnjtnqiep6peg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_mapping_approval
    ADD CONSTRAINT fk_sm5968kt7rlocnjtnqiep6peg FOREIGN KEY (node_assignment_history_fk) REFERENCES biocapture_test.node_assignment_history(pk);


--
-- TOC entry 6389 (class 2606 OID 45860)
-- Name: whitelisted_name fk_sth2exlfdr33d8kcbk0rxva6c; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.whitelisted_name
    ADD CONSTRAINT fk_sth2exlfdr33d8kcbk0rxva6c FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6313 (class 2606 OID 45865)
-- Name: kyc_agility_mapper fk_su0haej69n1geeb2w0uqal6xc; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_agility_mapper
    ADD CONSTRAINT fk_su0haej69n1geeb2w0uqal6xc FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6303 (class 2606 OID 45870)
-- Name: km_role_workflow_mapper fk_syom0j63iibfmxd29wtn4u4t8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_workflow_mapper
    ADD CONSTRAINT fk_syom0j63iibfmxd29wtn4u4t8 FOREIGN KEY (km_role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6244 (class 2606 OID 45875)
-- Name: device_requisition_request fk_t0ormpo6q4hwbghe94xk2rr3q; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_requisition_request
    ADD CONSTRAINT fk_t0ormpo6q4hwbghe94xk2rr3q FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6382 (class 2606 OID 45880)
-- Name: vtu_request fk_t7igvsysml02hvey0la5lgehn; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request
    ADD CONSTRAINT fk_t7igvsysml02hvey0la5lgehn FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6383 (class 2606 OID 45885)
-- Name: vtu_request fk_teyemlrbbre5flibci5nwolox; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vtu_request
    ADD CONSTRAINT fk_teyemlrbbre5flibci5nwolox FOREIGN KEY (approved_by) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6156 (class 2606 OID 45890)
-- Name: bfp_failure_log fk_tkrh9caww5staalfrnoadbfma; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bfp_failure_log
    ADD CONSTRAINT fk_tkrh9caww5staalfrnoadbfma FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6376 (class 2606 OID 45895)
-- Name: user_creation_request fk_vvo8lv5ddnd53akl86ctsa6n; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_creation_request
    ADD CONSTRAINT fk_vvo8lv5ddnd53akl86ctsa6n FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6170 (class 2606 OID 45905)
-- Name: crm_push_status fka7fnv4c4f2q446bi1vqtuw04h; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.crm_push_status
    ADD CONSTRAINT fka7fnv4c4f2q446bi1vqtuw04h FOREIGN KEY (msisdn_detail_fk) REFERENCES biocapture_test.msisdn_detail(id);


--
-- TOC entry 6285 (class 2606 OID 45910)
-- Name: kit_marker fkacxl8pbfdh4yvcyamxfqmkhjl; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kit_marker
    ADD CONSTRAINT fkacxl8pbfdh4yvcyamxfqmkhjl FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6197 (class 2606 OID 45915)
-- Name: node fkai71q53fw4sr3u6e9ms0ieruk; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fkai71q53fw4sr3u6e9ms0ieruk FOREIGN KEY (device_type) REFERENCES biocapture_test.device_type(id);


--
-- TOC entry 6404 (class 2606 OID 45920)
-- Name: zz_blacklisted_name fkaok1f2wa0ufngy0bsjuy4haaj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_blacklisted_name
    ADD CONSTRAINT fkaok1f2wa0ufngy0bsjuy4haaj FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6420 (class 2606 OID 45925)
-- Name: zz_device_tag_request fkauiqgab4yomfl9j9mgjnc00yt; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_tag_request
    ADD CONSTRAINT fkauiqgab4yomfl9j9mgjnc00yt FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6392 (class 2606 OID 45930)
-- Name: wsq_image fkb3c195njn5l5cn5ry94i7et9m; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.wsq_image
    ADD CONSTRAINT fkb3c195njn5l5cn5ry94i7et9m FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6358 (class 2606 OID 45935)
-- Name: subscriber_detail fkb7ibnchsylyn6vrcdv5dwowsa; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT fkb7ibnchsylyn6vrcdv5dwowsa FOREIGN KEY (lga_of_registration) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6314 (class 2606 OID 45940)
-- Name: kyc_agility_mapper fkbgv99rtkjyvfyh8ypsq22nfki; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_agility_mapper
    ADD CONSTRAINT fkbgv99rtkjyvfyh8ypsq22nfki FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6157 (class 2606 OID 45945)
-- Name: bfp_failure_log fkbolm9cucujdsqqhpmtcjk703c; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bfp_failure_log
    ADD CONSTRAINT fkbolm9cucujdsqqhpmtcjk703c FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6434 (class 2606 OID 45950)
-- Name: zz_kit_type fkboo5hopn2orers3vl9folvjwi; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kit_type
    ADD CONSTRAINT fkboo5hopn2orers3vl9folvjwi FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6245 (class 2606 OID 45955)
-- Name: device_specific_setting fkbv8yca71gc3q89fnhhqyb7toq; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_specific_setting
    ADD CONSTRAINT fkbv8yca71gc3q89fnhhqyb7toq FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6257 (class 2606 OID 45960)
-- Name: device_tag_request fkc2apvjlwvq9t5dgv4q4hy6bwv; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fkc2apvjlwvq9t5dgv4q4hy6bwv FOREIGN KEY (workflow_fk) REFERENCES biocapture_test.workflow(pk);


--
-- TOC entry 6452 (class 2606 OID 45965)
-- Name: zz_node_assignment fkc44nhi2ux09622ljkgq7f4n6p; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_node_assignment
    ADD CONSTRAINT fkc44nhi2ux09622ljkgq7f4n6p FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6213 (class 2606 OID 45970)
-- Name: node_assignment fkcagvntvf59f0nm30tv86fry9j; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fkcagvntvf59f0nm30tv86fry9j FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6456 (class 2606 OID 45975)
-- Name: zz_outlet_type fkccudumds3d7qyqig9rblbmj3w; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_outlet_type
    ADD CONSTRAINT fkccudumds3d7qyqig9rblbmj3w FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6214 (class 2606 OID 45980)
-- Name: node_assignment fkcf0ej8ad9w3hoxav0s96fbitg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fkcf0ej8ad9w3hoxav0s96fbitg FOREIGN KEY (territory_fk) REFERENCES biocapture_test.territory(id);


--
-- TOC entry 6445 (class 2606 OID 45985)
-- Name: zz_kyc_blacklist fkd7xvduq5qmdk030r74x4dmul7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kyc_blacklist
    ADD CONSTRAINT fkd7xvduq5qmdk030r74x4dmul7 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6422 (class 2606 OID 45990)
-- Name: zz_device_type fkd8daa4rms3ybta6v362n0d926; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_type
    ADD CONSTRAINT fkd8daa4rms3ybta6v362n0d926 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6463 (class 2606 OID 45995)
-- Name: zz_serial_msisdn_mapper fkd95313flxydd7cvv3tfv0xx1w; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_serial_msisdn_mapper
    ADD CONSTRAINT fkd95313flxydd7cvv3tfv0xx1w FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6461 (class 2606 OID 46000)
-- Name: zz_region fkdh314bmpaepo9qr4u5ifg4xec; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_region
    ADD CONSTRAINT fkdh314bmpaepo9qr4u5ifg4xec FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6258 (class 2606 OID 46005)
-- Name: device_tag_request fkdmasjputc3h81wtoowr9lrncj; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fkdmasjputc3h81wtoowr9lrncj FOREIGN KEY (requested_by_km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6198 (class 2606 OID 46010)
-- Name: node fke073avlobxoafvp095w74sx00; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fke073avlobxoafvp095w74sx00 FOREIGN KEY (kit_type_fk) REFERENCES biocapture_test.kit_type(pk);


--
-- TOC entry 6337 (class 2606 OID 46015)
-- Name: signature fke2h4v77njbyo7xj7gxy0qc277; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.signature
    ADD CONSTRAINT fke2h4v77njbyo7xj7gxy0qc277 FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6378 (class 2606 OID 46020)
-- Name: version_log fke83kloxlowdaoxia8kwu0vn58; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.version_log
    ADD CONSTRAINT fke83kloxlowdaoxia8kwu0vn58 FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6265 (class 2606 OID 46025)
-- Name: dispute fkejapg7yn2yk10vb1fu0ttxlrx; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dispute
    ADD CONSTRAINT fkejapg7yn2yk10vb1fu0ttxlrx FOREIGN KEY (vr_fk) REFERENCES biocapture_test.vr_(pk);


--
-- TOC entry 6215 (class 2606 OID 46030)
-- Name: node_assignment fkeq7snh9s7x4nfm58ssks9a09i; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fkeq7snh9s7x4nfm58ssks9a09i FOREIGN KEY (dm_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6353 (class 2606 OID 46035)
-- Name: social_media fkequiuwq6osvdeu2tfb1yolk7q; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.social_media
    ADD CONSTRAINT fkequiuwq6osvdeu2tfb1yolk7q FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6229 (class 2606 OID 46040)
-- Name: state fkf4kjhj2hy4ibp5wlg1t2s44gm; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT fkf4kjhj2hy4ibp5wlg1t2s44gm FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6296 (class 2606 OID 46045)
-- Name: km_role_privilege fkfateqdu3a113g9mbf5nex8g2v; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_privilege
    ADD CONSTRAINT fkfateqdu3a113g9mbf5nex8g2v FOREIGN KEY (privilege_fk) REFERENCES biocapture_test.km_privilege(pk);


--
-- TOC entry 6216 (class 2606 OID 46050)
-- Name: node_assignment fkfdn878ms5mn9yj4sackno0rs9; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fkfdn878ms5mn9yj4sackno0rs9 FOREIGN KEY (area_fk) REFERENCES biocapture_test.area(id);


--
-- TOC entry 6199 (class 2606 OID 46055)
-- Name: node fkfeqycttejspddl2n7heufdwlo; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fkfeqycttejspddl2n7heufdwlo FOREIGN KEY (device_owner) REFERENCES biocapture_test.device_owner(pk);


--
-- TOC entry 6409 (class 2606 OID 46060)
-- Name: zz_dealer_division fkfi9gyd0dti863lj0vbuogmfbm; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_dealer_division
    ADD CONSTRAINT fkfi9gyd0dti863lj0vbuogmfbm FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6455 (class 2606 OID 46065)
-- Name: zz_outlet fkgbm4r410alpjwv1sgcn2cfjr8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_outlet
    ADD CONSTRAINT fkgbm4r410alpjwv1sgcn2cfjr8 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6321 (class 2606 OID 46070)
-- Name: kyc_broadcast fkggfkk8akqo2glt3fpwu2df8tx; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT fkggfkk8akqo2glt3fpwu2df8tx FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6441 (class 2606 OID 46075)
-- Name: zz_km_user fkgjd8f9dslk6c5miu2iflcnp3q; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_user
    ADD CONSTRAINT fkgjd8f9dslk6c5miu2iflcnp3q FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6300 (class 2606 OID 46080)
-- Name: user_role fkgt0tmtb0xtg1k1b1ys4bi19dh; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_role
    ADD CONSTRAINT fkgt0tmtb0xtg1k1b1ys4bi19dh FOREIGN KEY (user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6217 (class 2606 OID 46085)
-- Name: node_assignment fkgttmxic055jfr2ecxeja10ige; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fkgttmxic055jfr2ecxeja10ige FOREIGN KEY (fsa_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6297 (class 2606 OID 46090)
-- Name: km_role_privilege fkgxsin9l03i8o8au27g1dqyn69; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_role_privilege
    ADD CONSTRAINT fkgxsin9l03i8o8au27g1dqyn69 FOREIGN KEY (role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6390 (class 2606 OID 46095)
-- Name: whitelisted_name fkh7lhwin2exr6m71svc154y87m; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.whitelisted_name
    ADD CONSTRAINT fkh7lhwin2exr6m71svc154y87m FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6269 (class 2606 OID 46100)
-- Name: field_edit_reason fkh8saj6icndjof2uulor0n6hh7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.field_edit_reason
    ADD CONSTRAINT fkh8saj6icndjof2uulor0n6hh7 FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6462 (class 2606 OID 46105)
-- Name: zz_region fkhbcs7yiy1yrntw7fhnrx7ynn0; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_region
    ADD CONSTRAINT fkhbcs7yiy1yrntw7fhnrx7ynn0 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6330 (class 2606 OID 46110)
-- Name: msisdn_status fkhdi1bnlblqroa36ovw2y5vs7h; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_status
    ADD CONSTRAINT fkhdi1bnlblqroa36ovw2y5vs7h FOREIGN KEY (msisdn_detail_fk) REFERENCES biocapture_test.msisdn_detail(id);


--
-- TOC entry 6466 (class 2606 OID 46115)
-- Name: zz_telecom_master_records fkhhljd7vdtoay4iy4kyo61r1b0; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_telecom_master_records
    ADD CONSTRAINT fkhhljd7vdtoay4iy4kyo61r1b0 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6200 (class 2606 OID 46120)
-- Name: node fkiae8js3jr0r7q2cnfilfa2lcf; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fkiae8js3jr0r7q2cnfilfa2lcf FOREIGN KEY (enrollment_ref) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6230 (class 2606 OID 46125)
-- Name: state fkiawnl3kk090dot966an0ouy4a; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT fkiawnl3kk090dot966an0ouy4a FOREIGN KEY (region_fk) REFERENCES biocapture_test.region(id);


--
-- TOC entry 6359 (class 2606 OID 46130)
-- Name: subscriber_detail fkihye2uoexbsjg7mmvgp9ooa72; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.subscriber_detail
    ADD CONSTRAINT fkihye2uoexbsjg7mmvgp9ooa72 FOREIGN KEY (country_of_origin) REFERENCES biocapture_test.country(id);


--
-- TOC entry 6237 (class 2606 OID 46135)
-- Name: zone fkjf5oakb0j83a70mxhf9fsrjwt; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zone
    ADD CONSTRAINT fkjf5oakb0j83a70mxhf9fsrjwt FOREIGN KEY (region_fk) REFERENCES biocapture_test.region(id);


--
-- TOC entry 6328 (class 2606 OID 46140)
-- Name: msisdn_detail fkjgvlixg8uhowix8feevumot38; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_detail
    ADD CONSTRAINT fkjgvlixg8uhowix8feevumot38 FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6180 (class 2606 OID 46145)
-- Name: device fkk28c3rgtswireens8ywdm3v00; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT fkk28c3rgtswireens8ywdm3v00 FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6316 (class 2606 OID 46150)
-- Name: kyc_blacklist fkkaf54b6uh0wy7p5w1gpeq1cul; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_blacklist
    ADD CONSTRAINT fkkaf54b6uh0wy7p5w1gpeq1cul FOREIGN KEY (enrollment_ref) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6322 (class 2606 OID 46155)
-- Name: kyc_broadcast fkkbbyk93wt31285j1nihc2w10u; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_broadcast
    ADD CONSTRAINT fkkbbyk93wt31285j1nihc2w10u FOREIGN KEY (node_fk) REFERENCES biocapture_test.node(id);


--
-- TOC entry 6464 (class 2606 OID 46160)
-- Name: zz_state fkkjooxcaypy4hedig936mt2prk; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_state
    ADD CONSTRAINT fkkjooxcaypy4hedig936mt2prk FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6201 (class 2606 OID 46165)
-- Name: node fkkm21lv7dbwecyn3uxorrnosj8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node
    ADD CONSTRAINT fkkm21lv7dbwecyn3uxorrnosj8 FOREIGN KEY (device_status_fk) REFERENCES biocapture_test.device_status(id);


--
-- TOC entry 6329 (class 2606 OID 46170)
-- Name: msisdn_provision_status_log fkksuqn1by8v8gplxevwhxl0f8a; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_provision_status_log
    ADD CONSTRAINT fkksuqn1by8v8gplxevwhxl0f8a FOREIGN KEY (msisdn_provision_status_fk) REFERENCES biocapture_test.msisdn_provision_status(pk);


--
-- TOC entry 6333 (class 2606 OID 46175)
-- Name: passport fkkxbnkj3qr3qpmubigpq354fym; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport
    ADD CONSTRAINT fkkxbnkj3qr3qpmubigpq354fym FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6324 (class 2606 OID 46180)
-- Name: log_ fkl4o982blhh2a8eein14gunte8; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.log_
    ADD CONSTRAINT fkl4o982blhh2a8eein14gunte8 FOREIGN KEY (vlog_fk) REFERENCES biocapture_test.vl_(pk);


--
-- TOC entry 6185 (class 2606 OID 46185)
-- Name: kyc_dealer fkli4mddtftf2i07n9p7yjnpho4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT fkli4mddtftf2i07n9p7yjnpho4 FOREIGN KEY (dealer_division_fk) REFERENCES biocapture_test.dealer_division(pk);


--
-- TOC entry 6218 (class 2606 OID 46190)
-- Name: node_assignment fklitd6mt59q78shnrtkb7xal0p; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fklitd6mt59q78shnrtkb7xal0p FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6363 (class 2606 OID 46195)
-- Name: trade_partners_state fklrep0ee0kqt1fodb1ytyqd37; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.trade_partners_state
    ADD CONSTRAINT fklrep0ee0kqt1fodb1ytyqd37 FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6231 (class 2606 OID 46200)
-- Name: state fklty1ytd5y90hwvl30s6t5dccg; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.state
    ADD CONSTRAINT fklty1ytd5y90hwvl30s6t5dccg FOREIGN KEY (country_fk) REFERENCES biocapture_test.country(id);


--
-- TOC entry 6379 (class 2606 OID 46205)
-- Name: vl_ fklujgmhqa9b43ejnms95oxvqsq; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.vl_
    ADD CONSTRAINT fklujgmhqa9b43ejnms95oxvqsq FOREIGN KEY (vr_fk) REFERENCES biocapture_test.vr_(pk);


--
-- TOC entry 6446 (class 2606 OID 46210)
-- Name: zz_kyc_broadcast fklwut6t8hieucnx4sjyxr7u7hm; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_kyc_broadcast
    ADD CONSTRAINT fklwut6t8hieucnx4sjyxr7u7hm FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6423 (class 2606 OID 46215)
-- Name: zz_enrollment_ref fkmi9y79pue4b6ytlreje2k1o3l; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_enrollment_ref
    ADD CONSTRAINT fkmi9y79pue4b6ytlreje2k1o3l FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6326 (class 2606 OID 46220)
-- Name: meta_data fkmj8mv6yp4vm42ofanveav8sks; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.meta_data
    ADD CONSTRAINT fkmj8mv6yp4vm42ofanveav8sks FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6301 (class 2606 OID 46225)
-- Name: user_role fkmjyexeae7qnbpnqe95i38vd5c; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.user_role
    ADD CONSTRAINT fkmjyexeae7qnbpnqe95i38vd5c FOREIGN KEY (role_fk) REFERENCES biocapture_test.km_role(pk);


--
-- TOC entry 6158 (class 2606 OID 46230)
-- Name: bfp_sync_log fkml0cqonw62bq3mrkr6kbh4442; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.bfp_sync_log
    ADD CONSTRAINT fkml0cqonw62bq3mrkr6kbh4442 FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6405 (class 2606 OID 46235)
-- Name: zz_blacklisted_name_settings fkmr5g7j81uo3f0b6wmjfat9j7t; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_blacklisted_name_settings
    ADD CONSTRAINT fkmr5g7j81uo3f0b6wmjfat9j7t FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6408 (class 2606 OID 46240)
-- Name: zz_country fkmwgadxjuawkfnin3gacoqrm22; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_country
    ADD CONSTRAINT fkmwgadxjuawkfnin3gacoqrm22 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6186 (class 2606 OID 46245)
-- Name: kyc_dealer fknihkf4qsfv2kd0anf2isn3m05; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT fknihkf4qsfv2kd0anf2isn3m05 FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6190 (class 2606 OID 46250)
-- Name: lga fkniv5nsqiph2p5iqwee1alwjg5; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.lga
    ADD CONSTRAINT fkniv5nsqiph2p5iqwee1alwjg5 FOREIGN KEY (state_fk) REFERENCES biocapture_test.state(id);


--
-- TOC entry 6259 (class 2606 OID 46255)
-- Name: device_tag_request fknjhlodlpumj1xfddars6btuf0; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fknjhlodlpumj1xfddars6btuf0 FOREIGN KEY (lga_fk) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6219 (class 2606 OID 46260)
-- Name: node_assignment fknnjpcbpafo0w85w8nhksm7ktn; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fknnjpcbpafo0w85w8nhksm7ktn FOREIGN KEY (outlet_fk) REFERENCES biocapture_test.outlet(pk);


--
-- TOC entry 6451 (class 2606 OID 46265)
-- Name: zz_node fknp8nin4jkdroby6jusdutk4ym; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_node
    ADD CONSTRAINT fknp8nin4jkdroby6jusdutk4ym FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6267 (class 2606 OID 46270)
-- Name: enrollment_log fknvr95f13i41cskc8klrrcofpy; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.enrollment_log
    ADD CONSTRAINT fknvr95f13i41cskc8klrrcofpy FOREIGN KEY (enrollment_ref_fk) REFERENCES biocapture_test.enrollment_ref(id);


--
-- TOC entry 6335 (class 2606 OID 46275)
-- Name: passport_detail fko1re2u4xcp138v61echuol852; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.passport_detail
    ADD CONSTRAINT fko1re2u4xcp138v61echuol852 FOREIGN KEY (signature_fk) REFERENCES biocapture_test.signature(id);


--
-- TOC entry 6173 (class 2606 OID 46280)
-- Name: dynamic_data fko26je37c3qno17hluedk2imok; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.dynamic_data
    ADD CONSTRAINT fko26je37c3qno17hluedk2imok FOREIGN KEY (basic_data_fk) REFERENCES biocapture_test.basic_data(id);


--
-- TOC entry 6474 (class 2606 OID 46285)
-- Name: zz_workflow fko6u5g6b02f9gkshqrb9ya0pki; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_workflow
    ADD CONSTRAINT fko6u5g6b02f9gkshqrb9ya0pki FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6235 (class 2606 OID 46290)
-- Name: territory fkodmbvsnpe0rxdkk0pr0cs5u6t; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.territory
    ADD CONSTRAINT fkodmbvsnpe0rxdkk0pr0cs5u6t FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6331 (class 2606 OID 46295)
-- Name: msisdn_status_log fkogifhy05vyqin3e8oh3uacj7s; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.msisdn_status_log
    ADD CONSTRAINT fkogifhy05vyqin3e8oh3uacj7s FOREIGN KEY (msisdn_status_fk) REFERENCES biocapture_test.msisdn_status(id);


--
-- TOC entry 6249 (class 2606 OID 46300)
-- Name: km_user fkoo9mgacfaj6aervrse4xn67v0; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.km_user
    ADD CONSTRAINT fkoo9mgacfaj6aervrse4xn67v0 FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6435 (class 2606 OID 46305)
-- Name: zz_km_privilege fkpawsf76w69yebvex1ffeg8vux; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_km_privilege
    ADD CONSTRAINT fkpawsf76w69yebvex1ffeg8vux FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6163 (class 2606 OID 46310)
-- Name: blacklisted_name fkpl39d1ap2x5udxaxpyf1371h2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.blacklisted_name
    ADD CONSTRAINT fkpl39d1ap2x5udxaxpyf1371h2 FOREIGN KEY (km_user_fk) REFERENCES biocapture_test.km_user(pk);


--
-- TOC entry 6260 (class 2606 OID 46315)
-- Name: device_tag_request fkq0xl01mxc1ehm1kfy7ooymyro; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fkq0xl01mxc1ehm1kfy7ooymyro FOREIGN KEY (device_type_fk) REFERENCES biocapture_test.device_type(id);


--
-- TOC entry 6181 (class 2606 OID 46320)
-- Name: device fkqhgwtkqccyl7vdk1asqfvh42f; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device
    ADD CONSTRAINT fkqhgwtkqccyl7vdk1asqfvh42f FOREIGN KEY (device_type_fk) REFERENCES biocapture_test.device_type(id);


--
-- TOC entry 6465 (class 2606 OID 46325)
-- Name: zz_state fkrlv8akdvap3xq0y55lre5qio7; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_state
    ADD CONSTRAINT fkrlv8akdvap3xq0y55lre5qio7 FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6225 (class 2606 OID 46330)
-- Name: outlet fkro9spijnexdaenc661itr4osn; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.outlet
    ADD CONSTRAINT fkro9spijnexdaenc661itr4osn FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6191 (class 2606 OID 46335)
-- Name: lga fksf8omum6m9jh01jtiu8jvmq4; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.lga
    ADD CONSTRAINT fksf8omum6m9jh01jtiu8jvmq4 FOREIGN KEY (territory_fk) REFERENCES biocapture_test.territory(id);


--
-- TOC entry 6141 (class 2606 OID 46340)
-- Name: area fksv8029hipc7h44ab255tiim0q; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.area
    ADD CONSTRAINT fksv8029hipc7h44ab255tiim0q FOREIGN KEY (lga_fk) REFERENCES biocapture_test.lga(id);


--
-- TOC entry 6449 (class 2606 OID 46345)
-- Name: zz_lga fkswp1eqptaq5n3vrocpagyttyx; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_lga
    ADD CONSTRAINT fkswp1eqptaq5n3vrocpagyttyx FOREIGN KEY (rev) REFERENCES biocapture_test.revinfo(rev);


--
-- TOC entry 6187 (class 2606 OID 46350)
-- Name: kyc_dealer fkt5tljv5h7ptubv6i61g4jaqrd; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.kyc_dealer
    ADD CONSTRAINT fkt5tljv5h7ptubv6i61g4jaqrd FOREIGN KEY (dealer_type_fk) REFERENCES biocapture_test.dealer_type(pk);


--
-- TOC entry 6261 (class 2606 OID 46355)
-- Name: device_tag_request fkt843vtj3gjy0wbh4xtm8q3ec2; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.device_tag_request
    ADD CONSTRAINT fkt843vtj3gjy0wbh4xtm8q3ec2 FOREIGN KEY (kyc_dealer_fk) REFERENCES biocapture_test.kyc_dealer(pk);


--
-- TOC entry 6220 (class 2606 OID 46360)
-- Name: node_assignment fktb2wprh957g0sk971fy5g15vp; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.node_assignment
    ADD CONSTRAINT fktb2wprh957g0sk971fy5g15vp FOREIGN KEY (zone_fk) REFERENCES biocapture_test.zone(id);


--
-- TOC entry 6415 (class 2606 OID 46365)
-- Name: zz_device_owner fktojn9j908p0jpd91mm6uojpsy; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_device_owner
    ADD CONSTRAINT fktojn9j908p0jpd91mm6uojpsy FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


--
-- TOC entry 6476 (class 2606 OID 46370)
-- Name: zz_zone fktolnwhruwj62o0rk6fxy0e0sw; Type: FK CONSTRAINT; Schema: biocapture_test; Owner: enterprisedb
--

ALTER TABLE ONLY biocapture_test.zz_zone
    ADD CONSTRAINT fktolnwhruwj62o0rk6fxy0e0sw FOREIGN KEY (rev) REFERENCES biocapture_test.zz_auditor(rev_no);


-- Completed on 2020-04-16 13:43:12

--
-- EnterpriseDB database dump complete
--

