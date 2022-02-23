DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `greeklish`(input text charset utf8) RETURNS text CHARSET utf8
BEGIN

  DECLARE result text charset utf8 DEFAULT '';
  DECLARE len INT(4) DEFAULT 0;
  DECLARE pos INT(4) DEFAULT 1;
  DECLARE letter VARCHAR(10) charset utf8;
  SET input = LOWER(input);
  SET len = CHAR_LENGTH(input);
  SET input = REPLACE(input, "ου", 'u');
  SET input = REPLACE(input, "ού", 'i');
  SET input = REPLACE(input, "αι", 'e');
  SET input = REPLACE(input, "αί", 'i');
  SET input = REPLACE(input, "οί", 'i');
  SET input = REPLACE(input, "υι", 'i');
  SET input = REPLACE(input, "υί", 'i');
  SET input = REPLACE(input, "οι", 'i');
  SET input = REPLACE(input, "ει", 'i');
  SET input = REPLACE(input, "εί", 'i');
  SET input = REPLACE(input, "γκ", 'g');
  SET input = REPLACE(input, "γγ", 'g');
  SET input = REPLACE(input, "γυ", 'y');
  SET input = REPLACE(input, "γι", 'y');
  SET input = REPLACE(input, "ντ", 'd');
  SET input = REPLACE(input, "μπ", 'b');
  
  SET input = REPLACE(input, "αυ", 'af');
  SET input = REPLACE(input, "αύ", 'af');
  SET input = REPLACE(input, "ευ", 'ef');
  SET input = REPLACE(input, "εύ", 'ef');
  
  WHILE (pos <= len) DO
    SET letter = SUBSTRING(input, pos, 1);
	
    CASE TRUE

      WHEN letter IN('α','ά') THEN SET letter = 'a';
	  WHEN letter IN('ε','έ') THEN SET letter = 'e';
	  WHEN letter IN('ο', 'ό', 'ω','ώ') THEN SET letter = 'o';
	  WHEN letter IN('ί','ι','ϊ','ΐ','η', 'ή', 'υ','ύ','ϋ','ΰ') THEN SET letter = 'i';
      WHEN letter = 'β' THEN SET letter = 'b';
      WHEN letter = 'γ' THEN SET letter = 'g';
      WHEN letter = 'δ' THEN SET letter = 'd';
     
      WHEN letter = 'ζ' THEN SET letter = 'z';
     
      WHEN letter = 'θ' THEN SET letter = 'th';
      
      WHEN letter = 'κ' THEN SET letter = 'k';
      WHEN letter = 'λ' THEN SET letter = 'l';
      WHEN letter = 'μ' THEN SET letter = 'm';
      WHEN letter = 'ν' THEN SET letter = 'n';
      WHEN letter = 'ξ' THEN SET letter = 'x';

      WHEN letter = 'π' THEN SET letter = 'p';
      WHEN letter = 'ρ' THEN SET letter = 'r';
      WHEN letter IN('σ', 'ς') THEN SET letter = 's';
      WHEN letter = 'τ' THEN SET letter = 't';
      WHEN letter = 'φ' THEN SET letter = 'f';
      WHEN letter = 'χ' THEN SET letter = 'ch';
      WHEN letter = 'ψ' THEN SET letter = 'ps';

      ELSE
	SET letter = letter;

    END CASE;

    SET result = CONCAT(result, letter);
    SET pos = pos + 1;
  END WHILE;

  RETURN result;

END$$
DELIMITER ;
