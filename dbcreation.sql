/* Start of uers and Role Creation Creation  */
/* Log in to Default Db[postgres] with Default user [postgres]*/

CREATE ROLE app_admin WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  CONNECTION LIMIT 10
  PASSWORD 'app_admin';

COMMENT ON ROLE app_admin IS 'app_admin will be having the privilege of creation/insertion/update and deletion  of tables/sequence';


CREATE ROLE app_user WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  CONNECTION LIMIT 90
  PASSWORD 'app_user';

COMMENT ON ROLE app_user IS 'This is user has only select/insert/update  privilage';

CREATE ROLE select_role WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

CREATE ROLE update_role WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;  

GRANT select_role, update_role TO app_user;

/* End of uers and Role Creation Creation  */
/* Create Database with app_admin user and name app_data*/

/* createdb.exe -O app_admin  app_data */



CREATE SCHEMA app_schema AUTHORIZATION app_admin;

COMMENT ON SCHEMA appdata
    IS 'This Schema will contain all the tables and other DB objects which are accessible from API endPoint. ';

GRANT USAGE ON SCHEMA app_schema TO select_role;

GRANT USAGE ON SCHEMA app_schema TO update_role;

CREATE TABLE app_schema."userInfo" (
    email character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    creation_date date DEFAULT CURRENT_DATE,
    update_date date NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT userInfo_pk PRIMARY KEY (email)
)

INSERT INTO app_schema."userInfo"(password, email, creation_date, update_date)VALUES ('password', 'r.das699@gmail.com', '2020-08-25', '2020-08-25');
INSERT INTO app_schema."userInfo"(password, email, creation_date, update_date)VALUES ('password', 'debmallya.6@gmail.com', '2020-08-25', '2020-08-25');
INSERT INTO app_schema."userInfo"(password, email, creation_date, update_date)VALUES ('password', 'chironmoy@gmail.com', '2020-08-25', '2020-08-25');

INSERT INTO app_schema."userInfo"(password, email, creation_date, update_date)VALUES ('password', 'mithay@gmail.com', '2020-08-25', '2020-08-25');


grant select on app_schema."userInfo" to select_role;

grant update, insert   ON TABLE app_schema."userInfo" TO update_role;

grant update_role to app_user;  /* From Super User */
grant select_role to app_user;  /* From Super User */

