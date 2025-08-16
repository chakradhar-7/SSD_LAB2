USE ott_platform;
DROP PROCEDURE IF EXISTS PrintAllWatchHistories;
DELIMITER //
CREATE PROCEDURE PrintAllWatchHistories()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sid INT;
    DECLARE sname VARCHAR(100);
    DECLARE cur CURSOR FOR SELECT SubscriberID, SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    inloop: LOOP
        FETCH cur INTO sid, sname;
        IF done = 1 THEN
            LEAVE inloop;
        END IF;
        CALL GetWatchHistoryBySubscriber(sid);
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;