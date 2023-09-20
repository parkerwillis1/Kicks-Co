DELIMITER //
CREATE PROCEDURE update_orders(IN p_order_ID INT, IN p_OrderDate DATETIME,
							IN p_OrderStatus INT, p_Units INT, IN p_TotalAmount FLOAT, 
                            IN p_Inventory_inv_ID INT, p_staff_staff_ID INT,
                            IN p_customers_cust_ID INT, IN p_discounts_discounts_ID INT)
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	Update orders
	SET OrderDate = COALESCE(p_OrderDate,OrderDate),
        OrderStatus = COALESCE(p_OrderStatus,OrderStatus),
        Units = COALESCE(p_Units, Units),
        TotalAmount = COALESCE(p_TotalAmount,TotalAmount),
        Inventory_inv_ID = COALESCE(p_Inventory_inv_ID,Inventory_inv_ID),
        staff_staff_ID = COALESCE(p_staff_staff_ID,staff_staff_ID),
        customers_cust_ID = COALESCE(p_customers_cust_ID,customers_cust_ID),
        discounts_discounts_ID = COALESCE(p_discounts_discounts_ID,discounts_discounts_ID)
	WHERE order_ID = p_order_ID;
    SET FOREIGN_KEY_CHECKS=1;
END
//