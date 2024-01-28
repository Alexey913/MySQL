USE seminar3;

CREATE TABLE staff
(
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   name VARCHAR(10) NOT NULL,
   age INT NOT NULL,
   salary INT NOT NULL
);

INSERT staff (name, age, salary)
VALUES
   ('Дима', 23, 100),
   ('Петя', 23, 200),
   ('Вася', 23, 300),
   ('Коля', 24, 1000),
   ('Иван', 24, 2000)
;


/*
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 
года и 25 лет). Для каждой группы найдите суммарную 
зарплату
*/
SELECT age, SUM(salary) AS sum_salary
FROM staff
GROUP BY age;

/*
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 
года и 25 лет). Найдите максимальную заработную плату 
внутри группы
*/
SELECT age, MAX(salary) AS max_salary
FROM staff
GROUP by age;

/*
Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 
года и 25 лет). Найдите минимальную заработную плату 
внутри группы
*/
SELECT age, MIN(salary) AS min_salary
FROM staff
GROUP by age;

/*
Выведите только те строки, в которых суммарная зарплата больше 
или равна 1000
*/
SELECT age, SUM(salary) AS sum_salary
FROM staff
GROUP by age
HAVING sum_salary >= 1000;

/*
Выведите только те группы, в которых количество строк меньше или 
равно двум
*/
SELECT age, COUNT(*) AS all_count
FROM staff
GROUP by age
HAVING all_count <= 2;

/*
Выведите только те группы, в которых количество строк меньше или 
равно двум. Для решения используйте оператор “BETWEEN”
*/
SELECT age, COUNT(*) AS all_count
FROM staff
GROUP by age
HAVING all_count BETWEEN 1 AND 2;

/*
Выведите только те группы, в которых количество строк меньше или 
равно двум. Для решения используйте оператор “IN”
*/
SELECT age, COUNT(*) AS all_count
FROM staff
GROUP by age
HAVING all_count IN (0, 1, 2);