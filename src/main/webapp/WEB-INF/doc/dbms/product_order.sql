-- members
DROP table members;
CREATE TABLE members(
    membersno                            NUMBER(10)     NOT NULL PRIMARY KEY,
    id                            VARCHAR2(50)     NOT NULL,
    name                          VARCHAR2(50)     NOT NULL,
    passwd                        VARCHAR2(32)     NOT NULL,
    tel                           VARCHAR2(50)     NOT NULL UNIQUE,
    email                         VARCHAR2(70)     NOT NULL,
    zipcode                      VARCHAR2(8)    NOT NULL UNIQUE,
    address1                      VARCHAR2(100)    NULL UNIQUE,
    address2                       VARCHAR2(100)    NULL UNIQUE,
    rdate                         DATE     NOT NULL,
    ps                            NUMBER(1) DEFAULT 1 NOT NULL 
);
INSERT INTO members(membersno, id, name, passwd, tel, email, zipcode, address1, address2, rdate)
VALUES((SELECT NVL(MAX(membersno), 0) + 1 as membersno FROM members),
   'admin', 'ADMIN', '1234', '0', '0', '0', '0', '0', sysdate);
   
INSERT INTO members(membersno, id, name, passwd, tel, email, zipcode, address1, address2, rdate)
VALUES((SELECT NVL(MAX(membersno), 0) + 1 as mem_no FROM members),
   'user1', 'USER1', '1234', '1', '1', '1', '1', '1', sysdate);
   
   SELECT *
   FROM members;

-- product_categrp
DROP TABLE product_categrp;
CREATE TABLE product_categrp(
    productcateno          NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                      VARCHAR2(50)     NOT NULL,
    seqno                     NUMBER(10)    DEFAULT 0     NOT NULL,
    cnt                         NUMBER(10)    DEFAULT 0     NOT NULL     
);

INSERT INTO product_categrp(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '무선', 1, 0);
            
INSERT INTO product_categrp(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '유선', 2, 0);

INSERT INTO product_categrp(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '스피커', 3, 0);
        
   SELECT *
   FROM product_categrp;       


-- product
DROP TABLE product;
CREATE TABLE product(
    productno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    productcateno                          NUMBER(10)     NOT NULL,
    name                             VARCHAR2(300)    NOT NULL,
    content                           CLOB           NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    word                              VARCHAR2(100)    NULL ,
  FOREIGN KEY (productcateno) REFERENCES product_categrp (productcateno)
);

INSERT INTO product(productno, productcateno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             1, '상품1a', '내용1',
             0, 0, 0, sysdate, '');
             
INSERT INTO product(productno, productcateno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             2, '상품2a', '내용1',
             0, 0, 0, sysdate, '');
             
INSERT INTO product(productno, productcateno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, '상품3a', '내용1',
             0, 0, 0, sysdate, '');

select * from product;
                    

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

INSERT INTO product_order(orderno, productno, membersno, count, price, 
shipping, totalprice, howorder, tel, zipcode, address1, address2, odate)
VALUES((SELECT NVL(MAX(orderno), 0) + 1 as orderno FROM product_order),
   1, 2, 1, 10000, 2500, 12500, 0, '0', '0', '0', '0', sysdate);
   
INSERT INTO product_order(orderno, productno, membersno, count, price, 
shipping, totalprice, howorder, tel, zipcode, address1, address2, odate)
VALUES((SELECT NVL(MAX(orderno), 0) + 1 as orderno FROM product_order),
   1, 2, 2, 10000, 0, 20000, 0,  '1', '1', '1', '1', sysdate);
   
SELECT orderno, productno, membersno, count, price, 
shipping, totalprice, howorder, tel, zipcode, address1, address2, odate
FROM product_order
ORDER BY orderno ASC;

SELECT orderno, productno, membersno, count, price, 
shipping, totalprice, howorder, tel, zipcode, address1, address2, odate
FROM product_order
WHERE membersno = 2;

UPDATE product_order
SET howorder=1;

DELETE FROM product_order;
