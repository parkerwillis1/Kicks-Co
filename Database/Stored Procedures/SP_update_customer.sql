DELIMITER //
CREATE PROCEDURE update_customer(IN p_cust_ID INT, IN p_C_FirstName VARCHAR(45),
								IN p_C_LastName VARCHAR(45), IN p_C_Address VARCHAR(100),
								IN p_C_Email VARCHAR(80), IN p_C_DoB DATE)
BEGIN
	Update customers
	SET C_FirstName = COALESCE(p_C_FirstName, C_FirstName),
		C_LastName = COALESCE(p_C_LastName, C_LastName),
        C_Address = COALESCE(p_C_Address, C_Address),
        C_Email = COALESCE(p_C_Email, C_Email),
        C_DoB = COALESCE(p_C_DoB, C_DoB)
	WHERE cust_ID = p_cust_ID;
END
//