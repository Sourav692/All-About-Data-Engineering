-- Symmetric Pairs
-- https://www.hackerrank.com/challenges/symmetric-pairs/problem

select x, y from functions f1 
    where exists(select * from functions f2 where f2.y=f1.x 
    and f2.x=f1.y and f2.x>f1.x) and (x!=y) 
union 
select x, y from functions f1 where x=y and 
    ((select count(*) from functions where x=f1.x and y=f1.x)>1)    
        order by x;
		
===
SELECT f1.X, f1.Y FROM Functions f1
INNER JOIN Functions f2 ON f1.X=f2.Y AND f1.Y=f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X 