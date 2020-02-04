-- 삭제
DROP TABLE product;

-- 생성
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

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.productno is '상품번호';
COMMENT ON COLUMN product.productcateno is '상품 카테고리 번호';
COMMENT ON COLUMN product.membersno is '회원번호';
COMMENT ON COLUMN product.name is '상품이름';
COMMENT ON COLUMN product.price is '가격';
COMMENT ON COLUMN product.content is '내용';
COMMENT ON COLUMN product.recom is '추천수';
COMMENT ON COLUMN product.cnt is '조회수';
COMMENT ON COLUMN product.replycnt is '댓글수';
COMMENT ON COLUMN product.rdate is '등록일';
COMMENT ON COLUMN product.word is '검색어';

INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             1, 1, '상품1', '내용1',
             0, 0, 0, sysdate, '상품4');
    
INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             2, 1, '상품2', '내용1',
             0, 0, 0, sysdate, '상품4');
    
INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, 1, '상품3', '내용1',
             0, 0, 0, sysdate, '상품4');
    
INSERT INTO product(productno, productcateno, membersno, name, content, recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(productno), 0) + 1 as productno FROM product),
             3, 1, '상품4', '내용1',
             0, 0, 0, sysdate, '상품4');
                    
             
                    
-- 목록            
SELECT *
FROM product
ORDER BY productcateno ASC;      

 PRODUCTNO PRODUCTCATENO MEMBERSNO NAME CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 --------- ------------- --------- ---- ------- ----- --- -------- --------------------- ----
         1             1         1 상품1  내용1         0   0        0 2020-01-20 17:12:59.0 상품1
         2             2         1 상품2  내용1         0   0        0 2020-01-20 17:13:00.0 상품2
         3             3         1 상품3  내용1         0   0        0 2020-01-20 17:13:01.0 상품3
         4             3         1 상품4  내용1         0   0        0 2020-01-20 17:13:02.0 상품4


             
UPDATE product   
SET  = '에어팟 프로'
WHERE productno = 1;
             
             