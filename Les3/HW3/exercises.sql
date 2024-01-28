USE homework3;

# 1. Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания

# таблица целиком по возрастанию
SELECT * FROM staff
ORDER BY salary;

# только имя, фамилия и зарплата по возрастанию
SELECT name, surname, salary
FROM staff
ORDER BY salary ASC;

# только фамилия, специальность и зарплата по убыванию
SELECT surname, speciality, salary
FROM staff
ORDER BY salary DESC;

# 2. Выведите 5 максимальных зарплат (salary)

SELECT name, surname, salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

# 3. Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)

SELECT speciality, SUM(salary) AS sum_salary
FROM staff
GROUP BY speciality;

# 4. Найти количество сотрудников по специальности “Рабочий” (speciality) в
возрасте от 24 до 42 лет.

#Способ 1
SELECT speciality, COUNT(*) AS count_of_staff
FROM staff
WHERE (speciality = 'рабочий') AND (age BETWEEN 24 AND 42);

#Способ 2
SELECT speciality, COUNT(*) AS count_of_staff
FROM staff
WHERE age BETWEEN 24 AND 42
GROUP BY speciality
HAVING speciality = 'рабочий';

# 5. Найти количество специальностей

SELECT COUNT(DISTINCT speciality) AS count_of_speciality
FROM staff;

6. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет

SELECT speciality, AVG(age) AS average_age
FROM staff
GROUP BY speciality
HAVING AVG(age) < 44;