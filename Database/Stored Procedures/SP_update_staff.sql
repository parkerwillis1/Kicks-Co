DELIMITER //
CREATE PROCEDURE update_staff(IN p_staff_ID INT, IN p_ST_FirstName VARCHAR(45), IN p_ST_LastName VARCHAR(45), IN p_ST_Address VARCHAR(100), IN p_ST_Email VARCHAR(80), IN p_ST_DoB DATE)
BEGIN
	Update staff
	SET ST_FirstName = COALESCE(p_ST_FirstName, ST_FirstName),
		ST_LastName = COALESCE(p_ST_LastName, ST_LastName),
        ST_Address = COALESCE(p_ST_Address,ST_Address),
        ST_Email = COALESCE(p_ST_Email,ST_Email),
        ST_DoB = COALESCE(p_ST_DoB,ST_DoB)
	WHERE staff_ID = p_staff_ID;
END
//