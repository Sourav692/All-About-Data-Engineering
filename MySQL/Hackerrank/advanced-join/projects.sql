-- Projects
-- https://www.hackerrank.com/challenges/projects/problem

set @row1:=0; set @row2:=0; 
select p_start.start_date,p_end.end_date 
from (select @row1:=@row1+1 as rown, start_date from projects where start_date not in (select end_date from projects)) as p_start 
inner join 
(select @row2:=@row2+1 as rown, end_date from projects where end_date 
not in (select start_date from projects)) as p_end on p_start.rown=p_end.rown order by p_end.end_date-p_start.start_date,p_start.start_date;



1 		2015-10-01 		2015-10-02
24 		2015-10-02 		2015-10-03
2 		2015-10-03 		2015-10-04
23 		2015-10-04 		2015-10-05
3 		2015-10-11 		2015-10-12
22 		2015-10-12 		2015-10-13
4 		2015-10-15 		2015-10-16
21 		2015-10-17 		2015-10-18
5 		2015-10-19 		2015-10-20
20 		2015-10-21 		2015-10-22
6 		2015-10-25 		2015-10-26
19 		2015-10-26 		2015-10-27
7 		2015-10-27 		2015-10-28
18 		2015-10-28 		2015-10-29
8 		2015-10-29 		2015-10-30
17 		2015-10-30 		2015-10-31
9 		2015-11-01 		2015-11-02
16 		2015-11-04 		2015-11-05
11 		2015-11-05 		2015-11-06
15 		2015-11-06 		2015-11-07
10 		2015-11-07 		2015-11-08
14 		2015-11-11 		2015-11-12
12 		2015-11-12 		2015-11-13
13 		2015-11-17 		2015-11-18
