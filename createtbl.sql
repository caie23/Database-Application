-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

CREATE TABLE mothers
(
    hcnum      CHAR(16) UNIQUE NOT NULL,
    mname      VARCHAR(30),
    email      VARCHAR(50),
    phone      VARCHAR(16),
    addr       VARCHAR(50),
    profession VARCHAR(20),
    dob        DATE,
    bloodtype  VARCHAR(3),
    PRIMARY KEY (hcnum)
);

CREATE TABLE fathers
(
    fid        INTEGER UNIQUE NOT NULL,
    fname      VARCHAR(30),
    phone      VARCHAR(16),
    profession VARCHAR(20),
    dob        DATE,
    bloodtype  VARCHAR(3),
    PRIMARY KEY (fid)
);

CREATE TABLE couples
(
    cid   INTEGER UNIQUE NOT NULL,
    hcnum CHAR(16)       NOT NULL,
    fid   INTEGER,
    PRIMARY KEY (cid),
    FOREIGN KEY (hcnum) REFERENCES mothers,
    FOREIGN KEY (fid) REFERENCES fathers
);


CREATE TABLE HcInstitute
(
    hcid    INTEGER UNIQUE NOT NULL,
    iname   VARCHAR(40),
    email   VARCHAR(50),
    phone   VARCHAR(16),
    addr    VARCHAR(50),
    website VARCHAR(100),
    PRIMARY KEY (hcid)
);

CREATE TABLE midwives
(
    practid INTEGER UNIQUE NOT NULL,
    hcid    INTEGER        NOT NULL,
    email   VARCHAR(50),
    wname   VARCHAR(30),
    phone   VARCHAR(16),
    PRIMARY KEY (practid),
    FOREIGN KEY (hcid) REFERENCES HcInstitute
);

CREATE TABLE commclinic
(
    hcid INTEGER UNIQUE NOT NULL,
    PRIMARY KEY (hcid),
    FOREIGN KEY (hcid) REFERENCES HcInstitute
);

CREATE TABLE birthcenter
(
    hcid INTEGER UNIQUE NOT NULL,
    PRIMARY KEY (hcid),
    FOREIGN KEY (hcid) REFERENCES HcInstitute
);

CREATE TABLE pregnancies
(
    pregnum       INTEGER NOT NULL,
    cid           INTEGER NOT NULL,
    ppractid      INTEGER, -- UNIQUE
    bpractid      INTEGER, -- UNIQUE
    hcid          INTEGER,
    numbabies     INTEGER,
    exptobym      DATE,
    aptduedate    DATE,
    usoundduedate DATE,
    finalduedate  DATE,
    homebirth     BOOLEAN,
    PRIMARY KEY (pregnum, cid),
    FOREIGN KEY (cid) REFERENCES couples,
    FOREIGN KEY (ppractid) REFERENCES midwives (practid),
    FOREIGN KEY (bpractid) REFERENCES midwives (practid),
    FOREIGN KEY (hcid) REFERENCES birthcenter
);

CREATE TABLE babies
(
    babyid    INTEGER UNIQUE NOT NULL,
    pregnum   INTEGER        NOT NULL,
    cid       INTEGER        NOT NULL,
    bname     VARCHAR(30),
    bloodtype VARCHAR(3),
    dob       DATE,
    birthtime TIME,
    gender    VARCHAR(6),
    PRIMARY KEY (babyid),
    FOREIGN KEY (pregnum, cid) REFERENCES pregnancies
);

CREATE TABLE infosessions
(
    sessionid INTEGER UNIQUE NOT NULL,
    practid   INTEGER, -- UNIQUE
    sdate     DATE,
    stime     TIME,
    langauge  varchar(20),
    PRIMARY KEY (sessionid),
    FOREIGN KEY (practid) REFERENCES midwives
);

CREATE TABLE InfoSessionRegistration
(
    cid       INTEGER NOT NULL,
    sessionid INTEGER NOT NULL,
    attended  BOOLEAN,
    PRIMARY KEY (cid, sessionid),
    FOREIGN KEY (cid) REFERENCES couples,
    FOREIGN KEY (sessionid) REFERENCES infosessions
);


CREATE TABLE technicians
(
    techid INTEGER UNIQUE NOT NULL,
    tname  VARCHAR(30),
    phone  VARCHAR(16),
    PRIMARY KEY (techid)
);

CREATE TABLE tests
(
    testid    INTEGER UNIQUE NOT NULL,
    ttype     VARCHAR(20),
    results   VARCHAR(200),
    techid    INTEGER, -- UNIQUE
    testdate  DATE,
    prescdate DATE,
    sampldate DATE,
    practid   INTEGER,
    pregnum   INTEGER,
    cid       INTEGER,
    babyid    INTEGER,
    PRIMARY KEY (testid),
    FOREIGN KEY (techid) REFERENCES technicians,
    FOREIGN KEY (practid) REFERENCES midwives,
    FOREIGN KEY (babyid) REFERENCES babies,
    FOREIGN KEY (pregnum, cid) REFERENCES pregnancies
);

CREATE TABLE appointments
(
    aptid   INTEGER UNIQUE NOT NULL,
    aptdate DATE,
    apttime TIME,
    pregnum INTEGER,
    cid     INTEGER,
    practid INTEGER,
    hcid    INTEGER,
    PRIMARY KEY (aptid),
    FOREIGN KEY (pregnum, cid) REFERENCES pregnancies,
    FOREIGN KEY (practid) REFERENCES midwives,
    FOREIGN KEY (hcid) REFERENCES birthcenter
);

CREATE TABLE notes
(
    aptid  INTEGER NOT NULL,
    tstamp TIME    NOT NULL,
    PRIMARY KEY (aptid, tstamp),
    FOREIGN KEY (aptid) REFERENCES appointments
);