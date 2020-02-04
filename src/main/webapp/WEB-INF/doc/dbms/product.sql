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

INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             1, 1, '��ǰ1', '����1',
             0, 0, 0, sysdate, '��ǰ4');
    
INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             2, 1, '��ǰ2', '����1',
             0, 0, 0, sysdate, '��ǰ4');
    
INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, 1, '��ǰ3', '����1',
             0, 0, 0, sysdate, '��ǰ4');
    
INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, 1, '��ǰ4', '����1',
             0, 0, 0, sysdate, '��ǰ4');
                    
             
                    
-- ���            
SELECT *
FROM product
ORDER BY productcateno ASC;      

 PRODUCTNO PRODUCTCATENO MEMBERSNO NAME CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 --------- ------------- --------- ---- ------- ----- --- -------- --------------------- ----
         1             1         1 ��ǰ1  ����1         0   0        0 2020-01-20 17:12:59.0 ��ǰ1
         2             2         1 ��ǰ2  ����1         0   0        0 2020-01-20 17:13:00.0 ��ǰ2
         3             3         1 ��ǰ3  ����1         0   0        0 2020-01-20 17:13:01.0 ��ǰ3
         4             3         1 ��ǰ4  ����1         0   0        0 2020-01-20 17:13:02.0 ��ǰ4


             
UPDATE product   
SET  = '������ ����'
WHERE productno = 1;
             
             