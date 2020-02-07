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


COMMENT ON TABLE product_order is '��ǰ �ֹ� ���̺�';
COMMENT ON COLUMN product_order.orderno is '�ֹ� ��ȣ';
COMMENT ON COLUMN product_order.productno is '��ǰ ��ȣ';
COMMENT ON COLUMN product_order.membersno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN product_order.count is '���� ����';
COMMENT ON COLUMN product_order.price is '��ǰ ����';
COMMENT ON COLUMN product_order.shipping is '��� ����';
COMMENT ON COLUMN product_order.totalprice is '�� �ֹ� ����';
COMMENT ON COLUMN product_order.howorder is '���� ���';
COMMENT ON COLUMN product_order.tel is '���� ��ȣ';
COMMENT ON COLUMN product_order.zipcode is '���� ����';
COMMENT ON COLUMN product_order.address1 is '���� �ּ�1';
COMMENT ON COLUMN product_order.address2 is '���� �ּ�2';
COMMENT ON COLUMN product_order.odate is '�ֹ���';

-- delivery
DROP table deli;
CREATE table deli(
  delino NUMBER(10) NOT NULL PRIMARY KEY,
  orderno NUMBER(10) NOT NULL,
  delivery VARCHAR2(20) NOT NULL,
  ddate DATE NOT NULL,
  FOREIGN KEY (orderno) REFERENCES product_order (orderno)
);

COMMENT ON TABLE deli is '��� ���̺�';
COMMENT ON COLUMN deli.delino is '��� ��ȣ';
COMMENT ON COLUMN deli.orderno is '�ֹ� ��ȣ';
COMMENT ON COLUMN deli.delivery is '��� ����';
COMMENT ON COLUMN deli.ddate is '�����';

INSERT INTO deli(delino, orderno, delivery, ddate)
VALUES((SELECT NVL(MAX(delino), 0) + 1 as delino FROM deli),
   1, '�����', sysdate);
INSERT INTO deli(delino, orderno, delivery, ddate)
VALUES((SELECT NVL(MAX(delino), 0) + 1 as delino FROM deli),
   2, '�����', sysdate);
   
SELECT delino, orderno, delivery, ddate 
FROM deli
ORDER by delino ASC;
   
SELECT delino, orderno, delivery, ddate 
FROM deli
WHERE orderno=1;

UPDATE deli
set delivery='��� �Ϸ�'
WHERE orderno=1;

DELETE deli
where orderno=2;

SELECT product.name
from product, product_order, deli
where deli.orderno = product_order.orderno 
        and product_order.productno = product.productno;