delimiter $$

CREATE PROCEDURE CALC_AGE(IN USID VARCHAR(100), OUT 
MSG VARCHAR(100)) BEGIN 
	declare new_age int;
	
	declare val int;
	
	set new_age = (
	        select
	            year(curdate()) - year(DOB)
	        from passenger
	        where User_ID = usid
	    );
	
	set val = (
	        select age
	        from passenger
	        where User_ID = usid
	    );
	
	if val = 0 then
	update passenger
	set age = new_age
	where user_id = usid;
	
	set
	    msg = concat(
	        "Age of the user is: ",
	        new_age
	    );
	
	else
	set
	    msg = concat("Age already calculated");
	
	end if;
END; 

$$ 

delimiter ;

update passenger
set age = 0
where User_ID = 'ADM_001';

call calc_age('ADM_001', @m);

SELECT @m;