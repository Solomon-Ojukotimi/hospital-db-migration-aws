-- =============================================================================
-- Database Initialization & Setup
-- Engine Target: MySQL / MariaDB
-- Description: Core Schema setup for hospital management and tracking system.
-- =============================================================================

DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;

-- -----------------------------------------------------------------------------
-- 1. PAYERS
-- Contains details on health insurance entities and payment organizations.
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS payers (
    Id CHAR(36) PRIMARY KEY,
    NAME VARCHAR(100),
    ADDRESS VARCHAR(255),
    CITY VARCHAR(100),
    STATE_HEADQUARTERED CHAR(2),
    ZIP VARCHAR(10),
    PHONE VARCHAR(20)
);

-- -----------------------------------------------------------------------------
-- 2. PATIENTS
-- Tracks demographics and primary location data for registered patients.
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS patients (
    Id CHAR(36) PRIMARY KEY,
    BIRTHDATE DATE,
    DEATHDATE DATE,
    PREFIX VARCHAR(10),
    FIRST VARCHAR(100),
    LAST VARCHAR(100),
    SUFFIX VARCHAR(10),
    MAIDEN VARCHAR(100),
    MARITAL CHAR(1),
    RACE VARCHAR(50),
    ETHNICITY VARCHAR(50),
    GENDER CHAR(1),
    BIRTHPLACE VARCHAR(255),
    ADDRESS VARCHAR(255),
    CITY VARCHAR(100),
    STATE VARCHAR(100),
    COUNTY VARCHAR(100),
    ZIP VARCHAR(10),
    LAT DOUBLE,
    LON DOUBLE
);

-- -----------------------------------------------------------------------------
-- 3. ENCOUNTERS
-- Records medical visits, operational details, costs, and primary insurance coverage.
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS encounters (
    Id CHAR(36) PRIMARY KEY,
    START DATETIME NOT NULL,
    STOP DATETIME NOT NULL,
    PATIENT CHAR(36) NOT NULL,
    ORGANIZATION CHAR(36) NOT NULL,
    PAYER CHAR(36) NOT NULL,
    ENCOUNTERCLASS VARCHAR(50),
    CODE VARCHAR(20),
    DESCRIPTION VARCHAR(255),
    BASE_ENCOUNTER_COST DECIMAL(10,2),
    TOTAL_CLAIM_COST DECIMAL(10,2),
    PAYER_COVERAGE DECIMAL(10,2),
    REASONCODE VARCHAR(20),
    REASONDESCRIPTION VARCHAR(255),
    FOREIGN KEY (PATIENT) REFERENCES patients(Id),
    FOREIGN KEY (PAYER) REFERENCES payers(Id)
);

-- -----------------------------------------------------------------------------
-- 4. PROCEDURES
-- Stores individual procedures administered during specific patient encounters.
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS procedures (
    START TIMESTAMP NULL DEFAULT NULL,
    STOP TIMESTAMP NULL DEFAULT NULL,
    PATIENT CHAR(36) NOT NULL,
    ENCOUNTER CHAR(36) NOT NULL,
    CODE VARCHAR(20),
    DESCRIPTION VARCHAR(255),
    BASE_COST DECIMAL(10,2),
    REASONCODE VARCHAR(20),
    REASONDESCRIPTION VARCHAR(255),
    FOREIGN KEY (PATIENT) REFERENCES patients(Id),
    FOREIGN KEY (ENCOUNTER) REFERENCES encounters(Id)
);