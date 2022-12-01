DELIMITER $$

CREATE FUNCTION VERIFY_TICKET_STATUS(USER_ID VARCHAR
(20), TDATE DATE) RETURNS VARCHAR(20) DETERMINISTIC 
BEGIN 
	DECLARE rt_value varchar(100);
	
	DECLARE cnt int;
	
	SET cnt = (
	        SELECT COUNT(*)
	        FROM Ticket t
	        where
	            t.Passenger_id = user_id
	            and month(t.Travel_date) = month(tdate)
	    );
	
	if cnt > 3 THEN
	SET
	    rt_value = "Cannot purchase tickets, current limit is over.";
	
	ELSE
	SET
	    rt_value = "Can purchase tickets";
	
	END IF;
	
	RETURN rt_value;
END; 

$$ 

DELIMITER ;

SELECT
    DISTINCT(p.User_ID),
    verify_ticket_status(p.User_ID, t.Travel_date)
from passenger AS p
    left outer join Ticket as t on p.User_ID = t.Passenger_id;