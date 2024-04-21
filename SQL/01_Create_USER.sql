
DO $$
BEGIN

IF not Exists(select * from pg_roles where rolname='lOtus') then
	CREATE ROLE "lOtus" WITH
	  LOGIN
	  SUPERUSER
	  INHERIT
	  CREATEDB
	  CREATEROLE
	  REPLICATION
	  BYPASSRLS
	  ENCRYPTED PASSWORD 'md5c39f54e821548c282e588b47cfae0c61'; -- lOtus
END IF; 	

END
$$