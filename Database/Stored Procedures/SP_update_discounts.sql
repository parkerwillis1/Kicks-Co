DELIMITER //
CREATE PROCEDURE update_discounts(IN p_discounts_ID INT, IN p_Name VARCHAR(8), IN p_Percentage FLOAT)
BEGIN
	Update discounts
	SET Percentage = COALESCE(p_Percentage, Percentage),
		Name = COALESCE(p_Name, Name)
	WHERE discounts_ID = p_discounts_ID;
END
//