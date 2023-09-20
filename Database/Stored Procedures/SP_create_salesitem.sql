DELIMITER //
CREATE PROCEDURE create_salesitem(IN p_Quantity int, IN p_Shoes_shoes_ID int)
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	INSERT INTO inventory(SaleStatus, Quantity, Shoes_shoes_ID) values (1, p_Quantity, p_Shoes_shoes_ID);
    SET FOREIGN_KEY_CHECKS=1;
END
//