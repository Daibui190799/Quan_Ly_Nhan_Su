CREATE DATABASE DATN_QLNS;
USE DATN_QLNS;
CREATE TABLE ACCOUNTS(
	Username VARCHAR(30) PRIMARY KEY NOT NULL,
    Password VARCHAR(24) NOT NULL,
    EmployeeId varchar(10) NOT NULL
);

CREATE TABLE AUTHORITIES(
	Id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    RoleId varchar(10) NOT NULL,
    Username VARCHAR(30) NOT NULL
);

CREATE TABLE ROLES(
	RoleId varchar(10) PRIMARY KEY NOT NULL,
    Name nvarchar(20) NOT NULL
);

CREATE TABLE CERTIFICATES(
	CertificateId varchar(30) PRIMARY KEY NOT NULL,
    Name nvarchar(24) NOT NULL,
    DateApprove date NOT NULL,
    EmployeeId varchar(10) NOT NULL
);

CREATE TABLE EDUCATION_PROGRAM_DETAILS(
	Id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    EmployeeId varchar(10) NOT NULL,
    EducationProgramId varchar(30) NOT NULL
);

CREATE TABLE EDUCATION_PROGRAMS(
	EducationProgramId varchar(30) PRIMARY KEY NOT NULL,
    DateStart date NOT NULL,
    DateEnd date NOT NULL,
    Quantity int NOT NULL,
    Name nvarchar(40) NOT NULL,
    OfficeId varchar(20) NOT NULL
);

CREATE TABLE EMPLOYEES(
	EmployeeId varchar(10) PRIMARY KEY NOT NULL,
    Position nvarchar(100) NOT NULL,
    Fullname nvarchar(50) NOT NULL,
    OfficeId varchar(20) NOT NULL,
    DOB date NOT NULL,
    Address nvarchar(70) NOT NULL,
    Nationality nvarchar(50) NOT NULL,
    DateEndJob date NULL,
    DateStartJob date NOT NULL,
    Gender bit NOT NULL,
    Phone varchar(50) NOT NULL,
    BankName varchar(100) NOT NULL,
    BankNum varchar(20) NOT NULL,
    Image nvarchar(100) NOT NULL,
    Note nvarchar(100) NULL
);

CREATE TABLE RECRUIMENTS(
	RecruitmentId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    DateStart date NOT NULL,
    DateEnd date NOT NULL,
    Quantity int NOT NULL,
    Description nvarchar(1000) NULL,
    OfficeId varchar(20) NOT NULL
);

CREATE TABLE OFFICES(
	OfficeId varchar(20) PRIMARY KEY NOT NULL,
    Quantity int NOT NULL,
    Description nvarchar(100) NULL,
    Name nvarchar(100) NOT NULL
);

CREATE TABLE CONTRACTS(
	ContractId varchar(30) PRIMARY KEY NOT NULL,
    Status varchar(24) NOT NULL,
    Description nvarchar(100) NULL,
    File nvarchar(100) NOT NULL,
    DateStartContract date NOT NULL,
    DateEndContract date NOT NULL,
    Type nvarchar(100) NOT NULL,
    SalaryId int NOT NULL,
    EmployeeId varchar(10) NOT NULL
);

CREATE TABLE SALARIES(
	SalaryId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    BasicSalary float NOT NULL,
    OfficialSalary float NOT NULL,
    PaymentTime date NOT NULL,
    SocialInsurance nvarchar(200) NOT NULL,
    PaymentType nvarchar(100) NOT NULL
); 

CREATE TABLE LEAVES(
	LeaveId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Type nvarchar(100) NOT NULL,
    Available bit NOT NULL,
    Reason nvarchar(1000) NULL,
    Date date NOT NULL,
    Approve bit NOT NULL,
    EmployeeId varchar(10) NOT NULL
);

CREATE TABLE LEAVES_DETAIL(
	LeaveDetailId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    LeaveId int NOT NULL,
    EmployeeId varchar(10) NOT NULL
);

CREATE TABLE NOTIFICATIONS(
	NotificationId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Title nvarchar(100) NOT NULL,
    Type nvarchar(100) NOT NULL,
    Description nvarchar(1000) NULL
);

