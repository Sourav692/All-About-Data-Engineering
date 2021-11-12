SHOW CHARACTER SET;

-- To get the length of a string measured in bytes, you use the LENGTH  function as follows:
-- LENGTH(str);

-- You use the CHAR_LENGTH  function to get the length of a string measured in characters as follows:
-- CHAR_LENGTH(str);

SET @s = CONVERT('MySQL String Length' USING ucs2);
SELECT CHAR_LENGTH(@s), LENGTH(@s);

-- How it works.
-- First, we convert the MySQL String Length  string into ucs2 character set, which is UCS-2  Unicode that holds 2-byte characters.
-- Second, we use the CHAR_LENGTH and LENGTH functions to get the length of the @s  string in bytes and in characters. 
-- Because the @s  string contains 2-byte characters, its length in character is 19, while its length in bytes is 38.

-- The following statements demonstrate how the LENGTH and CHAR_LENGTH functions that work with 1-byte characters:
SET @s = CONVERT('MySQL string length' USING latin1);
SELECT LENGTH(@s), CHAR_LENGTH(@s);

-- Notice that some character sets hold characters whose number of bytes can be varied e.g., for the utf8 character set:
SET @s = CONVERT('MySQL String Length' USING utf8);
SELECT CHAR_LENGTH(@s), LENGTH(@s);

SET @s = CONVERT('á' USING utf8);
SELECT CHAR_LENGTH(@s), LENGTH(@s);

-- An application of MySQL string length functions
CREATE TABLE posts(
  postid int auto_increment primary key,
  title varchar(255) NOT NULL,
  excerpt varchar(255) NOT NULL,
  content text,
  pubdate datetime
)Engine=InnoDB;

INSERT INTO posts(title,excerpt,content)
VALUES('MySQL Length','MySQL string length function tutorial','dummy'),
      ('Second blog post','Second blog post','dummy');

SELECT postid,
       title,
       IF(CHAR_LENGTH(excerpt) > 20,
          CONCAT(LEFT(excerpt,20), '...'),
          excerpt) summary
FROM posts;





