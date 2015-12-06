drop trigger if exists check_account_creation;
DELIMITER %%;
CREATE TRIGGER check_account_creation
BEFORE INSERT ON USER
FOR EACH ROW
BEGIN 
	IF CHAR_LENGTH(NEW.USERNAME) < 6
	THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Username must be at least 6 characters';
	END IF;
	
	IF CHAR_LENGTH(NEW.PASSWORD) < 8
	THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Password must be at least 8 characters';
	END IF;
	
	IF CHAR_LENGTH(NEW.FIRSTNAME) < 1
	THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'First name cannot be empty';
	END IF;
	
	IF CHAR_LENGTH(NEW.LASTNAME) < 1
	THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Last name cannot be empty';
	END IF;
    
    IF NEW.AGE < 18
    THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Must be at least 18 years of age';
    END IF;
    
    IF CHAR_LENGTH(NEW.QUESTION) < 10
    THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Question must be at least 10 characters';
    END IF;
    
    IF CHAR_LENGTH(NEW.ANSWER) < 5
    THEN SIGNAL SQLSTATE '10000' SET MESSAGE_TEXT = 'Answer must be at least 5 characters';
    END IF;
END; 