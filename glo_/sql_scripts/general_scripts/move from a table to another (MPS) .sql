TC: -- possibility that it has increased
-- 64,400,181
-- 64,400,181
-- 13,543,066 - log 
 

-- step by step process to change table DDL 

-- 1. confirm all the tables with relationship to msisdn_provision_status
-- 2. create flat table with name msisdn_provision_status_new with all necessary constraints
-- 3. insert into flat table most recent entry of msisdn, sim_serial from msisdn_provision_status
-- 4. rename msisdn_provision_status to msisdn_provision_status_old_date 
-- 5. rename msisdn_provision_status_new from step 1 to msisdn_provision_status
-- 6. check from all referenced tables that they reference the new msisdn_provision_status
-- 7. perform final checks on the new msisdn_provision_status
-- 8. due to issues that might occur in step 6, we either neglect the FK constraint on the new mps or create another 
	  mps_log table that will reference the new mps while the older one is renamed to suit the old mps.


--1. checksDone
SELECT
    r.table_name
FROM information_schema.constraint_column_usage       u
INNER JOIN information_schema.referential_constraints fk
           ON u.constraint_catalog = fk.unique_constraint_catalog
               AND u.constraint_schema = fk.unique_constraint_schema
               AND u.constraint_name = fk.unique_constraint_name
INNER JOIN information_schema.key_column_usage        r
           ON r.constraint_catalog = fk.constraint_catalog
               AND r.constraint_schema = fk.constraint_schema
               AND r.constraint_name = fk.constraint_name
WHERE
    u.table_schema = 'public' AND
    u.table_name = 'msisdn_provision_status'
;


--2. 
CREATE TABLE public.msisdn_provision_status_new (
	pk int8 NOT NULL,
	active bool NOT NULL,
	create_date timestamp NOT NULL,
	deleted bool NOT NULL,
	last_modified timestamp NOT NULL,
	imsi varchar(255) NULL,
	msisdn varchar(255) NULL,
	sim_serial varchar(255) NULL,
	status varchar(255) NULL,
	status_reason varchar(255) NULL,
	instance_ip varchar(255) NULL,
	instance_port varchar(255) NULL,
	platform varchar(255) NULL,
	source_path varchar(255) NULL,
	unique_id varchar(255) NULL,
	siebel_id int8 NULL,
	delta_imsi varchar(255) NULL,
	delta_sim_serial varchar(255) NULL,
	msisdn_hierarchy varchar(255) NULL,
	sim_swap_status varchar(255) NULL,
	activation_date timestamp NULL,
	reg_date timestamp NULL,
	other_status varchar(255) NULL,
	CONSTRAINT msisdn_unique UNIQUE (msisdn),
	CONSTRAINT new_msisdn_provision_status_pkey PRIMARY KEY (pk)
);
CREATE INDEX new_msisdn_provision_status_create_date_idx ON public.msisdn_provision_status USING btree (create_date);
CREATE INDEX new_msisdn_provision_status_date_idx ON public.msisdn_provision_status USING btree (date(create_date));
CREATE INDEX new_msisdn_provision_status_imsi_idx ON public.msisdn_provision_status USING btree (imsi);
CREATE INDEX new_msisdn_provision_status_msisdn_idx ON public.msisdn_provision_status USING btree (msisdn);
CREATE INDEX new_msisdn_provision_status_msisdn_idx1 ON public.msisdn_provision_status USING btree (msisdn);
CREATE INDEX new_msisdn_provision_status_platform_idx ON public.msisdn_provision_status USING btree (platform);
CREATE INDEX new_msisdn_provision_status_sim_serial_idx ON public.msisdn_provision_status USING btree (sim_serial);
CREATE INDEX new_msisdn_provision_status_sim_serial_idx1 ON public.msisdn_provision_status USING btree (sim_serial);
CREATE INDEX new_msisdn_provision_status_sim_swap_status_idx ON public.msisdn_provision_status USING btree (sim_swap_status);
CREATE INDEX new_msisdn_provision_status_unique_id_idx ON public.msisdn_provision_status USING btree (unique_id);



--3. 
INSERT INTO public.msisdn_provision_status_new
(pk, active, create_date, deleted, last_modified, imsi, msisdn, sim_serial, status, 
status_reason, instance_ip, instance_port, platform, source_path, unique_id, siebel_id,
 delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status, activation_date, reg_date,
 other_status)
select pk, active, create_date, deleted, last_modified, imsi, msisdn, sim_serial, status, 
status_reason, unique_id, platform, instance_ip, instance_port, source_path, siebel_id::bigint, 
delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status, reg_date, activation_date
from (
SELECT pk, active, create_date, deleted, last_modified, imsi, msisdn, sim_serial, status, 
status_reason, unique_id, platform, instance_ip, instance_port, source_path, siebel_id::bigint, 
delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status, reg_date, activation_date
,row_number() over (partition by msisdn order by create_date desc )
FROM public.msisdn_provision_status
) a where row_number = 1 
;

