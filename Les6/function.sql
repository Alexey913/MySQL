/*
Решение 2. Создание функции, вычисляющей коэффициент популярности 
пользователя (по заявкам на дружбу – таблица friend_requests)
*/

DROP FUNCTION IF EXISTS friendship;
DELIMITER //
CREATE FUNCTION friendship(user_id INT)
RETURNS FLOAT READS SQL DATA
BEGIN
	DECLARE inbox INT;
	DECLARE outbox INT;
	
	SET inbox = (SELECT COUNT(*) FROM friend_requests
	WHERE target_user_id = user_id);
	
	SET outbox = (SELECT COUNT(*) FROM friend_requests
	WHERE initiator_user_id = user_id);
	
	RETURN outbox / inbox;

END//
DELIMITER ;

SELECT friendship(1);