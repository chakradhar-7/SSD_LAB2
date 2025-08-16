USE ott_platform;
DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;
DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT Shows.Title, WatchHistory.WatchTime
    FROM WatchHistory
    JOIN Shows ON WatchHistory.ShowID = Shows.ShowID
    WHERE WatchHistory.SubscriberID = sub_id;
END //
DELIMITER ;