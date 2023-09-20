DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `orderhistoryafterdate`(
	in date date
 )
BEGIN
	SELECT *
	FROM orders
	WHERE date(OrderDate) >= date
	ORDER BY OrderDate DESC;
END$$
DELIMITER ;
