DELIMITER //
CREATE PROCEDURE historybycustomer()
BEGIN
	SELECT * FROM orders
	WHERE OrderStatus = 0
	ORDER BY customers_cust_ID;
END
//