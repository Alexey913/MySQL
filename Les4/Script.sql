CREATE DATABASE seminar4;
USE seminar4;

CREATE TABLE teacher
(	
	id INT NOT NULL PRIMARY KEY,
    surname VARCHAR(45),
    salary INT
);

INSERT teacher
VALUES
	(1,"Авдеев", 17000),
    (2,"Гущенко",27000),
    (3,"Пчелкин",32000),
    (4,"Питошин",15000),
    (5,"Вебов",45000),
    (6,"Шарпов",30000),
    (7,"Шарпов",40000),
    (8,"Питошин",30000);
    
SELECT * from teacher; 

CREATE TABLE lesson
(	
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(45),
    teacher_id INT,
    FOREIGN KEY (teacher_id)  REFERENCES teacher(id)
);
INSERT INTO lesson(course,teacher_id)
VALUES
	("Знакомство с веб-технологиями",1),
    ("Знакомство с веб-технологиями",2),
    ("Знакомство с языками программирования",3),
    ("Базы данных и SQL",4);
	
#INNER JOIN

SELECT * FROM teacher
    INNER JOIN lesson
    USING (id);
	
#ИЛИ

SELECT * FROM teacher
    INNER JOIN lesson
    ON lesson.id = teacher.id;
	
#С другой таблицей
CREATE TABLE lesson2 SELECT * FROM lesson;

DELETE FROM lesson2
    WHERE id>=3;
	
SELECT * FROM teacher
    INNER JOIN lesson2
    ON lesson2.id = teacher.id;
	
	
	
	
#Создание других таблиц	
	
  -- Создание таблицы с товарами
   CREATE TABLE products (
     product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category INT NULL,
     product_name VARCHAR(100) NOT NULL
   );

   -- Создание таблицы с категориями
   CREATE TABLE categories (
     category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_name VARCHAR(100) NOT NULL
   );

   -- Добавление данных в таблицу с товарами
   INSERT INTO products(category, product_name)
     VALUES (1, 'Системный блок'),
            (1, 'Монитор'),
            (2, 'Холодильник'),
            (2, 'Телевизор'),
            (NULL, 'Операционная система');

   -- Добавление данных в таблицу с категориями
   INSERT INTO categories (category_name)
     VALUES ('Комплектующие компьютера'),
            ('Бытовая техника'),
            ('Мобильные устройства');

   SELECT * FROM products;
   SELECT * FROM categories;
   
   
   
   
# FULL JOIN   
SELECT * FROM products p
LEFT JOIN categories c ON p.category=c.category_id
UNION
SELECT * FROM products p
RIGHT JOIN categories c ON p.category=c.category_id;

# FULL JOIN с UNION ALL
SELECT * FROM products p
LEFT JOIN categories c ON p.category=c.category_id
UNION ALL
SELECT * FROM products p
RIGHT JOIN categories c ON p.category=c.category_id;

# FULL JOIN с UNION ALL, пропуская включение повторов
SELECT * FROM products p
LEFT JOIN categories c ON p.category=c.category_id
UNION ALL
SELECT * FROM products p
RIGHT JOIN categories c ON p.category=c.category_id
WHERE p.category IS NULL;

# LEFT JOIN (вывод всех значений из первой таблицы)
SELECT * FROM teacher
LEFT OUTER JOIN lesson
ON teacher.id = lesson.teacher_id;

# LEFT JOIN (вывод значений из первой таблицы, в которой нет соответствия во второй)
SELECT * FROM teacher
LEFT OUTER JOIN lesson
ON teacher.id = lesson.teacher_id
WHERE lesson.teacher_id IS NULL;

# CROSS JOIN
SELECT * FROM teacher
CROSS JOIN lesson;
