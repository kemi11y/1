/*Завдання 1.1: Створення бази даних та таблиць*/   
/*Створюємо базу даних `UniversityDB`*/

 CREATE DATABASE UniversityDB;
	GO
    USE UniversityDB;
 
/* Створюємо таблицю `Departments` без обмежень*/ 
 
      CREATE TABLE Departments (
      DepartmentID INT NOT NULL,
      DepartmentName VARCHAR(100)
  );

/* Створюємо таблицю `Professors` без обмежень*/ 
  CREATE TABLE Professors (
      ProfessorID INT NOT NULL,
      FirstName VARCHAR(50),
      LastName VARCHAR(50),
      Age TINYINT,
      DepartmentID INT,
      Email VARCHAR(100)
  );

/*Завдання 1.2: Додавання обмежень до існуючих таблиць */

/* Додаємо PRIMARY KEY до `Departments` та `Professors`*/

  ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

  ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

/* Додаємо UNIQUE обмеження на `Email` в `Professors`*/
  
  ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

/* Додаємо FOREIGN KEY обмеження до `Professors`, щоб пов'язати `DepartmentID` з `Departments`*/

  ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
 
/* Додаємо CHECK обмеження на `Age` в ` Professors`, щоб значення віку не було менше 20.*/
 
  ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age > = 20);
 
/* Додаєсо NOT NULL обмеження на `FirstName` і `LastName` в `Professors` */ 
 
  ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
  ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

/* Додаємо DEFAULT значення для `DepartmentName` в `Departments` */

  ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;

/* Завдання 1.3 Введення та тестування даних */
/* Вводимо дані до `Departments`. Якщо `DepartmentName` не вказано, використовуємо значення за замовчуванням 'General' */

  INSERT INTO Departments (DepartmentID) VALUES (1);

/* Вводимо дані до `Professors`, включаючи їх прив'язку до відділів через `DepartmentID`*/
 
  INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
  VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

/* Вставляємо запис до `Professors` з існуючим `Email`, щоб перевірити UNIQUE обмеження.*/

 INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Age,Email) 
  VALUES (2, 'Jane', 'Doe', 1, 35, 'john.smith@university.com'); 

/* це викликає помилку через UNIQUE обмеження */

/* Вставляємо запис до `Professors` з існуючим віком менше 20, щоб перевірити CHECK обмеження */
 
 INSERT INTO Professors (ProfessorID, FirstName, LastName, DepartmentID, Age, Email) 
  VALUES (3, 'Bob', 'Doe', 1, 17, 'bob@university.com'); 

/* Це викликає помилку через CHECK обмеження */

/* Завдання 1.4. Очищення */
/* Видаляємо таблиці `Professors` та `Departments`*/

  DROP TABLE Professors;
  DROP TABLE Departments;

/* Видаляємо базу даних `UniversityDB`*/
  USE master;
  DROP DATABASE UniversityDB;

  /* Блок 2: Створення таблиць з обмеженнями */
/* Завдання 2.1: Створення бази даних і таблиць */

/* Створюємо базу даних `CompanyDB`*/

    CREATE DATABASE CompanyDB;
	GO
    USE CompanyDB;

/* Створюємо таблицю `Employees` з PRIMARY KEY, NOT NULL, UNIQUE, і DEFAULT обмеженнями */

	CREATE TABLE Employees (
      EmployeeID INT PRIMARY KEY,
      FirstName VARCHAR(50) NOT NULL,
      LastName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) UNIQUE,
      Position VARCHAR(50) DEFAULT 'Junior Developer'
  );

/* Створюємо таблицю `Departments` з PRIMARY KEY та CHECK обмеженнями */

      CREATE TABLE Departments (
      DepartmentID INT PRIMARY KEY,
      DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),
      Budget DECIMAL(10, 2) CHECK (Budget > 0),
      DefaultRoomNumber INT DEFAULT 101
  );

/* Створюємо таблицю `Assignments` з FOREIGN KEY, що вказує на `Employees` та `Departments` */

  CREATE TABLE Assignments (
      AssignmentID INT PRIMARY KEY,
      EmployeeID INT NOT NULL,
      DepartmentID INT NOT NULL,
      AssignmentDate DATE DEFAULT GETDATE(),
      FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  );

/* Завдання 2.2. Введення та тестування даних */
/* Вводимо дані до `Departments` і `Employees`, та створюэмо призначення у `Assignments` */

    INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
  VALUES (1, 'Human Resources', 50000);
  
  INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
  VALUES (1, 'John', 'Smith', 'john.smith@company.com');
  
  INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
  VALUES (1, 1, 1);
  
  SELECT * FROM Assignments;
  SELECT * FROM Employees;
  SELECT * FROM Departments;

/* Намагаэмося вставити запис до `Assignments` з неіснуючим `EmployeeID` та `DepartmentID`, щоб перевірити FOREIGN KEY обмеження */

      INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
  VALUES (2, 999, 1); 

/* Це викликаэ помилку через FOREIGN KEY обмеження */

/* Завдання 2.3: Очищення*/

/*Видалення таблиць `Assignments`, `Employees` та `Departments` */
  
  DROP TABLE Assignments;
  DROP TABLE Employees;
  DROP TABLE Departments;
 
/*Видалення базу даних `CompanyDB`. */
    
   USE master;
   DROP DATABASE CompanyDB;



