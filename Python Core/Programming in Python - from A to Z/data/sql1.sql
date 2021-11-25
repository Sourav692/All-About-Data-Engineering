IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'caedw.access_authnt') AND type in (N'V'))
DROP VIEW caedw.access_authnt;
GO
create view caedw.access_authnt as select
o.order_id
, o.prod_id
, p.prod_name
, o.unit_price
, p.list_price
from 
	caedw.orders o
join caedw.product p
on o.prod_id = p.prod_id;