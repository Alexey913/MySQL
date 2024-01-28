DROP DATABASE IF EXISTS homework6;
CREATE DATABASE homework6;
USE homework6;

#Создаем таблицу users

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

INSERT INTO users (id, firstname, lastname, email) VALUES 
(1, 'Reuben', 'Nienow', 'arlo50@example.org'),
(2, 'Frederik', 'Upton', 'terrence.cartwright@example.org'),
(3, 'Unique', 'Windler', 'rupert55@example.org'),
(4, 'Norene', 'West', 'rebekah29@example.net'),
(5, 'Frederick', 'Effertz', 'von.bridget@example.net'),
(6, 'Victoria', 'Medhurst', 'sstehr@example.net'),
(7, 'Austyn', 'Braun', 'itzel.beahan@example.com'),
(8, 'Jaida', 'Kilback', 'johnathan.wisozk@example.com'),
(9, 'Mireya', 'Orn', 'missouri87@example.org'),
(10, 'Jordyn', 'Jerde', 'edach@example.com');

/*
Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с 
помощью которой можно переместить любого (одного) пользователя из таблицы 
users в таблицу users_old. (использование транзакции с выбором commit или rollback
– обязательно).
*/
#Создаем таблицу user_old

CREATE TABLE user_old LIKE users;

#Процедура перемещения

DROP PROCEDURE IF EXISTS replace_user;
DELIMITER //
CREATE PROCEDURE replace_user (for_user_id INT)
	BEGIN
		START TRANSACTION;
			INSERT INTO user_old SELECT * FROM users WHERE id = for_user_id;
			DELETE FROM users WHERE id = for_user_id;
			IF ((SELECT COUNT(for_user_id) FROM user_old) = 0)
				THEN ROLLBACK;
				ELSE COMMIT;
			END IF;
	END//
DELIMITER ;

CALL replace_users(4);
CALL replace_users(7);

/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в 
зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй 
ночи".
*/

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello (cur_time TIME)
RETURNS VARCHAR(20)
LANGUAGE SQL DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
BEGIN
	DECLARE println VARCHAR(20);
	DECLARE hours INT;
	SET hours = HOUR(cur_time);
	CASE
		WHEN hours BETWEEN 6 AND 11 THEN
			SET println = 'Доброе утро';
		WHEN hours BETWEEN 12 AND 17 THEN
			SET println = 'Добрый день';
		WHEN hours BETWEEN 18 AND 23 THEN
			SET println = 'Добрый вечер';
		ELSE
			SET println = 'Доброй ночи';
	END CASE;
	
	RETURN println;

END//
DELIMITER ;

SELECT hello('10:00:00');
SELECT hello('14:00:00');
SELECT hello('19:00:00');
SELECT hello('02:00:00');
SELECT hello(CURTIME());