
CREATE DATABASE "dbOtus2"
    WITH
    OWNER = "lOtus"
    ENCODING = 'UTF8'
 --   LC_COLLATE = 'Russian_Russia.1251'  --можно не указывать подхватить с сервера
 --   LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;