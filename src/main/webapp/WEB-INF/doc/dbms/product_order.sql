-- members
DROP table members;
CREATE TABLE members(
    membersno                            NUMBER(10)     NOT NULL PRIMARY KEY,
    id                            VARCHAR2(50)     NOT NULL,
    name                          VARCHAR2(50)     NOT NULL,
    passwd                        VARCHAR2(32)     NOT NULL,
    tel                           VARCHAR2(50)     NOT NULL,
    email                         VARCHAR2(70)     NOT NULL,
    zipcode                      VARCHAR2(8)    NOT NULL,
    address1                      VARCHAR2(100)    NULL,
    address2                       VARCHAR2(100)    NULL,
    rdate                         DATE     NOT NULL,
    ps                            NUMBER(1) DEFAULT 1 NOT NULL 
);
INSERT INTO members(membersno, id, name, passwd, tel, email, zipcode, address1, address2, rdate)
VALUES((SELECT NVL(MAX(membersno), 0) + 1 as membersno FROM members),
   'admin', 'ADMIN', '1234', '0', '0', '0', '0', '0', sysdate);
   
INSERT INTO members(membersno, id, name, passwd, tel, email, zipcode, address1, address2, rdate)
VALUES((SELECT NVL(MAX(membersno), 0) + 1 as mem_no FROM members),
   'user1', 'USER1', '1234', '1', '1', '1', '1', '1', sysdate);
   DELETE from members;
   SELECT *
   FROM members;

         SELECT COUNT(id) as cnt
      FROM members
      WHERE id='admin';
      
 SELECT * FROM members;
 
 UPDATE members
 set ps=0
 WHERE id = 'admin'; 
-- product_categrp
-- ����
DROP TABLE product_categrp;

-- ����
CREATE TABLE product_categrp(
    productcateno          NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                      VARCHAR2(50)     NOT NULL,
    seqno                     NUMBER(10)    DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    cnt                         NUMBER(10)    DEFAULT 0     NOT NULL           
);

COMMENT ON TABLE product_categrp is '��ǰ ī�װ�';
COMMENT ON COLUMN product_categrp.productcateno is '��ǰ ī�װ� ��ȣ';
COMMENT ON COLUMN product_categrp.name is '��ǰ ī�װ� �̸�';
COMMENT ON COLUMN product_categrp.seqno is '��� ����';
COMMENT ON COLUMN categrp.rdate is '�׷� ������';
COMMENT ON COLUMN product_categrp.cnt is '��ϵ� ��ǰ ��';

-- ���
INSERT INTO product_categrp(productcateno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '����', 1, sysdate, 0);
            
INSERT INTO product_categrp(productcateno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '����', 2, sysdate, 0);

INSERT INTO product_categrp(productcateno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '����Ŀ', 3, sysdate, 0);
           
   SELECT *
   FROM product_categrp;       


-- product
-- ����
DROP TABLE product;

-- ����
CREATE TABLE product(
    productno                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    productcateno                   NUMBER(10)     NOT NULL,
    membersno                     NUMBER(10)     NOT NULL,
    name                             VARCHAR2(300)    NOT NULL,
    price                                NUMBER(10)     NOT NULL,
    content                           CLOB           NOT NULL,
    recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
    cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
    replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    word                              VARCHAR2(100)    NULL ,
  FOREIGN KEY (productcateno) REFERENCES product_categrp (productcateno),
  FOREIGN KEY (membersno) REFERENCES members (membersno)
);

COMMENT ON TABLE product is '��ǰ';
COMMENT ON COLUMN product.productno is '��ǰ��ȣ';
COMMENT ON COLUMN product.productcateno is '��ǰ ī�װ� ��ȣ';
COMMENT ON COLUMN product.membersno is 'ȸ����ȣ';
COMMENT ON COLUMN product.name is '��ǰ�̸�';
COMMENT ON COLUMN product.price is '����';
COMMENT ON COLUMN product.content is '����';
COMMENT ON COLUMN product.recom is '��õ��';
COMMENT ON COLUMN product.cnt is '��ȸ��';
COMMENT ON COLUMN product.replycnt is '��ۼ�';
COMMENT ON COLUMN product.rdate is '�����';
COMMENT ON COLUMN product.word is '�˻���';

INSERT INTO product(productno, productcateno, membersno, name, price, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             1, 1, '������ ����', 329000, '����1',
             0, 0, 0, sysdate, '��ǰ4');
    
INSERT INTO product(productno, productcateno, membersno, name, price, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             2, 1, '����', 150000, '����1',
             0, 0, 0, sysdate, '��ǰ4');
    
INSERT INTO product(productno, productcateno, membersno, name, price, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, 1, '����1', 230000, '����1',
             0, 0, 0, sysdate, '��ǰ4');
    
INSERT INTO product(productno, productcateno, membersno, name, price, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, 1, '����2', 87000, '����1',
             0, 0, 0, sysdate, '��ǰ4');
                    
   
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
  FOREIGN KEY (membersno) REFERENCES members (membersno)
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

SELECT name
from (
				 select productno
				 from product_order
				 where membersno=1 and productno=1
				)
WHERE 
      (
         select productno
         from product_order
         where membersno=1
       );

SELECT product.name
from product, product_order, members
where members.membersno = product_order.membersno 
        and product_order.productno = product.productno
        and product_order.membersno =1;