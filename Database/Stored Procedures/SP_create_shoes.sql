DELIMITER //
CREATE PROCEDURE create_shoes(IN p_Name VARCHAR(80), IN p_Brand VARCHAR(25), IN p_Size INT,
							IN p_Color VARCHAR(15), IN p_Price FLOAT, IN p_Image BLOB)
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	INSERT INTO shoes(Name, Brand, Size, Color, Price, Image) values(p_Name, p_Brand, p_Size, p_Color, p_price, p_Image);
    SET FOREIGN_KEY_CHECKS=1;
END
//