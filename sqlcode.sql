CREATE DATABASE FR_Portfolio;
CREATE TABLE SUser
(
    FName           VARCHAR(20) NOT NULL,
    LName           VARCHAR(20) NOT NULL,
    ID              VARCHAR(9) NOT NULL,
    Email           VARCHAR(30) NOT NULL,
    Pswrd           VARCHAR(20) NOT NULL,
    ExperienceYears INT,
    Expertise       VARCHAR(20),
    Bio             VARCHAR(500),
    Department      VARCHAR(50),
    Educatoin       VARCHAR(50),
    OfficeLocation  VARCHAR(20),
    PhoneNo         VARCHAR(15),
    Photo           VARBINARY(21844),
    Website         VARCHAR(50),
    Membership      VARCHAR(30),
    regReason       VARCHAR(500),
    Flag            VARCHAR(1)      NOT NULL, -- 0 for Admin, 1 for Faculty, 2 for Pending
    dateRegistered  DATE,
 
    PRIMARY KEY (ID),
    UNIQUE (FName)
);
 
 
 
CREATE TABLE Report
(
    Title           VARCHAR(100),
    Content         VARCHAR(2000),
    Author          VARCHAR(40),
    Date            DATE
);
 
CREATE TABLE Notification
(
    Title           VARCHAR(100),
    Content         VARCHAR(1000),
    Date            DATE
);
 
 
 
CREATE TABLE Publication
(
    PublicationID   VARCHAR(9) NOT NULL,
    PublicationType VARCHAR(20) NOT NULL,
    Title           VARCHAR(500) NOT NULL,
    Abstract        VARCHAR(2000) NOT NULL,
    Author          VARCHAR(300) NOT NULL,
    Department		VARCHAR(50),
    Keywords        VARCHAR(2000),
    Month           INTEGER,
    Year            INTEGER NOT NULL,
    Note            VARCHAR(2000),
    DateAddedToDB   DATE NOT NULL,
    Address         VARCHAR(2000),
    Degree          VARCHAR(200),
    School          VARCHAR(100),
    Source          VARCHAR(3000),
    Type            VARCHAR(300),
    Institution     VARCHAR(100),
    Number          INTEGER,
    BookTitle       VARCHAR(500),
    Editor          VARCHAR(300),
    Organization    VARCHAR(100),
    Pages           INTEGER,
    Publisher       VARCHAR(100),
    Series          VARCHAR(100),
    Volume          VARCHAR(10),
    DOI             VARCHAR(10),
    Journal         VARCHAR(100),
    Edition         VARCHAR(15),
    ISBN            VARCHAR(16),
    Price           DECIMAL(6,2),
    Chapter         VARCHAR(10),
    HowPublished    VARCHAR(1000),
     
    PRIMARY KEY (PublicationID)
);
 
CREATE TABLE PublicationFacultyLink
(
    FacultyID       VARCHAR(9) NOT NULL,
    PublicationID   VARCHAR(9) NOT NULL,
     
    FOREIGN KEY (FacultyID) REFERENCES SUser(ID) ON DELETE CASCADE,
    FOREIGN KEY (PublicationID) REFERENCES Publication(PublicationID) ON DELETE CASCADE
);

INSERT INTO `suser`(`FName`, `LName`, `ID`, `Email`, `Pswrd`, `Flag`) VALUES ("Mohammed","Ahmed","201312345","mm@kfupm.edu.sa","m12345678","0");
INSERT INTO `suser`(`FName`, `LName`, `ID`, `Email`, `Pswrd`, `Flag`) VALUES ("Ahmed","Jamal","201412345","aj@kfupm.edu.sa","a12345678","1");
INSERT INTO `suser`(`FName`, `LName`, `ID`, `Email`, `Pswrd`, `Flag`) VALUES ("Husni","Hamad","201512345","hh@kfupm.edu.sa","h12345678","2");
INSERT INTO `suser`(`FName`, `LName`, `ID`, `Email`, `Pswrd`, `Flag`) VALUES ("Rayan","Talal","201354321","rt@kfupm.edu.sa","rt12312345","1");
INSERT INTO `suser`(`FName`, `LName`, `ID`, `Email`, `Pswrd`, `Flag`) VALUES ("Abdulla","Hussain","201454321","ah@kfupm.edu.sa","ah12312345","2");

INSERT INTO `publication`(`PublicationID`, `PublicationType`, `Title`, `Abstract`, `Author`, `Year`, `DateAddedToDB`) VALUES ("111","Thesis","The Rise of CyberWarefare since 2006","This thesis discusses the reasons which made cyberwarfare better than traditional meduims","Ahmed Jamal","2013","2015-03-17");
INSERT INTO `publication`(`PublicationID`, `PublicationType`, `Title`, `Abstract`, `Author`, `Year`, `DateAddedToDB`) VALUES ("131","Book","Testing Methodology","This book discuss the methodolgy and techniques done in software testing","Ahmed Jamal","2011","2014-01-07");
INSERT INTO `publication`(`PublicationID`, `PublicationType`, `Title`, `Abstract`, `Author`, `Year`, `DateAddedToDB`) VALUES ("201","Book","Artifitial Intelligence","This book shows the techniques used in AI","Rayan Talal","2015","2016-11-07");

INSERT INTO `publicationfacultylink`(`FacultyID`, `PublicationID`) VALUES ("201412345","111");
INSERT INTO `publicationfacultylink`(`FacultyID`, `PublicationID`) VALUES ("201412345","131");
INSERT INTO `publicationfacultylink`(`FacultyID`, `PublicationID`) VALUES ("201354321","201");
