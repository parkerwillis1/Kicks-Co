DELIMITER //
Create PROCEDURE create_discount(IN p_Name VARCHAR(8), IN p_Percentage float)
BEGIN
	INSERT INTO discounts(Name, Percentage) values (p_Name, p_Percentage);
END
//