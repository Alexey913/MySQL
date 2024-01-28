CREATE DATABASE homework4;
USE homework4;

#Создание таблицы Задания 1

CREATE TABLE shops (
    id INT PRIMARY KEY,
    shopname VARCHAR (100)
);

CREATE TABLE cats (
	name VARCHAR (100),
	id INT PRIMARY KEY,
	shops_id INT,
	FOREIGN KEY (shops_id)
        	REFERENCES shops(id)
);

#Внесение данных в таблицы Задания 1

INSERT INTO shops
VALUES 
	(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO cats
VALUES 
	("Murzik",1,1),
	("Nemo",2,2),
	("Vicont",3,1),
	("Zuza",4,3);

#Задание 1.1 Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT * FROM cats
INNER JOIN shops
ON shops.id = cats.shops_id;

/*
Также задание 1.1 для данного случая можно выполнить способом ниже
т.к. в таблицах совпадает количество строк и наличие ключей,
соответственно, NULL-ов не будет
*/
SELECT * FROM cats
LEFT JOIN shops
ON shops.id = cats.shops_id;

#Задание 1.2 Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

#Способ 1 - с использованием INNER JOIN

SELECT shops.shopname, cats.name FROM shops
INNER JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name = 'Murzik';

#Способ 2  - с использованием INNER JOIN и оператора равенства

SELECT * FROM shops
INNER JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name = 'Murzik';

#Способ 3  - с использованием LEFT JOIN и IN

SELECT * FROM shops
LEFT JOIN cats
ON shops.id = cats.shops_id
WHERE 'Murzik' IN (SELECT cats.name);

#Способ 4 - с использование EXIST

SELECT * FROM shops 
WHERE EXISTS
(SELECT * FROM cats
WHERE shops.id = cats.shops_id AND name = 'Murzik'
);

#Способ 5 - с использование CROSS JOIN

SELECT shops.shopname, cats.name FROM shops
CROSS JOIN cats
WHERE cats.name = 'Murzik' AND shops.id = cats.shops_id;

#Задание 1.3 Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”

#Способ 1 - с использованием INNER JOIN и IN

SELECT shops.shopname, cats.name FROM shops
INNER JOIN cats
ON shops.id = cats.shops_id
WHERE name NOT IN ('Murzik', 'Zuza');

#Способ 2 - с использованием INNER JOIN и оператора неравенства

SELECT shops.shopname, cats.name FROM shops
INNER JOIN cats
ON shops.id = cats.shops_id
WHERE cats.name != 'Murzik' AND cats.name != 'Zuza';

#Способ 3 - FULL JOIN

SELECT shopname FROM shops
LEFT JOIN cats
ON shops.id = cats.shops_id
WHERE name NOT IN ('Murzik', 'Zuza')
UNION
SELECT shopname FROM shops
RIGHT JOIN cats
ON shops.id = cats.shops_id
WHERE name NOT IN ('Murzik', 'Zuza');

#Задание 2

#Создание таблиц и их заполнение

DROP TABLE IF EXISTS analysis;

CREATE TABLE analysis
(
	an_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	an_name varchar(50),
	an_cost INT,
	an_price INT,
	an_group INT
);

INSERT INTO analysis (an_name, an_cost, an_price, an_group)
VALUES 
	('Общий анализ крови', 30, 50, 1),
	('Биохимия крови', 150, 210, 1),
	('Анализ крови на глюкозу', 110, 130, 1),
	('Общий анализ мочи', 25, 40, 2),
	('Общий анализ кала', 35, 50, 2),
	('Общий анализ мочи', 25, 40, 2),
	('Тест на COVID-19', 160, 210, 3);

DROP TABLE IF EXISTS groupsan;

CREATE TABLE groupsan
(
	gr_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	gr_name varchar(50),
	gr_temp FLOAT(5,1),
	FOREIGN KEY (gr_id) REFERENCES Analysis (an_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO groupsan (gr_name, gr_temp)
VALUES 
	('Анализы крови', -12.2),
	('Общие анализы', -20.0),
	('ПЦР-диагностика', -20.5);

SELECT * FROM groupsan;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	ord_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	ord_datetime DATETIME,	-- 'YYYY-MM-DD hh:mm:ss'
	ord_an INT,
	FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO orders (ord_datetime, ord_an)
VALUES 
	('2020-02-04 07:15:25', 1),
	('2020-02-04 07:20:50', 2),
	('2020-02-04 07:30:04', 1),
	('2020-02-04 07:40:57', 1),
	('2020-02-05 07:05:14', 1),
	('2020-02-05 07:15:15', 3),
	('2020-02-05 07:30:49', 3),
	('2020-02-06 07:10:10', 2),
	('2020-02-06 07:20:38', 2),
	('2020-02-07 07:05:09', 1),
	('2020-02-07 07:10:54', 1),
	('2020-02-07 07:15:25', 1),
	('2020-02-08 07:05:44', 1),
	('2020-02-08 07:10:39', 2),
	('2020-02-08 07:20:36', 1),
	('2020-02-08 07:25:26', 3),
	('2020-02-09 07:05:06', 1),
	('2020-02-09 07:10:34', 1),
	('2020-02-09 07:20:19', 2),
	('2020-02-10 07:05:55', 3),
	('2020-02-10 07:15:08', 3),
	('2020-02-10 07:25:07', 1),
	('2020-02-11 07:05:33', 1),
	('2020-02-11 07:10:32', 2),
	('2020-02-11 07:20:17', 3),
	('2020-02-12 07:05:36', 1),
	('2020-02-12 07:10:54', 2),
	('2020-02-12 07:20:19', 3),
	('2020-02-12 07:35:38', 1);

# 2. Вывести всю информацию об анализах, которые продавались 5 февраля 2020 и всю следующую неделю.
# Вывод всей информация об анализах с 05.02.2020 в течение недели
SELECT * FROM orders
INNER JOIN analysis
ON analysis.an_id = orders.ord_an
INNER JOIN groupsan
ON analysis.an_group = groupsan.gr_id
WHERE ord_datetime BETWEEN '2020-02-05 00:00:00' AND '2020-02-11 23:59:59';


# 2. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю
# Вывод названия, ценф и группы анализа (по презентации без группы, добавил для сравнения)
SELECT DISTINCT(an_id), an_name, an_price, gr_name FROM analysis
INNER JOIN orders
ON analysis.an_id = orders.ord_an
INNER JOIN groupsan
ON analysis.an_group = groupsan.gr_id
WHERE ord_datetime BETWEEN '2020-02-05 00:00:00' AND '2020-02-11 23:59:59';








# Вывод основных данных об анализах с 05.02.2020 в течение недели
SELECT ord_id, an_name, an_price, gr_name, gr_temp, ord_datetime FROM orders
INNER JOIN analysis
ON analysis.an_id = orders.ord_an
INNER JOIN groupsan
ON analysis.an_group = groupsan.gr_id
WHERE ord_datetime BETWEEN '2020-02-05 00:00:00' AND '2020-02-11 23:59:59'
ORDER BY ord_id ASC;