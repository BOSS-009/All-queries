CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,   -- Unique ID for each user
    username VARCHAR(100) UNIQUE NOT NULL,   -- Username, which must be unique
    password VARCHAR(255) NOT NULL,  -- Store password (hashed) here
    role VARCHAR(50) NOT NULL CHECK (role IN ('HOD', 'Faculty'))  -- Role (HOD or Faculty)
);



CREATE TABLE IF NOT EXISTS master_event
(
    master_id SERIAL PRIMARY KEY, 
    event_name VARCHAR(255) NOT NULL,  
    event_type VARCHAR(100) NOT NULL,  
    approval BOOLEAN DEFAULT NULL,
    user_id INT NOT NULL,  -- Foreign key column to reference user_id from users table
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);




-- Create table Conference
CREATE TABLE conference (
    conference_id SERIAL PRIMARY KEY, 
    paperTitle VARCHAR(255) NOT NULL,
    abstract TEXT,
    conferenceName VARCHAR(255),
    publicationLevel VARCHAR(100),
    publicationDate DATE,
    publisher VARCHAR(255),
    doiIsbn VARCHAR(100),
    document BYTEA DEFAULT NULL,
    documentName VARCHAR(100),
    proofLink VARCHAR(255),
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT conference_master_id_fk FOREIGN KEY (master_id) 
        REFERENCES master_event (master_id) ON DELETE CASCADE
);


-- Create table bookchapter
CREATE TABLE bookchapter (
    bookchapter_id SERIAL PRIMARY KEY,
    authors TEXT NOT NULL,
    paperTitle VARCHAR(255) NOT NULL,
    abstract TEXT,
    journalName VARCHAR(255),
    publicationLevel VARCHAR(100),
    publicationDate DATE,
    publisher VARCHAR(255),
    doi VARCHAR(100),
    document BYTEA DEFAULT NULL,
    documentName VARCHAR(100),
    proofLink VARCHAR(255),
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT bookchapter_master_id_fk FOREIGN KEY (master_id) 
        REFERENCES master_event (master_id) ON DELETE CASCADE
);


-- Create table fdp
CREATE TABLE fdp (
    fdp_id SERIAL PRIMARY KEY,
    fdpTitle VARCHAR(255) NOT NULL,
    mode VARCHAR(50),
    brochure BYTEA DEFAULT NULL,
    brochureName VARCHAR(255),
    dates VARCHAR(50),
    days VARCHAR(50),
    gpsMedia BYTEA DEFAULT NULL,
    gpsMediaName VARCHAR(255),
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255),
    organizers TEXT,
    conveners TEXT,
    feedback BYTEA DEFAULT NULL,
    feedbackName VARCHAR(255),
    participantsList BYTEA DEFAULT NULL,
    participantsListName VARCHAR(255),
    certificates BYTEA DEFAULT NULL,
    certificatesName VARCHAR(255),
    sanctionedAmount VARCHAR(100),
    facultyReceivingAmount VARCHAR(100),
    expenditureReport BYTEA DEFAULT NULL,
    expenditureReportName VARCHAR(255),
    speakersDetails TEXT,
    sponsorship TEXT,
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fdp_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);


-- Create table journals
CREATE TABLE journals (
    journal_id SERIAL PRIMARY KEY,
    authors TEXT NOT NULL,
    paperTitle VARCHAR(255) NOT NULL,
    abstract TEXT,
    journalName VARCHAR(255),
    publicationLevel VARCHAR(100),
    publicationDate DATE,
    publisher VARCHAR(255),
    doiIsbn VARCHAR(100),
    document BYTEA DEFAULT NULL,
    documentName VARCHAR(255),
    proofLink VARCHAR(255),
    impactFactor VARCHAR(100),
    quartile VARCHAR(50),
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT journals_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);

-- Create table patents
CREATE TABLE patents (
    patent_id SERIAL PRIMARY KEY,
    applicationNumber VARCHAR(100) NOT NULL,
    patentNumber VARCHAR(100),
    title VARCHAR(255) NOT NULL,
    inventors TEXT NOT NULL,
    patenteeName VARCHAR(255) DEFAULT 'Dayananda Sagar University',
    filingDate DATE,
    status VARCHAR(100),
    patentCountry VARCHAR(100),
    publicationDate DATE,
    abstract TEXT,
    url VARCHAR(255),
    document BYTEA DEFAULT NULL,
    documentName VARCHAR(255),
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT patents_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);

-- Create table seminar
CREATE TABLE seminar (
    seminar_id SERIAL PRIMARY KEY,
    seminarTitle VARCHAR(255) NOT NULL,
    mode VARCHAR(50),
    brochure BYTEA DEFAULT NULL,
    brochureName VARCHAR(255),
    dates VARCHAR(50),
    days VARCHAR(50),
    gpsMedia BYTEA DEFAULT NULL,
    gpsMediaName VARCHAR(255),
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255),
    organizers TEXT,
    conveners TEXT,
    feedback BYTEA DEFAULT NULL,
    feedbackName VARCHAR(255),
    participantsList BYTEA DEFAULT NULL,
    participantsListName VARCHAR(255),
    certificates BYTEA DEFAULT NULL,
    certificatesName VARCHAR(255),
    sanctionedAmount VARCHAR(100),
    facultyReceivingAmount VARCHAR(100),
    expenditureReport BYTEA DEFAULT NULL,
    expenditureReportName VARCHAR(255),
    speakersDetails TEXT,
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT seminar_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);

