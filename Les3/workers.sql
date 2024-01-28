CREATE TABLE workers
(
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   name VARCHAR(20) NOT NULL,
   surname VARCHAR(20) NOT NULL,
   speciality VARCHAR(20) NOT NULL,
   seniority INT NOT NULL,
   salary INT NOT NULL,
   age INT NOT NULL
);

INSERT workers (name, surname, speciality, seniority, salary, age)
VALUES
   ('Вася', 'Васькин', 'начальник', 40, 100000, 60),
   ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
   ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
   ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
   ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
   ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
   ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
   ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
   ('Юра', 'Юркин', 'рабочий', 2, 11000, 22),
   ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
   ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
   ('Люся', 'Люськина', 'убощик', 10, 10000, 49)
;

#Выведите все записи, отсортированные по полю "age" по возрастанию

SELECT * FROM workers
ORDER BY age ASC;

#Выведите все записи, отсортированные по полю "name"

SELECT * FROM workers
ORDER BY name;

#Выведите записи полей "name", "surname","age", отсортированные по полю "name" в алфавитном порядке по убыванию

SELECT name, surname, age
   FROM workers
   ORDER BY name DESC;

# Выполните сортировку по полям "name" и "age" по убыванию

SELECT name, age
   FROM workers
   ORDER BY name DESC, age DESC;

#Выведите уникальные (неповторяющиеся) значения поля "name"

SELECT DISTINCT name
   FROM workers;

#Выведите первые две первые записи из таблицы

SELECT * FROM workers
   LIMIT 2;

/*
Пропустите первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и извлеките 
следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)
/*

SELECT * FROM workers
   LIMIT 4, 3;

/*
Пропустите две последнии строки (где id=12, id=11) и извлекаются 
следующие за ними 3 строки (где id=10, id=9, id=8)
*/

SELECT * FROM workers
   ORDER BY id DESC
   LIMIT 2, 3;
