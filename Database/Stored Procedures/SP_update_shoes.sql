DELIMITER //
CREATE PROCEDURE update_shoes(IN p_shoes_ID INT, IN p_Name VARCHAR(80),
							IN p_Brand VARCHAR(25), IN p_Size INT, 
                            IN p_Color VARCHAR(15), IN p_Price FLOAT, IN p_Image BLOB)
BEGIN
	Update shoes
	SET Name = COALESCE(p_Name, Name),
        Brand = COALESCE(p_Brand, Brand),
        Size = COALESCE(p_Size, Size),
        Color = COALESCE(p_Color, Color),
        Price = COALESCE(p_Price, Price),
        Image = COALESCE(p_Image, Image)
	WHERE shoes_ID = p_shoes_ID;
END
//