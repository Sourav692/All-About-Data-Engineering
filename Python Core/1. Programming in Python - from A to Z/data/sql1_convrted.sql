create or replace view caedw.access_authnt_vw as select
o.order_id
, o.prod_id
, p.prod_name
, o.unit_price
, p.list_price
from
delta.`/mnt/test/orders` o
join delta.`/mnt/test/product` p
on o.prod_id = p.prod_id;
