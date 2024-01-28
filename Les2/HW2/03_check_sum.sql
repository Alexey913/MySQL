USE homework2;

SELECT order_date, amount,
CASE
   WHEN amount<100 THEN 'Маленький заказ'
   WHEN amount>300 THEN 'Большой заказ'
   ELSE 'Средний заказ'
END AS bucket
FROM sales
;