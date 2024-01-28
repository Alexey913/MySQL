USE homework3;

CREATE TABLE staff
(
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   name VARCHAR(20) NOT NULL,
   surname VARCHAR(20) NOT NULL,
   speciality VARCHAR(20) NOT NULL,
   seniority INT NOT NULL,
   salary INT NOT NULL,
   age INT NOT NULL
);

INSERT staff (name, surname, speciality, seniority, salary, age)
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