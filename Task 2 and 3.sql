/***********************
2.1 Create the database and all tables specified in the dataset (relational model) to meet the specifications identified in task one. Clearly document all DDL statements used in (table creation not all data)this process.
2.2 Populate all database tables with the desired data to a minimum of 10 tuples per relation. Clearly document all DML statements used in this process.
*************************/
CREATE DATABASE College;
USE College;

CREATE TABLE College (
	registration_ID INT,
	name VARCHAR(50),
	phone_no VARCHAR(50),
	dean_name VARCHAR(50),
	address VARCHAR(50),
	opening_time VARCHAR(50),
	closing_time VARCHAR(50),
	PRIMARY KEY (registration_ID)
);

insert into College (registration_ID, name, phone_no, dean_name, address, opening_time, closing_time) 
values (1, 'Ailane College', '+856 965 977 1257', 'Julio Dreus', '65 Helena Center, Dublin, Ireland', 'MON-FRI 09:00', 'MON-FRI 17:00');

CREATE TABLE Department (
	department_ID INT,
	name VARCHAR(19),
	registration_ID INT,
	lecturer_ID INT,
	PRIMARY KEY (department_ID),
	FOREIGN KEY (registration_ID) REFERENCES College(registration_ID) 
    ON DELETE CASCADE
	ON UPDATE CASCADE
);
create table staff (
	staff_ID INT,
	fname VARCHAR(50),
	lname VARCHAR(50),
	job_title VARCHAR(50),
	dob DATE,
	address VARCHAR(50),
	salary INT,
	start_date DATE,
	phone_no VARCHAR(50),
	days_off_taken INT,
	department_ID INT,
	registration_ID INT,
	PRIMARY KEY (staff_ID),
	FOREIGN KEY (registration_ID) REFERENCES College(registration_ID) ON DELETE CASCADE
	ON UPDATE CASCADE,
    FOREIGN KEY (department_ID) REFERENCES Department(department_ID) ON DELETE CASCADE
	ON UPDATE CASCADE
);

create table Student (
	student_ID INT,
	status VARCHAR(20),
	address VARCHAR(50),
	fname VARCHAR(50),
	lname VARCHAR(50),
	phone_no VARCHAR(50),
	student_year INT,
	sstudent_YE_results INT,
	course_ID INT,
	registration_ID INT,
	PRIMARY KEY (student_ID),
    FOREIGN KEY (registration_ID) REFERENCES College(registration_ID) ON DELETE CASCADE
  ON UPDATE CASCADE
);

