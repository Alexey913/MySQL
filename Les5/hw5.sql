#Создание базы данных

CREATE DATABASE homework5;
USE homework5;


#Создание таблицы для задач 1-3

CREATE TABLE cars
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	cost DECIMAL(8, 2) NOT NULL
);

INSERT INTO cars (name, cost)
VALUES  ('Audi' , '52642'),
	('Mersedes', '57127'),
	('Skoda', '9000'),
	('Volvo', '29000'),
	('Bentley', '350000'),
	('Citroen', '21000'),
	('Hummer', '41400'),
	('Volkswagen', '21600');


#1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

#Создание табличного выражения
WITH cost_under_limit AS
(
	SELECT * FROM cars
	WHERE cost < 25000
)

SELECT * FROM cost_under_limit;

#Создание виртульной таблицы

CREATE VIEW cost_under_limit AS
	SELECT * FROM cars
	WHERE cost < 25000;
SELECT * FROM cost_under_limit;

#DROP VIEW cost_under_limit;


#2. Изменить в существующем представлении порог для стоимости:
пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cost_under_limit AS
	SELECT * FROM cars
	WHERE cost < 30000;
SELECT * FROM cost_under_limit;


#3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

#Создание табличного выражения
WITH vag AS
(
	SELECT * FROM cars
	WHERE name = 'Skoda'
	UNION
	SELECT * FROM cars
	WHERE name = 'Audi'
)

WITH vag AS
(
	SELECT * FROM cars
	WHERE name = 'Skoda' or name = 'Audi'
)

SELECT * FROM vag;


#Создание виртульной таблицы

CREATE VIEW vag AS
/*
	SELECT * FROM cars
	WHERE name = 'Skoda' or name = 'Audi'
*/
	SELECT * FROM cars
	WHERE name = 'Skoda'
	UNION
	SELECT * FROM cars
	WHERE name = 'Audi';
SELECT * FROM vag;



#4. Добавить время движения до следующей станции

#Создание таблицы

CREATE TABLE schedule
(
	train_id INT NOT NULL,
	station VARCHAR(20) NOT NULL,
	station_time TIME NOT NULL
);

INSERT INTO schedule
VALUES  (110, 'San Francisco', '10:00:00'),
	(110, 'Redwood City', '10:54:00'),
	(110, 'Palo Alto', '11:02:00'),
	(110, 'San Jose', '12:35:00'),
	(120, 'San Francisco', '11:00:00'),
	(120, 'Palo Alto', '12:49:00'),
	(120, 'San Jose', '13:30:00');

#Решение задачи с нулевым временем

SELECT *,
TIMEDIFF(LEAD (station_time, 1, station_time)
OVER (PARTITION BY train_id), station_time)
AS time_to_next_station_interval 
FROM schedule;

#Решение задачи с пустыми строками

SELECT *,
IFNULL (TIMEDIFF(LEAD (station_time)
OVER (PARTITION BY train_id), station_time), " ")
AS time_to_next_station_interval 
FROM schedule;