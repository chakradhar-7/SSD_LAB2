USE ott_platform;
DROP PROCEDURE IF EXISTS ListAllSubscribers;
DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE currentsubscriber VARCHAR(100);
    DECLARE cur CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    CREATE TEMPORARY TABLE IF NOT EXISTS TempSubscribers (
        name VARCHAR(100)
    );
    TRUNCATE TABLE TempSubscribers;
    OPEN cur;
    sub_loop: LOOP
        FETCH cur INTO currentsubscriber;
        IF finished = 1 THEN
            LEAVE sub_loop;
        END IF;
        INSERT INTO TempSubscribers VALUES (currentsubscriber);
    END LOOP;
    CLOSE cur;
    SELECT name AS SubscriberName FROM TempSubscribers;
END //
DELIMITER ;