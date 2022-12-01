/create trigger/
DELIMITER $$
CREATE TRIGGER before_update_Accessories
BEFORE INSERT ON compartment
FOR EACH ROW BEGIN
DECLARE error_msg VARCHAR(255) ;
DECLARE countComp int;
SET countComp= (SELECT count(Train_No) FROM compartment WHERE Train_No=NEW.Train_No GROUP BY Train_No);
SET error_msg =(
        'The new compartment cannot be inserted as it compartment number exceeds 4 for the train'
    ) ; IF countComp >=4 THEN  SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = error_msg ;
END IF;
END $$
DELIMITER ;
-- to verify see compartment count of train 25261, gives 4 --
SELECT count(Train_No) FROM compartment WHERE Train_No="KAR04" GROUP BY Train_No;
-- to verify try inserting in compartment table for train 25261, gives error --
INSERT INTO compartment(Compartment_No,Compartment_Type,Capacity,Availability,Train_No) VALUES ('C7','CT5',25,"YES","KAR04");
-- to verify try inserting in compartment table for train 25260, inserts entry --
INSERT INTO compartment(Compartment_No,Compartment_Type,Capacity,Availability,Train_No) VALUES ('C8','CT3',22,"YES","KAR02");




CREATE TABLE backupPay LIKE payment_info;
DELIMITER $$
CREATE TRIGGER backupUpdate
     BEFORE DELETE ON ticket
     FOR EACH ROW
     BEGIN
     INSERT INTO backupPay
	SELECT * FROM payment_info
	WHERE payment_info.PNR=OLD.PNR;
END $$
DELIMITER ;
-- try deleting from ticket --
DELETE FROM ticket WHERE PNR='PNR001';
-- check backup table --
SELECT * FROM BACKUPPAY;