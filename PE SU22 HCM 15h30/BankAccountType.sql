USE master
GO
set dateformat dmy
go
CREATE DATABASE BankAccountType
GO

USE BankAccountType
GO

CREATE TABLE Users(
  UserID nvarchar(20) primary key,
  Password nvarchar(80) not null,
  UserName nvarchar(100), 
  UserRole int
)
GO
INSERT INTO Users VALUES(N'admin',N'123', N'Administrator', 1);
INSERT INTO Users VALUES(N'manager',N'123', N'Manager', 2);
INSERT INTO Users VALUES(N'staff',N'123', N'Staff', 3);
GO

CREATE TABLE AccountTypes(
  TypeID nvarchar(20) primary key,
  TypeName nvarchar(80) not null,
  TypeDesc nvarchar(250)
)
GO

CREATE TABLE BankAccounts (
 AccountID nvarchar(20) primary key,
 AccountName nvarchar(120) not null,
 OpenDate date,
 BranchName nvarchar(50),
 TypeID nvarchar(20) references AccountTypes(TypeID) on delete cascade on update cascade
)
GO

DELETE FROM AccountTypes
GO

INSERT INTO AccountTypes VALUES(N'AT0001',N'Saving',N'Saving Account Description')
INSERT INTO AccountTypes VALUES(N'AT0002',N'Checking',N'Checking Account Description')
INSERT INTO AccountTypes VALUES(N'AT0003',N'Trading',N'Trading Account Description')
INSERT INTO AccountTypes VALUES(N'AT0004',N'Forex',N'Money Market Account Description')
GO
DELETE FROM BankAccounts
GO
INSERT INTO BankAccounts VALUES(N'ACCT0001',N'Saving For New Customer 1',N'15/02/2001',N'Ha Noi','AT0001')
INSERT INTO BankAccounts VALUES(N'ACCT0002',N'Checking For New Customer 2',N'23/06/2001',N'Ha Noi','AT0002')
INSERT INTO BankAccounts VALUES(N'ACCT0003',N'Trading For New Customer 3',N'15/03/2020',N'Ha Noi','AT0003')
INSERT INTO BankAccounts VALUES(N'ACCT0004',N'Saving For New Customer 4',N'25/09/2021',N'HCM','AT0001')
INSERT INTO BankAccounts VALUES(N'ACCT0005',N'Forex For New Customer 5',N'15/02/2022',N'HCM','AT0004')
INSERT INTO BankAccounts VALUES(N'ACCT0006',N'Trading For New Customer 6',N'27/04/2022',N'Hai Phong','AT0003')
