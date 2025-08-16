USE ott_platform;
DROP PROCEDURE IF EXISTS SendWatchTimeReport;
DELIMITER //
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sid INT;
    DECLARE cur CURSOR FOR 
        SELECT DISTINCT SubscriberID FROM WatchHistory;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur;
    inloop: LOOP
        FETCH cur INTO sid;
        IF done = 1 THEN
            LEAVE inloop;
        END IF;
        CALL GetWatchHistoryBySubscriber(sid);
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;