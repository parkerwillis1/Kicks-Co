DELIMITER //
CREATE PROCEDURE historybyorderdate()
BEGIN
	SELECT * FROM orders
	WHERE OrderStatus = 0
	ORDER BY OrderDate DESC;
END
//