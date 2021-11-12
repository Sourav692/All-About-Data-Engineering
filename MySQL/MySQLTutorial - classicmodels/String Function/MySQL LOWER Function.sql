-- The LOWER() function is not effective -- when applied to the binary string data such as BINARY, VARBINARY, and BLOB. Therefore, before passing this data to the LOWER() function, you need to convert the string to nonbinary string.

SET @str = BINARY 'BINARY STRING';
SELECT LOWER(@str), LOWER(CONVERT(@str USING utf8mb4));