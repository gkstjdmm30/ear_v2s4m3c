-- 삭제
DROP TABLE product;

-- 생성
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

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.productno is '상품번호';
COMMENT ON COLUMN product.productcateno is '상품 카테고리 번호';
COMMENT ON COLUMN product.name is '상품이름';
COMMENT ON COLUMN product.content is '내용';
COMMENT ON COLUMN product.recom is '추천수';
COMMENT ON COLUMN product.cnt is '조회수';
COMMENT ON COLUMN product.replycnt is '댓글수';
COMMENT ON COLUMN product.rdate is '등록일';
COMMENT ON COLUMN product.word is '검색어';


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
                    
-- 목록            
SELECT *
FROM product
ORDER BY productcateno ASC;      

PRODUCTNO PRODUCTCATENO NAME CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 --------- ------------- ---- ------- ----- --- -------- --------------------- ----
         1             1 상품1a 내용1         0   0        0 2019-12-19 12:29:32.0 NULL
         2             2 상품2a 내용1         0   0        0 2019-12-19 12:29:33.0 NULL
         3             3 상품3a 내용1         0   0        0 2019-12-19 12:29:34.0 NULL
             
             
             
             