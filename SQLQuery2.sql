
/*
Створюємо БД STUDENTS
*/

CREATE DATABASE STUDENTS;
/*
Переходимо на використання БД STUDENTS
*/
USE STUDENTS;

/*
Створюємо таблицю PersonalInfo зі стовпчиками StudentID, FirstName, LastName, DateOfBirth
*/

CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
    );

/*
Створюємо таблицю AcademicInfo зі стовпчиками RecordID, StudentID, Faculty, Curator, EnrollmentYear
*/
	CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT
    );

/*
Створюємо таблицю ContactInfo зі стовпчиками ContactID, StudentID, Email, PhoneNumber
*/
	    CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );


/*
У таблицю ContactInfo додаємо стовпчик Address
*/

	ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

/*
З таблиці ContactInfo видаляємо стовпчик PhoneNumber
*/

	ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;


/*
Зміна назви стовпчика Email на EmailAddress
*/
    EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/*
Зміна типу колонці Faculty с NVARCHAR(100) на NVARCHAR(150)
*/
	ALTER TABLE AcademicInfo  ALTER COLUMN Faculty NVARCHAR(150);

/*
Створюємо таблицю Extracurricular зі стовпчиками ActivityID, StudentID, ActivityName, JoinDate
*/
	 CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );
	
/*
видаляємо таблицю Extracurricular;
*/	
	DROP TABLE Extracurricular;

/*
Створюємо та видаляємо БД TEACHER;
*/
	CREATE DATABASE TEACHER;
	DROP DATABASE TEACHER;
/*
Переходимо на використання БД STUDENTS
*/
	USE STUDENTS;
/*
	Додаємо три рядки даних до таблиці "PersonalInfo"
*/

	INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');

/*
	виводимо рядки таблиці PersonalInfo
*/	
	SELECT * FROM PersonalInfo ORDER BY StudentID ASC;
