-- DROP SCHEMA hospital_db;

CREATE SCHEMA hospital_db AUTHORIZATION postgres;
-- hospital_db.encounters definition

-- Drop table

-- DROP TABLE hospital_db.encounters;

CREATE TABLE hospital_db.encounters (
	id bpchar(36) NOT NULL,
	"start" timestamp NOT NULL,
	stop timestamp NOT NULL,
	patient bpchar(36) NOT NULL,
	organization bpchar(36) NOT NULL,
	payer bpchar(36) NOT NULL,
	encounterclass varchar(50) DEFAULT NULL::character varying NULL,
	code varchar(20) DEFAULT NULL::character varying NULL,
	description varchar(255) DEFAULT NULL::character varying NULL,
	base_encounter_cost numeric(10, 2) DEFAULT NULL::numeric NULL,
	total_claim_cost numeric(10, 2) DEFAULT NULL::numeric NULL,
	payer_coverage numeric(10, 2) DEFAULT NULL::numeric NULL,
	reasoncode varchar(20) DEFAULT NULL::character varying NULL,
	reasondescription varchar(255) DEFAULT NULL::character varying NULL,
	CONSTRAINT pk_encounters PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE hospital_db.encounters OWNER TO postgres;
GRANT ALL ON TABLE hospital_db.encounters TO postgres;


-- hospital_db.patients definition

-- Drop table

-- DROP TABLE hospital_db.patients;

CREATE TABLE hospital_db.patients (
	id bpchar(36) NOT NULL,
	birthdate date NULL,
	deathdate date NULL,
	prefix varchar(10) DEFAULT NULL::character varying NULL,
	"first" varchar(100) DEFAULT NULL::character varying NULL,
	"last" varchar(100) DEFAULT NULL::character varying NULL,
	suffix varchar(10) DEFAULT NULL::character varying NULL,
	maiden varchar(100) DEFAULT NULL::character varying NULL,
	marital bpchar(1) DEFAULT NULL::bpchar NULL,
	race varchar(50) DEFAULT NULL::character varying NULL,
	ethnicity varchar(50) DEFAULT NULL::character varying NULL,
	gender bpchar(1) DEFAULT NULL::bpchar NULL,
	birthplace varchar(255) DEFAULT NULL::character varying NULL,
	address varchar(255) DEFAULT NULL::character varying NULL,
	city varchar(100) DEFAULT NULL::character varying NULL,
	state varchar(100) DEFAULT NULL::character varying NULL,
	county varchar(100) DEFAULT NULL::character varying NULL,
	zip varchar(10) DEFAULT NULL::character varying NULL,
	lat float8 NULL,
	lon float8 NULL,
	CONSTRAINT pk_patients PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE hospital_db.patients OWNER TO postgres;
GRANT ALL ON TABLE hospital_db.patients TO postgres;


-- hospital_db.payers definition

-- Drop table

-- DROP TABLE hospital_db.payers;

CREATE TABLE hospital_db.payers (
	id bpchar(36) NOT NULL,
	"name" varchar(100) DEFAULT NULL::character varying NULL,
	address varchar(255) DEFAULT NULL::character varying NULL,
	city varchar(100) DEFAULT NULL::character varying NULL,
	state_headquartered bpchar(2) DEFAULT NULL::bpchar NULL,
	zip varchar(10) DEFAULT NULL::character varying NULL,
	phone varchar(20) DEFAULT NULL::character varying NULL,
	CONSTRAINT pk_payers PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE hospital_db.payers OWNER TO postgres;
GRANT ALL ON TABLE hospital_db.payers TO postgres;


-- hospital_db."procedures" definition

-- Drop table

-- DROP TABLE hospital_db."procedures";

CREATE TABLE hospital_db."procedures" (
	"start" timestamp NULL,
	stop timestamp NULL,
	patient bpchar(36) DEFAULT NULL::bpchar NULL,
	encounter bpchar(36) DEFAULT NULL::bpchar NULL,
	code varchar(20) DEFAULT NULL::character varying NULL,
	description varchar(255) DEFAULT NULL::character varying NULL,
	base_cost int4 NULL,
	reasoncode varchar(20) DEFAULT NULL::character varying NULL,
	reasondescription varchar(255) DEFAULT NULL::character varying NULL
);

-- Permissions

ALTER TABLE hospital_db."procedures" OWNER TO postgres;
GRANT ALL ON TABLE hospital_db."procedures" TO postgres;




-- Permissions

GRANT ALL ON SCHEMA hospital_db TO postgres;