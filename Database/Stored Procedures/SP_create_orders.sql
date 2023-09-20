DELIMITER //
CREATE PROCEDURE create_orders(IN p_OrderDate DATETIME, IN p_Units INT, IN p_TotalAmount FLOAT,
							IN p_Inventory_inv_ID INT, IN p_staff_staff_ID INT, 
							IN p_customers_cust_ID INT, IN p_discounts_discounts_ID INT)
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	INSERT INTO orders(OrderDate, OrderStatus, Units, TotalAmount, Inventory_inv_ID, staff_staff_ID, customers_cust_ID, discounts_discounts_ID)
		values(p_OrderDate, 0, p_Units, p_TotalAmount, p_Inventory_inv_ID, p_staff_staff_ID, p_customers_cust_ID, p_discounts_discounts_ID);
    SET FOREIGN_KEY_CHECKS=1;
END
//