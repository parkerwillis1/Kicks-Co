CREATE DEFINER=`root`@`localhost` PROCEDURE `currentlyplacedorders`()
BEGIN
	SELECT * FROM orders
	WHERE OrderStatus = 1;
END