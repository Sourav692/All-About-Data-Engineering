SELECT STR_TO_DATE('21,5,2013','%d,%m,%Y');

-- The STR_TO_DATE() function ignores extra characters at the end of the input string when it parses the input string based on the format string. See the following example:
SELECT STR_TO_DATE('21,5,2013 extra characters','%d,%m,%Y');

-- The STR_TO_DATE() sets all incomplete date values, which are not provided by the input string, to zero. See the following example:
SELECT STR_TO_DATE('2013','%Y');

-- The following example converts a time string into a TIME value:
SELECT STR_TO_DATE('113005','%h%i%s');

-- Similar to the unspecified date part, the STR_TO_DATE() function sets unspecified time part to zero, see the following example:
SELECT STR_TO_DATE('11','%h');

-- The following example converts the string into a DATETIME value because the input string provides both date and time parts.
SELECT STR_TO_DATE('20130101 1130','%Y%m%d %h%i') ;