-- DATA
-- ACCOUNTS
INSERT INTO ACCOUNTS (Username, Password, EmployeeId) VALUES
    ('user1', '123', 'EMP001'),
    ('user2', '123', 'EMP002'),
    ('user3', '123', 'EMP003');

-- AUTHORITIES
INSERT INTO AUTHORITIES (RoleId, Username) VALUES
    ('TP', 'user1'),
    ('NV', 'user1'),
    ('NV', 'user2'),
    ('NV', 'user3');

-- ROLES
INSERT INTO ROLES (RoleId, Name) VALUES
    ('TP', 'Trưởng Phòng'),
    ('NV', 'Nhân Viên');

-- CERTIFICATES
INSERT INTO CERTIFICATES (CertificateId, Name, DateApprove, EmployeeId) VALUES
    ('CERT001', 'Certificate 1', '2023-01-01', 'EMP001'),
    ('CERT002', 'Certificate 2', '2023-02-01', 'EMP002'),
    ('CERT003', 'Certificate 3', '2023-03-01', 'EMP003');

-- EDUCATION_PROGRAM_DETAILS
INSERT INTO EDUCATION_PROGRAM_DETAILS (EmployeeId, EducationProgramId) VALUES
    ('EMP001', 'EDU001'),
    ('EMP002', 'EDU002'),
    ('EMP003', 'EDU003');

-- EDUCATION_PROGRAMS
INSERT INTO EDUCATION_PROGRAMS (EducationProgramId, DateStart, DateEnd, Quantity, Name, OfficeId) VALUES
    ('EDU001', '2023-01-01', '2023-02-01', 10, 'Program 1', 'OFF001'),
    ('EDU002', '2023-02-01', '2023-03-01', 15, 'Program 2', 'OFF002'),
    ('EDU003', '2023-03-01', '2023-04-01', 20, 'Program 3', 'OFF003');

-- EMPLOYEES
INSERT INTO EMPLOYEES (EmployeeId, Position, Fullname, OfficeId, DOB, Address, Nationality, DateEndJob, DateStartJob, Gender, Phone, BankName, BankNum, Image) VALUES
    ('EMP001', 'Position 1', 'Employee 1', 'OFF001', '1990-01-01', 'Address 1', 'Nationality 1', NULL, '2022-01-01', 1, '1234567890', 'VIETINBANK', '1234567890', 'default.png'),
    ('EMP002', 'Position 2', 'Employee 2', 'OFF002', '1990-02-01', 'Address 2', 'Nationality 2', NULL, '2022-02-01', 0, '1234567891', 'VIETINBANK', '1234567890', 'default.png'),
    ('EMP003', 'Position 3', 'Employee 3', 'OFF003', '1990-03-01', 'Address 3', 'Nationality 3', NULL, '2022-03-01', 1, '1234567892', 'VIETINBANK', '1234567890', 'default.png');

-- RECRUIMENTS
INSERT INTO RECRUIMENTS (DateStart, DateEnd, Quantity, Description, OfficeId) VALUES
    ('2023-01-01', '2023-02-01', 5, 'Recruitment 1', 'OFF001'),
    ('2023-02-01', '2023-03-01', 8, 'Recruitment 2', 'OFF002'),
    ('2023-03-01', '2023-04-01', 10, 'Recruitment 3', 'OFF003');

-- OFFICES
INSERT INTO OFFICES (OfficeId, Quantity, Description, Name) VALUES
    ('OFF001', 10, 'Office 1', 'Office Name 1'),
    ('OFF002', 15, 'Office 2', 'Office Name 2'),
    ('OFF003', 20, 'Office 3', 'Office Name 3');

-- CONTRACTS
INSERT INTO CONTRACTS (ContractId, Status, Description, File, DateStartContract, DateEndContract, Type, SalaryId, EmployeeId) VALUES
    ('CONTRACT001', 'Active', 'Contract 1', 'file1.pdf', '2023-01-01', '2023-12-31', 'Type 1', 1, 'EMP001'),
    ('CONTRACT002', 'Active', 'Contract 2', 'file2.pdf', '2023-02-01', '2023-12-31', 'Type 2', 2, 'EMP002'),
    ('CONTRACT003', 'Active', 'Contract 3', 'file3.pdf', '2023-03-01', '2023-12-31', 'Type 3', 3, 'EMP003');

