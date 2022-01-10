SELECT count(*) FROM products;
SELECT * FROM products;

-- The PARTITION BY clause breaks the rows into smaller sets. The expression can be any valid expression that would be used in the GROUP BY clause. It’s possible to use multiple expressions separated by a comma (,).

-- The PARTITION BY clause is optional. If you omit it, the entire result set is considered a partition. However, when you use the PARTITION BY clause, each partition can be also considered as a window. 
SELECT 
	row_number() OVER(
		ORDER BY productLine ) row_num,
	productLine,
    msrp
FROM
	products
order by
	productLine;
    
-- Row_num with Partition By Clause
SELECT 
	productName,
    productLine,
	row_number() OVER(
		  PARTITION BY productLine ORDER BY productName) row_num,	
    msrp
FROM
	products
order by
	productLine;

-- 2) Finding top N rows of every group
-- The following statement uses the ROW_NUMBER() to find the top three products by product line that have the highest inventory:
SELECT 
   productLine,
   productName,
   quantityInStock
FROM
	(SELECT
		productLine,
       productName,
       quantityInStock,
       ROW_NUMBER() OVER (
          PARTITION BY productLine 
          ORDER BY quantityInStock DESC) row_num
	 FROM 
       products) inventory where row_num <= 3;

-- 3) Removing duplicate rows

