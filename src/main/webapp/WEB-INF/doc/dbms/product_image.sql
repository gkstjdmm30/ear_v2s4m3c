DROP TABLE product_image;

CREATE TABLE product_image(
    productimgno                  NUMBER(10)     NOT NULL    PRIMARY KEY,
    productno                   NUMBER(10)    NULL ,
    fname                           VARCHAR2(100)    NOT NULL,
    fupname                      VARCHAR2(100)     NOT NULL,
    thumb                         VARCHAR2(100)    NULL ,
    fsize                             NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                           DATE     NOT NULL,
  FOREIGN KEY (productno) REFERENCES product (productno)
);

COMMENT ON TABLE product_image is '상품 이미지';
COMMENT ON COLUMN product_image.productimgno is '상품이미지번호';
COMMENT ON COLUMN product_image.productno is '상품번호';
COMMENT ON COLUMN product_image.fname is '원본 파일명';
COMMENT ON COLUMN product_image.fupname is '업로드 파일명';
COMMENT ON COLUMN product_image.thumb is 'Thumb 파일';
COMMENT ON COLUMN product_image.fsize is '파일 사이즈';
COMMENT ON COLUMN product_image.rdate is '등록일';

INSERT INTO product_image(productimgno, productno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(productimgno), 0) + 1 as productimgno FROM product_image),
             1, '에어팟 프로.jpg', '에어팟 프로_1.jpg', '에어팟 프로_t.jpg', 1000, sysdate);

INSERT INTO attachfile(attachfileno, contentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO attachfile(attachfileno, contentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);       
             
             
SELECT * FROM product_image;   


DELETE FROM product_image
WHERE productimgno = 1;


