CREATE DATABASE seminar5;
USE seminar5;

CREATE TABLE users (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50) NOT NULL,
status VARCHAR(10) NOT NULL);

CREATE TABLE users_profile (
username VARCHAR(50) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE);

INSERT INTO users values
('admin' , '7856', 'Active'),
('staff' , '90802', 'Active'),
('manager' , '35462', 'Inactive');

INSERT INTO users_profile values
('admin', 'Administrator' , 'Dhanmondi', 'admin@test.com' ) ,
('staff', 'Jakir Nayek' , 'Mirpur', 'zakir@test.com' ),
('manager', 'Mehr Afroz' , 'Eskaton', 'mehr@test.com' );

#Используя СТЕ, выведите всех пользователей из таблицы users_profile

WITH users_choice AS
(
	SELECT username, name FROM users_profile
)

SELECT * FROM users_choice;


#Используя СТЕ, выведите всех активных пользователей из таблицы users

WITH users_choice AS
(
	SELECT username FROM users
	WHERE status = 'Active'
)

SELECT * FROM users_choice;

#Используя СТЕ, подсчитайте количество активных пользователей . Задайте
псевдоним результирующему окну

WITH active_users AS
(
	SELECT COUNT(*) AS au FROM users
	WHERE status = "Active"
	GROUP BY status
)

SELECT au AS "Total_active_users" FROM active_users;

#С помощью СТЕ реализуйте таблицу квадратов чисел от 1 до 10

WITH RECURSIVE square (n, result) AS
(	
	SELECT 1, 1
	UNION ALL
	SELECT n+1, POW(n+1, 2)
	FROM square
	WHERE n < 10
)
SELECT * FROM square;