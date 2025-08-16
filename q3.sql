USE ott_platform;
DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;
DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE subcount INT;
    DECLARE nid INT;
    SELECT COUNT(*) INTO subcount 
    FROM Subscribers 
    WHERE SubscriberName = subName;
    IF subcount = 0 THEN
        SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO nid FROM Subscribers;
        INSERT INTO Subscribers (SubscriberID, SubscriberName, SubscriptionDate)
        VALUES (nid, subName, CURDATE());
    END IF;
END //
DELIMITER ;