-- SALARIES
INSERT INTO SALARIES (BasicSalary, OfficialSalary, PaymentTime, SocialInsurance, PaymentType) VALUES
    (1000.00, 900.00, '2023-01-01', 'Social Insurance 1', 'Payment Type 1'),
    (2000.00, 1800.00, '2023-02-01', 'Social Insurance 2', 'Payment Type 2'),
    (3000.00, 2700.00, '2023-03-01', 'Social Insurance 3', 'Payment Type 3');

-- LEAVES
INSERT INTO LEAVES (Type, Available, Reason, Date, Approve, EmployeeId) VALUES
    ('Leave 1', 1, 'Reason 1', '2023-01-01', 1, 'EMP001'),
    ('Leave 2', 1, 'Reason 2', '2023-02-01', 1, 'EMP002'),
    ('Leave 3', 1, 'Reason 3', '2023-03-01', 1, 'EMP003');

-- LEAVES_DETAIL
INSERT INTO LEAVES_DETAIL (LeaveId, EmployeeId) VALUES
    (1, 'EMP001'),
    (2, 'EMP002'),
    (3, 'EMP003');

-- NOTIFICATIONS
INSERT INTO NOTIFICATIONS (Title, Type, Description) VALUES
    ('Notification 1', 'Type 1', 'Description 1'),
    ('Notification 2', 'Type 2', 'Description 2'),
    ('Notification 3', 'Type 3', 'Description 3');
    
    
-- KEY
-- EMPLOYEES
ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_EMPLOYEES_OFFICES
FOREIGN KEY (OfficeId) REFERENCES OFFICES(OfficeId);

-- AUTHORITIES
ALTER TABLE AUTHORITIES
ADD CONSTRAINT FK_AUTHORITIES_ROLES
FOREIGN KEY (RoleId) REFERENCES ROLES(RoleId);

ALTER TABLE AUTHORITIES
ADD CONSTRAINT FK_AUTHORITIES_ACCOUNTS
FOREIGN KEY (Username) REFERENCES ACCOUNTS(Username);

-- ACCOUNTS
ALTER TABLE ACCOUNTS
ADD CONSTRAINT FK_ACCOUNTS_EMPLOYEES
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEES(EmployeeId);

-- CERTIFICATES
ALTER TABLE CERTIFICATES
ADD CONSTRAINT FK_CERTIFICATES_EMPLOYEES
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEES(EmployeeId);

-- EDUCATION_PROGRAMS
ALTER TABLE EDUCATION_PROGRAMS
ADD CONSTRAINT FK_EDUCATION_PROGRAMS_OFFICES
FOREIGN KEY (OfficeId) REFERENCES OFFICES(OfficeId);

-- EDUCATION_PROGRAM_DETAILS
ALTER TABLE EDUCATION_PROGRAM_DETAILS
ADD CONSTRAINT FK_EDUCATION_PROGRAM_DETAILS_EMPLOYEES
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEES(EmployeeId);

ALTER TABLE EDUCATION_PROGRAM_DETAILS
ADD CONSTRAINT FK_EDUCATION_PROGRAM_DETAILS_EDUCATION_PROGRAMS
FOREIGN KEY (EducationProgramId) REFERENCES EDUCATION_PROGRAMS(EducationProgramId);

-- RECUITMENTS
ALTER TABLE RECRUIMENTS
ADD CONSTRAINT FK_RECRUIMENTS_OFFICES
FOREIGN KEY (OfficeId) REFERENCES OFFICES(OfficeId);

-- CONTRACTS
ALTER TABLE CONTRACTS
ADD CONSTRAINT FK_CONTRACTS_EMPLOYEES
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEES(EmployeeId);

ALTER TABLE CONTRACTS
ADD CONSTRAINT FK_CONTRACTS_SALARIES
FOREIGN KEY (SalaryId) REFERENCES SALARIES(SalaryId);

-- LEAVES
ALTER TABLE LEAVES
ADD CONSTRAINT FK_LEAVES_EMPLOYEES
FOREIGN KEY (EmployeeId) REFERENCES EMPLOYEES(EmployeeId);

-- LEAVES DETAIL
ALTER TABLE LEAVES_DETAIL
ADD CONSTRAINT FK_LEAVES_DETAIL_LEAVES
FOREIGN KEY (LeaveId) REFERENCES LEAVES(LeaveId);


