DELIMITER //
CREATE PROCEDURE historybydollaramount()
BEGIN
	SELECT * FROM orders
	WHERE OrderStatus = 0
	ORDER BY TotalAmount DESC;
END
//