CREATE USER cwangai identified by 'CwTW$@ZMdg19237U';
--- create a new user in PostgreSQL:



--ALTER USER kwangai RENAME TO cwangai;
--ALTER USER cwangai WITH PASSWORD 'CwTW$@ZMdg19237U';

---CREATE USER 'Cwangai' WITH PASSWORD '?/TW$@ZMdg%9237U';


--- GRANT the CONNECT access:

GRANT CONNECT ON DATABASE biocapture TO Cwangai;
select * from pg_catalog.pg_roles;
---Then GRANT USAGE on schema:

GRANT USAGE ON SCHEMA public TO Cwangai;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO Cwangai;