/* during change */ 4 & 5 ( checks on DELTA --> insert & update 
--4. 
ALTER TABLE public.msisdn_provision_status
RENAME TO msisdn_provision_status_old_03022022;


--5.
ALTER TABLE public.msisdn_provision_status_new 
RENAME TO msisdn_provision_status;

--6. (issues might be experienced in this step) == (or we skip this step and move to step 8)
ALTER TABLE public.msisdn_provision_status_log ADD CONSTRAINT msisdn_provision_status_log_fk
FOREIGN KEY (msisdn_provision_status_fk) REFERENCES msisdn_provision_status(pk);


SELECT
    r.table_name
FROM information_schema.constraint_column_usage       u
INNER JOIN information_schema.referential_constraints fk
           ON u.constraint_catalog = fk.unique_constraint_catalog
               AND u.constraint_schema = fk.unique_constraint_schema
               AND u.constraint_name = fk.unique_constraint_name
INNER JOIN information_schema.key_column_usage        r
           ON r.constraint_catalog = fk.constraint_catalog
               AND r.constraint_schema = fk.constraint_schema
               AND r.constraint_name = fk.constraint_name
WHERE
    u.table_schema = 'public' AND
    u.table_name = 'msisdn_provision_status'
;


--7.
attempt an insert of an existing entry on the new msisdn_provision_status. An error confirms success


--8. 
CREATE TABLE public.msisdn_provision_status_log_new (
	pk int8 NOT NULL,
	active bool NOT NULL,
	create_date timestamp NOT NULL,
	deleted bool NOT NULL,
	last_modified timestamp NOT NULL,
	imsi varchar(255) NULL,
	msisdn varchar(255) NULL,
	operaion_channel varchar(255) NULL,
	operation_name varchar(255) NULL,
	sim_serial varchar(255) NULL,
	status varchar(255) NULL,
	status_reason varchar(255) NULL,
	msisdn_provision_status_fk int8 NULL,
	platform varchar(255) NULL,
	unique_id varchar(255) NULL,
	delta_imsi varchar(255) NULL,
	delta_sim_serial varchar(255) NULL,
	msisdn_hierarchy varchar(255) NULL,
	sim_swap_status varchar(255) NULL,
	CONSTRAINT new_msisdn_provision_status_log_pkey PRIMARY KEY (pk),
	CONSTRAINT new_fkksuqn1by8v8gplxevwhxl0f8a FOREIGN KEY (msisdn_provision_status_fk) REFERENCES msisdn_provision_status_new(pk)
);
CREATE INDEX new_msisdn_provision_status_log_imsi_idx ON public.msisdn_provision_status_log USING btree (imsi);
CREATE INDEX new_msisdn_provision_status_log_msisdn_idx ON public.msisdn_provision_status_log USING btree (msisdn);
CREATE INDEX new_msisdn_provision_status_log_sim_serial_idx ON public.msisdn_provision_status_log USING btree (sim_serial);
CREATE INDEX new_msisdn_provision_status_log_unique_id_idx ON public.msisdn_provision_status_log USING btree (unique_id);




--INSERT INTO public.msisdn_provision_status_log_new
--(pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason,
-- msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status)
select pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason,
 msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status 
from msisdn_provision_status_log_hold_03022022 a
where exists 
(select 1 
from msisdn_provision_status_new b 
where a.msisdn_provision_status_fk = b.pk )
;


ALTER TABLE public.msisdn_provision_status_log
RENAME TO msisdn_provision_status_log_old_03022022;


ALTER TABLE public.msisdn_provision_status_log_new
RENAME TO msisdn_provision_status_log;





-->>> 
-- checking for delta 
-- update 
select * -- max(last_modified) 
from msisdn_provision_status a 
where /*exists 
(select 1 
from msisdn_provision_status_new c 
where a.pk = c.pk )
and */a.last_modified >
(select max(last_modified) 
from msisdn_provision_status_new b  
) 
;

update
	msisdn_provision_status_new a
set
	a.active = b.active ,
	a.create_date = b.create_date ,
	a.deleted = b.deleted ,
	a.last_modified = b.last_modified ,
	a.imsi = b.imsi ,
	a.msisdn = b.msisdn ,
	a.sim_serial = b.sim_serial ,
	a.status = b.status ,
	a.status_reason = b.status_reason ,
	a.instance_ip = b.instance_ip ,
	a.instance_port = b.instance_port ,
	a.platform = b.platform ,
	a.source_path = b.source_path ,
	a.unique_id = b.unique_id ,
	a.siebel_id = b.siebel_id ,
	a.delta_imsi = b.delta_imsi ,
	a.delta_sim_serial = b.delta_sim_serial ,
	a.msisdn_hierarchy = b.msisdn_hierarchy ,
	a.sim_swap_status = b.sim_swap_status ,
	a.activation_date = b.activation_date ,
	a.reg_date = b.reg_date ,
	a.other_status = b.other_status
from
	msisdn_provision_status b
where
	a.pk = b.pk
	and a.pk in (

	) ;


-- insert
--INSERT INTO public.msisdn_provision_status_new
--(pk, active, create_date, deleted, last_modified, imsi, msisdn, sim_serial, status, status_reason, instance_ip, instance_port, platform, 
--source_path, unique_id, siebel_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status, activation_date, reg_date, other_status)
select * 
from msisdn_provision_status a 
where a.pk>  
(select max(b.pk) 
from msisdn_provision_status_new b  
) 
;


--INSERT INTO public.msisdn_provision_status_log_new
--(pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason,
-- msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status)
select pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason,
 msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status 
from msisdn_provision_status_log a
where exists 
(select 1 
from msisdn_provision_status_new b 
where a.msisdn_provision_status_fk = b.pk )
and a.pk >
(select max(b.pk) 
from msisdn_provision_status_log_new b  
) 
;


--INSERT INTO public.msisdn_provision_status_log_new
--(pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason,
-- msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status)
select pk, active, create_date, deleted, last_modified, imsi, msisdn, operaion_channel, operation_name, sim_serial, status, status_reason,
 msisdn_provision_status_fk, platform, unique_id, delta_imsi, delta_sim_serial, msisdn_hierarchy, sim_swap_status 
from msisdn_provision_status_log a
where exists 
(select 1 
from msisdn_provision_status_new b 
where a.msisdn_provision_status_fk = b.pk )
and a.last_modified >
(select max(last_modified) 
from msisdn_provision_status_log_new b  
) 
;