-- Create table workshop
CREATE TABLE workshop (
    workshop_id SERIAL PRIMARY KEY,
    workshopTitle VARCHAR(255) NOT NULL,
    mode VARCHAR(50),
    brochure BYTEA DEFAULT NULL,
    brochureName VARCHAR(255),
    dates VARCHAR(50),
    days VARCHAR(50),
    gpsMedia BYTEA DEFAULT NULL,
    gpsMediaName VARCHAR(255),
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255),
    organizers TEXT,
    conveners TEXT,
    feedback BYTEA DEFAULT NULL,
    feedbackName VARCHAR(255),
    participantsList BYTEA DEFAULT NULL,
    participantsListName VARCHAR(255),
    certificates BYTEA DEFAULT NULL,
    certificatesName VARCHAR(255),
    sanctionedAmount VARCHAR(100),
    facultyReceivingAmount VARCHAR(100),
    expenditureReport BYTEA DEFAULT NULL,
    expenditureReportName VARCHAR(255),
    speakersDetails TEXT,
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT workshop_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);

-- Create table clubactivity
CREATE TABLE clubactivity (
    clubActivity_id SERIAL PRIMARY KEY,
    clubName VARCHAR(255),
    activityType VARCHAR(100),
    title VARCHAR(255),
    activityDate DATE,
    numDays VARCHAR(100),  
    gpsMedia BYTEA DEFAULT NULL,
    gpsMediaName VARCHAR(255),  
    budget VARCHAR(100),  
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255), 
    organizers TEXT,
    conveners TEXT,
    feedback BYTEA DEFAULT NULL,
    feedbackName VARCHAR(255),  
    participantsList BYTEA DEFAULT NULL,
    participantsListName VARCHAR(255),  
    certificates BYTEA DEFAULT NULL,
    certificatesName VARCHAR(255),  
    speakersDetails TEXT,
    identifier VARCHAR(100), 
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT clubactivity_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);

-- Create table faculty_achievements
CREATE TABLE faculty_achievements (
    achievement_id SERIAL PRIMARY KEY,
    facultyName VARCHAR(255),
    designation VARCHAR(100),
    achievementDate DATE,
    recognition VARCHAR(255),
    eventName VARCHAR(255),
    awardName VARCHAR(255),
    awardingOrganization VARCHAR(255),
    gpsPhoto BYTEA DEFAULT NULL,
    gpsPhotoName VARCHAR(255),
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255),
    proof BYTEA DEFAULT NULL,
    proofName VARCHAR(255),
    certificateProof BYTEA DEFAULT NULL,
    certificateProofName VARCHAR(255),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT faculty_achievements_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);


-- Create table industrial_visit
CREATE TABLE industrial_visit (
    visit_id SERIAL PRIMARY KEY,
    companyName VARCHAR(255),
    industryType VARCHAR(100),
    visitTitle VARCHAR(255),
    visitDate DATE,
    numDays VARCHAR(100),
    gpsMedia BYTEA DEFAULT NULL,
    gpsMediaName VARCHAR(255),
    budget VARCHAR(100),
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255),
    organizers TEXT,
    conveners TEXT,
    feedback BYTEA DEFAULT NULL,
    feedbackName VARCHAR(255),
    participantsList BYTEA DEFAULT NULL,
    participantsListName VARCHAR(255),
    certificates BYTEA DEFAULT NULL,
    certificatesName VARCHAR(255),
    speakersDetails TEXT,
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT industrial_visit_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);


-- Create table professional_societies
CREATE TABLE professional_societies (
    society_id SERIAL PRIMARY KEY,
    societyName VARCHAR(255),
    eventType VARCHAR(100),
    activityType VARCHAR(100),
    activityDate DATE,
    numberOfDays VARCHAR(100),
    gpsPhotosVideos BYTEA DEFAULT NULL,
    gpsPhotosVideosName VARCHAR(255),
    budgetSanctioned VARCHAR(100),
    eventReport BYTEA DEFAULT NULL,
    eventReportName VARCHAR(255),
    organizers TEXT,
    conveners TEXT,
    feedback BYTEA DEFAULT NULL,
    feedbackName VARCHAR(255),
    participantsList BYTEA DEFAULT NULL,
    participantsListName VARCHAR(255),
    certificates BYTEA DEFAULT NULL,
    certificatesName VARCHAR(255),
    speakerDetails TEXT,
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT professional_societies_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);


-- Create table student_achievements
CREATE TABLE student_achievements (
    achievement_id SERIAL PRIMARY KEY,
    studentNames TEXT,
    usns TEXT,
    yearOfStudy VARCHAR(50),
    eventType VARCHAR(100),
    eventTitle VARCHAR(255),
    achievementDate DATE,
    companyOrganization VARCHAR(255),
    recognition VARCHAR(255),
    certificateProof BYTEA DEFAULT NULL,
    certificateProofName VARCHAR(255),
    gpsPhoto BYTEA DEFAULT NULL,
    gpsPhotoName VARCHAR(255),
    report BYTEA DEFAULT NULL,
    reportName VARCHAR(255),
    identifier VARCHAR(100),
    master_id INTEGER,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT student_achievements_master_id_fk FOREIGN KEY (master_id) REFERENCES master_event (master_id) ON DELETE CASCADE
);






--First run these queries to drop all the tables
DROP TABLE IF EXISTS conference;
DROP TABLE IF EXISTS bookchapter;
DROP TABLE IF EXISTS fdp;
DROP TABLE IF EXISTS journals;
DROP TABLE IF EXISTS patents;
DROP TABLE IF EXISTS seminar;
DROP TABLE IF EXISTS workshop;
DROP TABLE IF EXISTS clubactivity;
DROP TABLE IF EXISTS faculty_achievements;
DROP TABLE IF EXISTS industrial_visit;
DROP TABLE IF EXISTS professional_societies;
DROP TABLE IF EXISTS student_achievements;
drop table if exists users;
drop table if exists master_event;

