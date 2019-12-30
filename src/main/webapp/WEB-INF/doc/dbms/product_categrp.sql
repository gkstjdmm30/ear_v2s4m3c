-- 삭제
DROP TABLE product_categrp;

-- 생성
CREATE TABLE product_categrp(
    productcateno          NUMBER(10)     NOT NULL    PRIMARY KEY,
    name                      VARCHAR2(50)     NOT NULL,
    seqno                     NUMBER(10)    DEFAULT 0     NOT NULL,
    cnt                         NUMBER(10)    DEFAULT 0     NOT NULL,            
);

COMMENT ON TABLE product_categrp is '상품 분류 카테고리';
COMMENT ON COLUMN product_categrp.productcateno is '상품 분류 번호';
COMMENT ON COLUMN product_categrp.name is '분류명';
COMMENT ON COLUMN product_categrp.seqno is '출력 순서';
COMMENT ON COLUMN product_categrp.cnt is '등록된 상품 수';

-- 등록
INSERT INTO product_categrp(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '무선', 1, 0);
            
INSERT INTO product_categrp(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '유선', 2, 0);

INSERT INTO product_categrp(productcateno, name, seqno, cnt)
VALUES((SELECT NVL(MAX(productcateno), 0) + 1 as categrpno FROM product_categrp),
            '스피커', 3, 0);
            
-- 목록            
SELECT *
FROM product_categrp
ORDER BY seqno ASC;   

PRODUCTCATENO NAME SEQNO CNT
 ------------- ---- ----- ---
             1 무선       1   0
             2 유선       2   0
             3 스피커      3   0        



            

            