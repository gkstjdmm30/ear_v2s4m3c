-- product_order
DROP table product_order;
CREATE table product_order(
  orderno       NUMBER(10) NOT NULL  PRIMARY KEY,
  productno    NUMBER(10) NOT NULL, 
  membersno    NUMBER(10) NOT NULL,
  count         NUMBER(10) NOT NULL,
  price          NUMBER(20) NOT NULL,
  shipping     NUMBER(20) NOT NULL,
  totalprice      NUMBER(38) NOT NULL,
  howorder      NUMBER(4) DEFAULT 0 NOT NULL,
  tel                           VARCHAR2(50)     NOT NULL,
  zipcode                      VARCHAR2(8)    NOT NULL,
  address1                      VARCHAR2(100)    NULL,
  address2                       VARCHAR2(100)    NULL,
  odate         DATE NOT NULL,
  FOREIGN KEY (productno) REFERENCES product (productno),
  FOREIGN KEY (membersno) REFERENCES members (membersno),
  FOREIGN KEY (tel) REFERENCES members (tel),
  FOREIGN KEY (zipcode) REFERENCES members (zipcode),
  FOREIGN KEY (address1) REFERENCES members (address1),
  FOREIGN KEY (address2) REFERENCES members (address2)
);


COMMENT ON TABLE product_order is '상품 주문 테이블';
COMMENT ON COLUMN product_order.orderno is '주문 번호';
COMMENT ON COLUMN product_order.productno is '상품 번호';
COMMENT ON COLUMN product_order.membersno is '회원 번호';
COMMENT ON COLUMN product_order.count is '구매 갯수';
COMMENT ON COLUMN product_order.price is '상품 가격';
COMMENT ON COLUMN product_order.shipping is '배송 가격';
COMMENT ON COLUMN product_order.totalprice is '총 주문 가격';
COMMENT ON COLUMN product_order.howorder is '결재 방법';
COMMENT ON COLUMN product_order.tel is '결재 번호';
COMMENT ON COLUMN product_order.zipcode is '결재 우편';
COMMENT ON COLUMN product_order.address1 is '결재 주소1';
COMMENT ON COLUMN product_order.address2 is '결재 주소2';
COMMENT ON COLUMN product_order.odate is '주문일';

-- delivery
DROP table deli;
CREATE table deli(
  delino NUMBER(10) NOT NULL PRIMARY KEY,
  orderno NUMBER(10) NOT NULL,
  delivery VARCHAR2(20) NOT NULL,
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
   1, '배송전', sysdate);
INSERT INTO deli(delino, orderno, delivery, ddate)
VALUES((SELECT NVL(MAX(delino), 0) + 1 as delino FROM deli),
   2, '배송중', sysdate);
   
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