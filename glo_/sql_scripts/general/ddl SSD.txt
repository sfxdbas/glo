-- Table: public.sim_swap_demographic

-- DROP TABLE public.sim_swap_demographic;

CREATE TABLE public.sim_swap_demographic
(
    pk bigint NOT NULL,
    active boolean NOT NULL,
    create_date timestamp without time zone NOT NULL,
    deleted boolean NOT NULL,
    last_modified timestamp without time zone NOT NULL,
    activation_year character varying(2048) COLLATE pg_catalog."default",
    agent_email character varying(2048) COLLATE pg_catalog."default",
    alternate_phone_number character varying(2048) COLLATE pg_catalog."default",
    check_status character varying(2048) COLLATE pg_catalog."default",
    data_pack character varying(2048) COLLATE pg_catalog."default",
    date_of_birth timestamp without time zone,
    device_id character varying(2048) COLLATE pg_catalog."default",
    device_tag character varying(2048) COLLATE pg_catalog."default",
    first_name character varying(2048) COLLATE pg_catalog."default",
    frequently_dailed_numbers character varying(3072) COLLATE pg_catalog."default",
    gender character varying(2048) COLLATE pg_catalog."default",
    alert_raised boolean,
    last_invoice_amount character varying(2048) COLLATE pg_catalog."default",
    last_invoice_date timestamp without time zone,
    last_recharge_amount character varying(2048) COLLATE pg_catalog."default",
    last_recharge_date timestamp without time zone,
    mac_address character varying(2048) COLLATE pg_catalog."default",
    mother_maiden_name character varying(2048) COLLATE pg_catalog."default",
    msidn_heirachy character varying(2048) COLLATE pg_catalog."default",
    msisdn character varying(2048) COLLATE pg_catalog."default",
    nationality character varying(2048) COLLATE pg_catalog."default",
    occupation character varying(2048) COLLATE pg_catalog."default",
    order_number character varying(2048) COLLATE pg_catalog."default",
    otp_authentication_status character varying(2048) COLLATE pg_catalog."default",
    outlet_fk bigint,
    override_status character varying(2048) COLLATE pg_catalog."default",
    proxy_name character varying(2048) COLLATE pg_catalog."default",
    proxy_number character varying(2048) COLLATE pg_catalog."default",
    puk character varying(2048) COLLATE pg_catalog."default",
    raw_sim_status character varying(2048) COLLATE pg_catalog."default",
    registration_status character varying(2048) COLLATE pg_catalog."default",
    rejection_count bigint,
    residential_address character varying(2048) COLLATE pg_catalog."default",
    sim_serial character varying(2048) COLLATE pg_catalog."default",
    sim_swap_category character varying(2048) COLLATE pg_catalog."default",
    sim_swap character varying(2048) COLLATE pg_catalog."default",
    sim_swap_upgrade character varying(2048) COLLATE pg_catalog."default",
    state_of_origin character varying(2048) COLLATE pg_catalog."default",
    subscriber_type character varying(2048) COLLATE pg_catalog."default",
    surname character varying(2048) COLLATE pg_catalog."default",
    swap_time timestamp without time zone,
    target_msisdn character varying(2048) COLLATE pg_catalog."default",
    target_sim_serial character varying(2048) COLLATE pg_catalog."default",
    rejection_time_stamp timestamp without time zone,
    swap_status character varying(2048) COLLATE pg_catalog."default",
    unique_id character varying(2048) COLLATE pg_catalog."default" NOT NULL,
    checker_user_id character varying(2048) COLLATE pg_catalog."default",
    reg_status_description character varying(2048) COLLATE pg_catalog."default",
    workkflow_fk bigint,
    check_date timestamp without time zone,
    checker_outlet_name character varying(2048) COLLATE pg_catalog."default",
    status_change_date timestamp without time zone,
    swap_lock_reason character varying(2048) COLLATE pg_catalog."default",
    check_workkflow_fk bigint,
    lock_workkflow_fk bigint,
    CONSTRAINT sim_swap_demographic_pkey PRIMARY KEY (pk),
    CONSTRAINT uk_2fa04vnxi0did0p6gmnxkgfqs UNIQUE (unique_id),
    CONSTRAINT fk_f7rgsqoxvp1y8yivomaiv4nrf FOREIGN KEY (workkflow_fk)
        REFERENCES public.workflow (pk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.sim_swap_demographic
    OWNER to biocapture;

GRANT ALL ON TABLE public.sim_swap_demographic TO biocapture;

GRANT SELECT ON TABLE public.sim_swap_demographic TO sfx_akin;

GRANT SELECT ON TABLE public.sim_swap_demographic TO sfx_ngozi;