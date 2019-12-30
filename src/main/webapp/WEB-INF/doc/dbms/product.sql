-- ����
DROP TABLE product;

-- ����
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

COMMENT ON TABLE product is '��ǰ';
COMMENT ON COLUMN product.productno is '��ǰ��ȣ';
COMMENT ON COLUMN product.productcateno is '��ǰ ī�װ� ��ȣ';
COMMENT ON COLUMN product.name is '��ǰ�̸�';
COMMENT ON COLUMN product.content is '����';
COMMENT ON COLUMN product.recom is '��õ��';
COMMENT ON COLUMN product.cnt is '��ȸ��';
COMMENT ON COLUMN product.replycnt is '��ۼ�';
COMMENT ON COLUMN product.rdate is '�����';
COMMENT ON COLUMN product.word is '�˻���';


INSERT INTO product(productno, productcateno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             1, '��ǰ1a', '����1',
             0, 0, 0, sysdate, '');
             
INSERT INTO product(productno, productcateno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             2, '��ǰ2a', '����1',
             0, 0, 0, sysdate, '');
             
INSERT INTO product(productno, productcateno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, '��ǰ3a', '����1',
             0, 0, 0, sysdate, '');
                    
-- ���            
SELECT *
FROM product
ORDER BY productcateno ASC;      

PRODUCTNO PRODUCTCATENO NAME CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 --------- ------------- ---- ------- ----- --- -------- --------------------- ----
         1             1 ��ǰ1a ����1         0   0        0 2019-12-19 12:29:32.0 NULL
         2             2 ��ǰ2a ����1         0   0        0 2019-12-19 12:29:33.0 NULL
         3             3 ��ǰ3a ����1         0   0        0 2019-12-19 12:29:34.0 NULL
             
             
             
             