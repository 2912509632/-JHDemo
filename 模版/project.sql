use master

if db_id('project') is not null
	drop database project
go

create database project
go

use project

create table userGroup
(
	groupID INT NOT NULL PRIMARY KEY IDENTITY,
	groupName VARCHAR(30) NOT NULL
)
go

INSERT INTO userGroup VALUES('超级管理员')
go


create table users
(
	userID INT NOT NULL PRIMARY KEY IDENTITY,
	userAccount VARCHAR(30) NOT NULL,
	userPwd VARCHAR(40) NOT NULL,
	userName  VARCHAR(30) NOT NULL,
	userState INT DEFAULT 0, --1 正常 0 停用
	groupID INT NOT NULL,
	lastLoginTime DATETIME DEFAULT GETDATE(),
)
GO

INSERT INTO users VALUES('admin','admin','Tom',1,1,null)
go

