USE homework2;

CREATE TABLE orders
(
   order_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   employeeid VARCHAR(10) NOT NULL, 
   amount DECIMAL(7,2) NOT NULL,
   orderstatus VARCHAR(10) NOT NULL
);