insert into Department (department_ID, name, registration_ID, lecturer_ID) values (1, 'School Of Computing', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (2, 'School of Business', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (3, 'HR', 1, 14);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (4, 'Marketing', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (5, 'IT Support', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (6, 'Accounts', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (7, 'Security', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (8, 'Cloud Department', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (9, 'International', 1, 9);
insert into Department (department_ID, name, registration_ID, lecturer_ID) values (10, 'Remote Learning', 1, 9);

CREATE TABLE Lecturer (
	staff_ID INT,
	department_ID INT,
	PRIMARY KEY (staff_ID),
    FOREIGN KEY (department_ID) REFERENCES Department(department_ID) ON DELETE CASCADE
  ON UPDATE CASCADE
);

insert into Lecturer (staff_ID, department_ID) values (3, 1);
insert into Lecturer (staff_ID, department_ID) values (9, 2);
insert into Lecturer (staff_ID, department_ID) values (10, 1);
insert into Lecturer (staff_ID, department_ID) values (11, 2);
insert into Lecturer (staff_ID, department_ID) values (14, 1);
insert into Lecturer (staff_ID, department_ID) values (20, 2);
insert into Lecturer (staff_ID, department_ID) values (21, 1);
insert into Lecturer (staff_ID, department_ID) values (22, 2);
insert into Lecturer (staff_ID, department_ID) values (25, 1);
insert into Lecturer (staff_ID, department_ID) values (31, 2);

ALTER TABLE Department
ADD FOREIGN KEY (lecturer_ID) REFERENCES Lecturer(staff_ID) ON DELETE CASCADE
  ON UPDATE CASCADE;

create table Course (
	course_ID INT,
	academic_level varchar(20),
	course_name VARCHAR(50),
	delivery_mode VARCHAR(50),
	semester_no  INT,
	semester_length INT,
	start_date DATE,
	department_ID INT,
	PRIMARY KEY (course_ID),
    FOREIGN KEY (department_ID) REFERENCES Department(department_ID) ON DELETE CASCADE
  ON UPDATE CASCADE
);

insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (1, 'PHD', 'IT Course', 'On Campus', 5, 12, '2021/10/08', 1);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (2, '7', 'Business', 'On Line', 3, 12, '2021/10/04', 2);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (3, '8', 'VKL', 'On Campus', 8, 12, '2021/10/14', 1);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (4, '9', 'SNL', 'On Line', 5, 12, '2021/09/29', 2);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (5, 'PHD', 'PHD', 'On Line', 6, 12, '2021/05/24', 1);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (6, '6', 'SNL', 'On Campus', 8, 12, '2021/07/08', 2);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (106, '6', 'SNL', 'On Campus', 8, 12, '2021/07/08', 2);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (107, '6', 'SNL', 'On Campus', 8, 12, '2021/07/08', 2);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (108, '6', 'SNL', 'On Campus', 8, 12, '2021/07/08', 2);
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) values (109, '6', 'SNL', 'On Campus', 8, 12, '2021/07/08', 2);

create table Module (
	module_ID INT,
	name VARCHAR(2),
	course_ID INT,
	lecturer_ID INT,
	PRIMARY KEY (module_ID),
    FOREIGN KEY (lecturer_ID) REFERENCES lecturer(staff_ID)	 ON DELETE CASCADE
  ON UPDATE CASCADE
);

insert into Module (module_ID, name, course_ID, lecturer_ID) values (1, 'M1', 1, 3);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (2, 'M2', 2, 9);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (3, 'M1', 3, 10);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (4, 'M2', 4, 11);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (5, 'M1', 5, 14);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (6, 'M2', 6, 20);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (7, 'M1', 7, 21);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (8, 'M2', 8, 22);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (9, 'M1', 1, 25);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (10, 'M2', 2, 31);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (11, 'M1', 3, 3);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (12, 'M2', 4, 9);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (13, 'M1', 5, 10);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (14, 'M2', 6, 11);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (15, 'M1', 7, 14);
insert into Module (module_ID, name, course_ID, lecturer_ID) values (16, 'M2', 8, 20);

insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (1, 'active', '90 Kedzie Way', 'Dennet', 'Dashkovich', '937-542-2052', 2, 66, 4, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (2, 'active', '39334 Independence Way', 'Halsey', 'Farra', '995-909-0679', 2, 53, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (3, 'active', '01051 Kings Court', 'Elfrida', 'Sarchwell', '680-420-1793', 3, 97, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (4, 'active', '7 Village Way', 'Camilla', 'Decent', '403-721-9891', 3, 44, 5, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (5, 'active', '9 Erie Way', 'Erwin', 'Jemmett', '204-175-9787', 1, 60, 6, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (6, 'active', '9378 Reindahl Point', 'Renate', 'Oxberry', '838-251-5524', 4, 53, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (7, 'active', '7224 Victoria Trail', 'Dan', 'Cluley', '303-135-1747', 4, 56, 6, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (8, 'active', '089 Lindbergh Center', 'Codie', 'Prendergrast', '561-789-8494', 2, 83, 6, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (9, 'active', '7 Holmberg Lane', 'Kelby', 'Dellenbrok', '368-362-1875', 1, 70, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (10, 'active', '188 Lakewood Alley', 'Angeline', 'Salkeld', '979-729-5378', 2, 54, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (11, 'active', '885 Farragut Place', 'Florette', 'Langeley', '791-203-9530', 1, 66, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (12, 'active', '014 Valley Edge Alley', 'Dacy', 'Potes', '415-846-4690', 2, 57, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (13, 'active', '8361 Canary Alley', 'Rhonda', 'Haseldine', '362-903-7436', 4, 99, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (14, 'active', '63343 Northfield Drive', 'Caryl', 'Pollock', '708-415-5168', 4, 72, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (15, 'active', '746 Old Gate Drive', 'Hana', 'Feldbaum', '203-126-0425', 4, 75, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (16, 'active', '568 Katie Park', 'Cordula', 'Kay', '355-843-1457', 1, 88, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (17, 'active', '12 Browning Point', 'Kerby', 'Bullant', '260-843-8247', 2, 60, 6, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (18, 'active', '42771 Grover Trail', 'Natala', 'Hinstridge', '514-633-4503', 1, 44, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (19, 'active', '281 Toban Point', 'Lotty', 'McCourt', '798-691-9293', 3, 36, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (20, 'active', '74 Northwestern Drive', 'Justen', 'McAneny', '466-605-9397', 4, 82, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (21, 'active', '628 Waubesa Plaza', 'Horacio', 'Sertin', '582-273-9437', 4, 69, 4, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (22, 'active', '2 Emmet Parkway', 'Cornelius', 'Gantlett', '556-726-0012', 1, 37, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (23, 'active', '72259 Goodland Hill', 'Huntley', 'Mattholie', '577-681-2151', 3, 49, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (24, 'active', '69 Village Road', 'Bamby', 'Roma', '500-767-7046', 3, 71, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (25, 'active', '22689 Troy Hill', 'Ermentrude', 'Sheryn', '760-161-0395', 1, 53, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (26, 'active', '92 Charing Cross Avenue', 'Jessa', 'Hobson', '399-297-6433', 2, 58, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (27, 'active', '2 Kings Pass', 'Loydie', 'Dacres', '471-205-7723', 3, 76, 5, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (28, 'active', '04 School Center', 'Gerianna', 'Gostling', '118-798-4789', 3, 50, 5, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (29, 'active', '89 Basil Avenue', 'Ninetta', 'Mabbitt', '909-928-3115', 1, 86, 6, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (30, 'active', '5 Ridgeway Pass', 'Ingrid', 'Espie', '827-737-4144', 3, 60, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (31, 'active', '0629 Ilene Junction', 'Chet', 'Knoles', '814-781-7047', 1, 51, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (32, 'active', '888 Morning Center', 'Elden', 'Collens', '141-604-9268', 4, 67, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (33, 'active', '3 Butternut Drive', 'Mendie', 'Pumphreys', '939-970-7290', 2, 98, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (34, 'active', '21 Dakota Avenue', 'Rodie', 'Duggen', '517-964-5809', 2, 52, 3, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (35, 'active', '68472 Melby Lane', 'Joey', 'Reynish', '292-497-8074', 4, 93, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (36, 'active', '74 Welch Drive', 'Nealy', 'Jordon', '825-221-8937', 1, 68, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (37, 'active', '9 Hallows Avenue', 'Jayne', 'Sharvill', '791-896-3198', 1, 35, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (38, 'active', '498 Leroy Circle', 'Gilda', 'Lowre', '894-477-2673', 3, 91, 4, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (39, 'active', '4934 Buena Vista Crossing', 'Emmye', 'Willgress', '266-924-7266', 1, 48, 5, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (40, 'active', '45 Katie Way', 'Bjorn', 'Fleisch', '982-476-9862', 4, 92, 1, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (41, 'active', '3367 Mayer Plaza', 'Kalil', 'Pencott', '884-387-2413', 3, 71, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (42, 'active', '13402 Acker Trail', 'Olia', 'MacKim', '515-975-4188', 4, 69, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (43, 'active', '42621 Shoshone Junction', 'Titus', 'Hallex', '938-494-2891', 1, 92, 4, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (44, 'active', '13 Wayridge Parkway', 'Cheri', 'Gillease', '265-606-9050', 2, 97, 6, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (45, 'active', '91 Eagle Crest Junction', 'Jodie', 'Noot', '716-681-3673', 2, 86, 3, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (46, 'active', '4932 Clemons Drive', 'Orin', 'Mitchelson', '122-509-7285', 1, 54, 5, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (47, 'active', '7 Westend Crossing', 'Jeniece', 'Wanell', '812-938-9396', 2, 56, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (48, 'active', '2 Ryan Place', 'Augie', 'Riglar', '882-431-6099', 3, 57, 2, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (49, 'active', '6978 Westerfield Crossing', 'Aida', 'Levings', '215-257-5155', 2, 51, 4, 1);
insert into Student (student_ID, status, address, fname, lname, phone_no, student_year, sstudent_YE_results, course_ID, registration_ID) values (50, 'active', '68721 Anderson Center', 'Lea', 'Allaway', '631-451-3371', 1, 88, 1, 1);

create table Student_Fee (
	fee_ID INT,
	due_date DATE,
	paid_date DATE,
	amount INT,
	course_ID INT,
	student_ID INT,
	PRIMARY KEY (fee_ID),
    FOREIGN KEY (course_ID) REFERENCES Course(course_ID) ON DELETE CASCADE
  ON UPDATE CASCADE,
	FOREIGN KEY (student_ID) REFERENCES Student(student_ID) ON DELETE CASCADE
  ON UPDATE CASCADE
);

create table Grade (
	grade_ID INT,
	grade INT,
	student_ID INT,
	module_ID INT,
	PRIMARY KEY (grade_ID),
    FOREIGN KEY (student_ID) REFERENCES student(student_ID) ON DELETE CASCADE
  ON UPDATE CASCADE,
	FOREIGN KEY (module_ID) REFERENCES module(module_ID) ON DELETE CASCADE
  ON UPDATE CASCADE
);

insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (1, 'Caryl', 'Whalley', 'Office', '1998-09-24', '0 Division Drive', 32455, '2008-09-29', '+51 866 739 9726', 5, 2, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (2, 'Charley', 'Westberg', 'HR', '1987-07-14', '343 Drewry Park', 30861, '2011-10-16', '+55 803 826 4941', 17, 4, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (3, 'Janene', 'Cluet', 'Lecturer', '1968-08-21', '9779 Forest Run Junction', 37978, '2001-10-09', '+86 951 346 3973', 19, 10, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (4, 'Karena', 'Gepp', 'Security', '1971-03-16', '9 Delaware Place', 37321, '2015-12-20', '+86 258 472 7018', 10, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (5, 'Ave', 'Ascraft', 'Prcurement', '1991-08-23', '54503 Messerschmidt Junction', 40694, '2011-09-28', '+20 273 820 6440', 11, 8, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (6, 'Tracie', 'Rigler', 'Marketing', '2001-01-24', '9 Scott Alley', 36472, '2020-01-21', '+351 961 343 0683', 14, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (7, 'Drusie', 'Warbeys', 'Manager', '1993-02-23', '4146 North Lane', 31153, '2006-09-26', '+63 231 567 8745', 2, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (8, 'Ashley', 'Trusse', 'IT Support', '1970-08-26', '9878 Milwaukee Circle', 31454, '2001-03-31', '+81 491 192 5776', 12, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (9, 'Helyn', 'Josham', 'Lecturer', '1983-11-22', '21991 Hallows Circle', 33860, '1999-12-31', '+420 667 601 4206', 7, 2, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (10, 'Maitilde', 'Rumin', 'Lecturer', '1970-10-14', '16 Butternut Point', 31672, '2019-12-03', '+63 427 224 1785', 3, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (11, 'Winslow', 'Habbergham', 'Lecturer', '1986-07-16', '99380 Donald Place', 38522, '2002-06-12', '+53 969 622 2587', 18, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (12, 'Lucina', 'Thorns', 'Office', '1973-06-30', '36 Nancy Hill', 32453, '2013-06-07', '+48 394 292 7181', 14, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (13, 'Ferne', 'Shilliday', 'HR', '1990-09-25', '151 Crescent Oaks Street', 38983, '2008-05-03', '+94 507 829 9512', 9, 2, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (14, 'Reinaldos', 'Rakes', 'Lecturer', '1986-01-24', '31 1st Way', 35076, '2008-05-20', '+351 949 522 0784', 12, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (15, 'Early', 'Frantsev', 'Security', '1965-08-06', '150 Talmadge Junction', 30035, '2017-07-07', '+33 813 244 7655', 2, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (16, 'Letizia', 'Leverentz', 'Prcurement', '1970-07-29', '4152 Macpherson Terrace', 30574, '2014-07-22', '+62 200 503 2111', 7, 8, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (17, 'Regina', 'Gorsse', 'Marketing', '1972-10-24', '1 Karstens Lane', 36723, '2003-02-24', '+358 845 567 0363', 19, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (18, 'Jewelle', 'Craw', 'Manager', '1976-06-15', '76 Rusk Hill', 41103, '2013-02-23', '+7 891 804 5040', 19, 1, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (19, 'Juliana', 'Greenall', 'IT Support', '1967-10-02', '95 Monica Crossing', 34448, '2009-01-24', '+63 822 233 3092', 1, 4, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (20, 'Katinka', 'Dunbobin', 'Lecturer', '1977-02-27', '0 Westerfield Hill', 41403, '2015-01-15', '+256 147 988 9533', 5, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (21, 'Andrej', 'Ruste', 'Lecturer', '1987-05-20', '956 Hoffman Terrace', 42978, '2003-08-12', '+7 891 956 6113', 1, 3, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (22, 'Byran', 'Byne', 'Lecturer', '1973-07-02', '42 Chive Way', 34600, '2012-06-05', '+1 616 617 0928', 13, 4, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (23, 'Sileas', 'Kordovani', 'Office', '1995-03-21', '9 High Crossing Road', 31867, '2007-12-24', '+850 926 187 2350', 3, 10, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (24, 'Doralynne', 'Bowfin', 'HR', '1972-11-08', '85 Blaine Place', 31892, '2003-07-19', '+7 138 936 7228', 18, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (25, 'Cherice', 'Featherby', 'Lecturer', '1995-09-08', '0252 Clemons Court', 40391, '2014-05-08', '+66 851 154 6614', 8, 2, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (26, 'Erhart', 'Matthessen', 'Security', '1998-02-12', '80 Park Meadow Crossing', 35714, '2006-05-23', '+351 553 992 8838', 15, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (27, 'Quincy', 'Constable', 'Prcurement', '1999-03-05', '504 Lunder Plaza', 33317, '2012-09-14', '+33 731 482 4310', 6, 6, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (28, 'Rubin', 'Ellins', 'Marketing', '1995-03-11', '36 Stoughton Park', 44928, '2008-05-26', '+55 152 340 9688', 6, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (29, 'Cordie', 'Stretton', 'Manager', '1967-03-30', '0 Brickson Park Avenue', 30265, '2002-10-19', '+63 197 568 9470', 18, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (30, 'Kimball', 'Salsbury', 'IT Support', '1977-02-03', '60 Rusk Avenue', 44170, '2007-11-26', '+353 330 764 8208', 9, 8, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (31, 'Gilberte', 'Joannidi', 'Lecturer', '1991-04-15', '698 Southridge Place', 34574, '2002-01-12', '+420 871 835 1311', 7, 3, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (32, 'Elnar', 'Carnegie', 'Lecturer', '1980-04-13', '12 Drewry Alley', 40568, '2003-04-09', '+593 967 593 4535', 15, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (33, 'Rosabel', 'Whittek', 'Lecturer', '1970-07-30', '43 Thierer Parkway', 40918, '2004-12-06', '+51 454 440 3654', 6, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (34, 'Cass', 'Berford', 'Office', '1991-12-30', '549 Drewry Avenue', 37555, '1999-01-31', '+385 580 962 6891', 19, 10, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (35, 'Oswell', 'Compston', 'HR', '1989-09-26', '42951 Lukken Circle', 32596, '2019-11-21', '+55 813 373 7419', 21, 10, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (36, 'Rikki', 'Mallock', 'Lecturer', '1986-11-27', '776 Cottonwood Junction', 31782, '2013-12-20', '+63 851 234 2455', 19, 4, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (37, 'Hammad', 'Ugolotti', 'Security', '1985-08-06', '04 Arapahoe Park', 39250, '2017-09-13', '+62 651 264 8497', 14, 10, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (38, 'Fayette', 'Peirpoint', 'Prcurement', '1990-01-03', '953 Anniversary Drive', 42433, '2016-07-22', '+81 582 986 5130', 21, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (39, 'Toby', 'Karleman', 'Marketing', '1981-10-02', '14296 Hudson Center', 30958, '2011-05-03', '+371 918 864 6842', 12, 3, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (40, 'Caron', 'Girodier', 'Manager', '1980-05-05', '038 Ridge Oak Trail', 35565, '2007-04-10', '+355 736 740 0016', 12, 3, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (41, 'Blondie', 'Jobbins', 'IT Support', '1979-10-04', '65016 Morrow Avenue', 38146, '2018-04-20', '+387 204 857 8719', 13, 4, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (42, 'Gaye', 'Joppich', 'Lecturer', '1978-07-23', '573 Stang Place', 36152, '2000-09-25', '+963 774 210 2038', 21, 9, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (43, 'Beverlie', 'Scanlan', 'Lecturer', '1986-04-30', '52412 Corscot Avenue', 39835, '2002-08-17', '+62 104 429 3478', 16, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (44, 'Drugi', 'Blower', 'Lecturer', '1979-01-25', '85240 Morningstar Hill', 42480, '2001-09-01', '+62 138 610 9874', 13, 2, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (45, 'Kathryn', 'Hully', 'Office', '1988-08-28', '6700 Arapahoe Alley', 32577, '2001-02-26', '+389 979 869 3937', 11, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (46, 'Shela', 'Gisbourn', 'HR', '1997-07-06', '8976 Myrtle Park', 36348, '2009-01-27', '+49 282 833 0855', 7, 1, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (47, 'Rog', 'Ellicock', 'Lecturer', '1970-09-14', '29320 Barnett Point', 35207, '2018-06-14', '+351 717 549 0249', 18, 7, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (48, 'Amalea', 'Hiom', 'Security', '1972-05-13', '2426 Northview Alley', 30235, '2006-01-22', '+30 564 750 2569', 4, 5, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (49, 'Maddie', 'Berlin', 'Prcurement', '1990-08-02', '023 Hazelcrest Trail', 40985, '2019-08-09', '+356 649 728 8747', 15, 10, 1);
insert into staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) values (50, 'Ancell', 'Laven', 'Marketing', '1995-04-10', '81 Corry Junction', 33736, '2018-08-15', '+7 202 646 6730', 21, 9, 1);

insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (1, '2019-09-06', '2020-06-13', 500, 1, 1);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (2, '2020-05-02', '2021-02-03', 800, 2, 2);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (3, '2019-09-26', '2021-03-09', 2000, 3, 3);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (4, '2020-06-17', '2020-07-22', 500, 4, 4);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (5, '2020-10-29', null, 800, 5, 5);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (6, '2020-04-25', '2020-05-31', 2000, 6, 6);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (7, '2019-12-07', '2020-07-13', 500, 2, 7);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (8, '2019-09-03', '2020-04-23', 800, 2, 8);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (9, '2020-06-11', '2020-03-23', 2000, 1, 9);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (10, '2020-08-12', '2020-07-05', 500, 2, 10);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (11, '2020-09-16', null, 800, 3, 11);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (12, '2020-09-23', '2020-10-20', 2000, 4, 12);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (13, '2020-03-07', '2020-08-14', 500, 5, 13);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (14, '2020-10-17', '2020-02-08', 800, 6, 14);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (15, '2019-11-01', '2020-10-02', 2000, 2, 15);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (16, '2020-09-24', '2020-02-19', 500, 2, 16);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (17, '2020-02-14', '2020-04-12', 800, 1, 17);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (18, '2020-08-20', '2020-07-16', 2000, 2, 18);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (19, '2019-09-30', '2021-03-18', 500, 3, 19);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (20, '2019-10-20', '2020-04-23', 800, 4, 20);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (21, '2019-09-17', '2021-02-22', 2000, 5, 21);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (22, '2020-10-17', '2021-01-21', 500, 6, 22);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (23, '2019-09-22', '2020-04-19', 800, 2, 23);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (24, '2020-10-13', '2020-12-10', 2000, 2, 24);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (25, '2020-09-06', '2020-09-04', 500, 1, 25);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (26, '2020-03-15', '2020-08-22', 800, 2, 26);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (27, '2020-03-05', null, 2000, 3, 27);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (28, '2019-10-19', '2020-07-28', 500, 4, 28);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (29, '2020-09-06', '2020-05-02', 800, 5, 29);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (30, '2019-12-14', '2021-03-10', 2000, 6, 30);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (31, '2020-10-23', '2020-05-03', 500, 2, 31);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (32, '2020-05-18', '2020-05-24', 800, 2, 32);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (33, '2019-12-26', '2020-11-01', 2000, 1, 33);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (34, '2019-09-21', '2020-02-08', 500, 2, 34);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (35, '2020-03-19', null, 800, 3, 35);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (36, '2020-06-10', '2021-01-20', 2000, 4, 36);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (37, '2020-06-30', '2021-01-21', 500, 5, 37);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (38, '2020-01-30', '2020-11-02', 800, 6, 38);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (39, '2020-04-21', '2020-04-17', 2000, 2, 39);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (40, '2020-10-07', '2020-10-18', 500, 2, 40);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (41, '2020-06-24', '2020-06-04', 800, 1, 41);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (42, '2020-09-14', '2021-01-13', 2000, 2, 42);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (43, '2020-01-22', '2020-10-17', 500, 3, 43);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (44, '2020-02-29', null, 800, 4, 44);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (45, '2020-07-20', '2020-10-12', 2000, 5, 45);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (46, '2020-01-13', '2020-09-11', 500, 6, 46);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (47, '2020-07-21', '2020-05-29', 800, 2, 47);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (48, '2020-07-25', '2021-01-15', 2000, 2, 48);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (49, '2019-10-03', '2020-07-09', 500, 1, 49);
insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) values (50, '2020-05-24', '2020-08-17', 800, 2, 50);

insert into Grade (grade_ID, grade, student_ID, module_ID) values (1, 82, 1, 1);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (2, 65, 2, 2);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (3, 55, 3, 3);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (4, 61, 4, 4);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (5, 43, 5, 5);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (6, 64, 6, 6);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (7, 74, 7, 7);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (8, 68, 8, 8);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (9, 24, 9, 9);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (10, 96, 10, 10);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (11, 83, 11, 11);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (12, 35, 12, 12);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (13, 21, 13, 13);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (14, 26, 14, 14);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (15, 5, 15, 15);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (16, 36, 16, 16);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (17, 15, 17, 1);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (18, 17, 18, 2);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (19, 58, 19, 3);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (20, 46, 20, 4);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (21, 82, 21, 5);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (22, 81, 22, 6);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (23, 63, 23, 7);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (24, 45, 24, 8);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (25, 23, 25, 9);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (26, 81, 26, 10);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (27, 44, 27, 11);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (28, 65, 28, 12);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (29, 9, 29, 13);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (30, 56, 30, 14);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (31, 60, 31, 15);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (32, 9, 32, 16);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (33, 24, 33, 1);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (34, 94, 34, 2);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (35, 59, 35, 3);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (36, 80, 36, 4);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (37, 9, 37, 5);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (38, 1, 38, 6);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (39, 47, 39, 7);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (40, 48, 40, 8);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (41, 7, 41, 9);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (42, 67, 42, 10);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (43, 50, 43, 11);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (44, 81, 44, 12);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (45, 34, 45, 13);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (46, 41, 46, 14);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (47, 41, 47, 15);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (48, 40, 48, 16);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (49, 49, 49, 1);
insert into Grade (grade_ID, grade, student_ID, module_ID) values (50, 53, 50, 2);

/*
Use MYSQL statements to query and modify the dataset as follows: 
3.1	Change all students in year one of any course to year two.
*************************DELETES ARE ON THE END************************************************
*/
/************************3.1***********************/
USE college;
SET SQL_SAFE_UPDATES=0;
UPDATE student SET student_year = '2'
WHERE student_year = '1';
SELECT * FROM student;



/***********************3.2*************************/


UPDATE student SET status ='Completed'
WHERE student_year='4';
SELECT * FROM student;


/**********************3.4************************/
CREATE VIEW grade_view_des
AS SELECT fname, lname, grade.grade
FROM student, grade
ORDER by grade.grade DESC;
SELECT * FROM college.grade_view_des;


/********************3.5**************************/
insert into College (registration_ID, name, phone_no, dean_name, address, opening_time, closing_time) 
values (2, 'Busy College', '+856 765 977 1257', 'John Doe', '45 Arlene Center, Dublin, Ireland', 'MON-FRI 10:00', 'MON-FRI 12:00');

insert into Department (department_ID, name, registration_ID, lecturer_ID)
values (11, 'School Of Magic', 1, 31);

insert into Lecturer (staff_ID, department_ID) values (45, 11);
	
insert into Course (course_ID, academic_level, course_name, delivery_mode, semester_no , semester_length, start_date, department_ID) 
values (7, '8', 'Mag', 'On Line', 4, 6, '2021/11/08', 11);

insert into Module (module_ID, name, course_ID, lecturer_ID) values (17, 'M4', 7, 11);

insert into Student (student_ID, status, address, fname, lname, phone_no, student_year,       sstudent_YE_results, course_ID, registration_ID) 
values (51, 'active', '99 Magic Way', 'Max', 'Payne', '863-542-2052', 3, 77, 7, 2);

insert into Staff (staff_ID, fname, lname, job_title, dob, address, salary, start_date, phone_no, days_off_taken, department_ID, registration_ID) 
values (51, 'Marc', 'Rider', 'HR', '1985/07/09', '11 Lost Street', '31000', '2011/12/08', '+01 496 606 3330', 10, 11, 1);

insert into Student_Fee (fee_ID, due_date, paid_date, amount, course_ID, student_ID) 
values (55, '2021-03-06', '2021-03-13', 500, 2, 51); 

insert into Grade (grade_ID, grade, student_ID, module_ID) values (60, 66, 51, 17);


/**********************************3.7****************************/
SELECT SUM(days_off_taken)
FROM staff;
SELECT fname, lname, days_off_taken FROM staff
ORDER BY days_off_taken;


/*********************************3.8*********************************/
SELECT COUNT(student_ID),course.course_name
FROM student
INNER JOIN course ON student.course_ID=course.course_ID
WHERE course.course_name='Business';


/**********************************3.9***********************************/
UPDATE staff 
SET job_title = 'Office worker'
WHERE job_title = 'Office';
SELECT * FROM staff;
UPDATE staff 
SET job_title = 'Administrator'
WHERE job_title = 'Office worker';
SELECT * FROM staff;


/*********************************3.10********************************/
UPDATE course
SET academic_level = 'Doctorial'
WHERE academic_level='PHD';
SELECT * FROM course; 


/************************************3.11*****************************/
UPDATE course
SET delivery_mode = 'On Line'
WHERE delivery_mode = 'On Campus';
SELECT * FROM course;


/***********************************3.12*****************************/
UPDATE college
SET opening_time= 'closed to visitors'
WHERE opening_time='MON-FRI 09:00';
SELECT * FROM college;


/************************************3.15****************************/
UPDATE college
SET phone_no= '01-7654321'
WHERE registration_ID='1';


/************************************3.16*****************************/
UPDATE college
SET dean_name= 'Michael Dean'
WHERE registration_ID='1';
SELECT * FROM college;


/***********************************3.17******************************/
SELECT fname, lname, start_date
FROM staff
WHERE
start_date < '2017/04/01';


/************************************3.18****************************/
CREATE VIEW good_course
AS
SELECT course.course_ID,course.semester_no,course_name,count(student.course_ID)
FROM course
INNER JOIN student ON (course.course_ID=student.course_ID)
WHERE course.semester_no='3';
SELECT * FROM good_course;


/************************************3.19**********************************/
SELECT * FROM student
WHERE address LIKE '%road%';


/*3.20*/
SELECT student.student_ID, student.lname,student.fname, course.course_name, student_fee.due_date
FROM student
INNER JOIN course ON (student.course_ID=course.course_ID)
INNER JOIN student_fee ON (student.student_ID=student_fee.student_ID);


/***************************************DELETE/DROP*****************************************************/


/******************************************3.3*********************************************************/
DELETE student FROM student
INNER JOIN student_fee ON student.student_id=student_fee.student_ID
WHERE
DATEDIFF(paid_date,due_date) >'180' ;


/*******************************************3.6*******************************************************/
DELETE FROM college WHERE registration_ID=2;
DELETE FROM course WHERE course_ID=7;
DELETE FROM department WHERE department_ID=7;
DELETE FROM grade WHERE grade_ID=60;
DELETE FROM lecturer WHERE staff_ID=3;
DELETE FROM module WHERE module_ID=17;
DELETE FROM staff WHERE staff_ID=51;
DELETE FROM student WHERE student_ID=51;
DELETE FROM student_fee WHERE fee_ID=5;


/******************************************3.13*******************************************************/
ALTER TABLE course DROP FOREIGN KEY course_ibfk_1 ;
ALTER TABLE course DROP department_ID ;


/*******************************************3.14***********************************************************/
DELETE FROM course WHERE academic_level='6';