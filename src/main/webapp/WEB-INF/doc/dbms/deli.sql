
-- delivery
DROP table deli;
CREATE table deli(
  delino NUMBER(10) NOT NULL PRIMARY KEY,
  orderno NUMBER(10) NOT NULL,
  delivery VARCHAR2(20) default 1 NOT NULL,
  ddate DATE NOT NULL,
  FOREIGN KEY (orderno) REFERENCES product_order (orderno)
);

COMMENT ON TABLE deli is '배송 테이블';
COMMENT ON COLUMN deli.delino is '배송 번호';
COMMENT ON COLUMN deli.orderno is '주문 번호';
COMMENT ON COLUMN deli.delivery is '배송 상태';
COMMENT ON COLUMN deli.ddate is '배송일';

INSERT INTO deli(delino, orderno, delivery, ddate)
VALUES((SELECT NVL(MAX(delino), 0) + 1 as delino FROM deli),
   1, 1, sysdate);
INSERT INTO deli(delino, orderno, delivery, ddate)
VALUES((SELECT NVL(MAX(delino), 0) + 1 as delino FROM deli),
   2, 2, sysdate);
   
   INSERT INTO deli(delino, orderno, ddate)
VALUES((SELECT NVL(MAX(delino), 0) + 1 as delino FROM deli),
   1, sysdate);
   
SELECT delino, orderno, delivery, ddate 
FROM deli
ORDER by delino ASC;
   
SELECT delino, orderno, delivery, ddate 
FROM deli
WHERE orderno=1;

UPDATE deli
set delivery='배송 완료'
WHERE orderno=1;

DELETE deli
where orderno=2;

SELECT product.name
from product, product_order, deli
where deli.orderno = product_order.orderno 
        and product_order.productno = product.productno;
        
      SELECT count(delino) as cnt 
      FROM deli
      WHERE orderno=1;
      
SELECT product.name, product_order.zipcode, product_order.address1,
          product_order.address2, deli.delino, deli.orderno, deli.delivery, deli.ddate
FROM product, product_order, deli
WHERE deli.orderno = product_order.orderno and product_order.productno = product.productno;

SELECT product_image.thumb
FROM product_order, product_image, deli
WHERE deli.orderno = product_order.orderno and product_order.productno = product_image.productno and deli.orderno =1;

