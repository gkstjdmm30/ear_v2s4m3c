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

COMMENT ON TABLE product_image is '��ǰ �̹���';
COMMENT ON COLUMN product_image.productimgno is '��ǰ�̹�����ȣ';
COMMENT ON COLUMN product_image.productno is '��ǰ��ȣ';
COMMENT ON COLUMN product_image.fname is '���� ���ϸ�';
COMMENT ON COLUMN product_image.fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN product_image.thumb is 'Thumb ����';
COMMENT ON COLUMN product_image.fsize is '���� ������';
COMMENT ON COLUMN product_image.rdate is '�����';

INSERT INTO product_image(productimgno, productno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(productimgno), 0) + 1 as productimgno FROM product_image),
             1, '������ ����.jpg', '������ ����_1.jpg', '������ ����_t.jpg', 1000, sysdate);

INSERT INTO attachfile(attachfileno, contentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO attachfile(attachfileno, contentsno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile),
             1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);       
             
             
SELECT * FROM product_image;   


DELETE FROM product_image
WHERE productimgno = 1;


