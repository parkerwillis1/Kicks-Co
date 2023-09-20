DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `orderhistorybydollaramount`(
in amount float)
BEGIN
select *
from orders
where TotalAmount >= amount
order by orderdate desc;
END$$
DELIMITER ;
