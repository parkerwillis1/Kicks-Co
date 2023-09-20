DELIMITER //
CREATE PROCEDURE update_inventory(IN p_inv_ID INT, IN p_SaleStatus INT,
							IN p_Quantity INT, IN p_Shoes_shoes_ID INT)
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	Update inventory
	SET SaleStatus = COALESCE(p_SaleStatus,SaleStatus),
        Quantity = COALESCE(p_Quantity,Quantity),
        Shoes_shoes_ID = COALESCE(p_Shoes_shoes_ID,Shoes_shoes_ID)
	WHERE inv_ID = p_inv_ID;
    SET FOREIGN_KEY_CHECKS=1;
END
//