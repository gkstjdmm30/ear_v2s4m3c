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
            
-- ���            
SELECT *
FROM product_categrp
ORDER BY seqno ASC;   

PRODUCTCATENO NAME SEQNO CNT
 ------------- ---- ----- ---
             1 ����       1   0
             2 ����       2   0
             3 ����Ŀ      3   0        
             
             
UPDATE product_categrp
SET name = '����'
WHERE productcateno = 3;

             
             


            

            