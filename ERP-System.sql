-- Create the database
CREATE DATABASE [ERP-System];

-- Use the created database
USE [ERP-System];

-- Create the User table
CREATE TABLE [User] (
	ID INT IDENTITY(1,1) NOT NULL,				-- Auto-incremented unique ID for each user
	UserID NVARCHAR(255) NOT NULL,				-- A GUID is generated along with user    
    Username NVARCHAR(50) NOT NULL,				-- Stores the username
    [Password] NVARCHAR(255) NOT NULL,			-- Stores the password (preferably hashed)
    NormalizedName NVARCHAR(50),				-- Stores the normalized name (e.g., uppercase version)
    Dob DATE,									-- Stores the date of birth
	createdDateTime DATETIME DEFAULT GETDATE()  -- Stores the record creation timestamp
);

-- Create the UserRoles table
CREATE TABLE [UserRoles] (
    roleID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,	-- Auto-incremented unique ID for each role
    userID NVARCHAR(255) NOT NULL,					-- Foreign Key from User table
    IsAdmin BIT NOT NULL DEFAULT 0,					-- Indicates if the user is an admin
    IsTeacher BIT NOT NULL DEFAULT 0,				-- Indicates if the user is a teacher
    IsStudent BIT NOT NULL DEFAULT 0,				-- Indicates if the user is a student
	IsDisabled BIT NULL DEFAULT 0,					-- Soft Delete User
    createdDateTime DATETIME DEFAULT GETDATE(),		-- Stores the record creation timestamp
    modifiedDateTime DATETIME NULL,					-- Stores the record modification timestamp  
);


-- Add a Primary Key (if desired) on Username for unique identification
ALTER TABLE [User]
ADD CONSTRAINT PK_User PRIMARY KEY (UserID);

-- Add Foreign Key constraint UserRoles Table
ALTER TABLE [UserRoles]
ADD CONSTRAINT FK_UserRoles_User FOREIGN KEY (userID) REFERENCES [User](userID)
ON DELETE CASCADE ON UPDATE CASCADE