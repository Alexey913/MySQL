USE homework2;

SELECT order_id, orderstatus,
CASE orderstatus
   WHEN 'OPEN' THEN 'Order is in open state.'
   WHEN 'CLOSED' THEN 'Order is closed.'
   ELSE 'Order is cancelled.'
END AS order_summary
FROM orders
;