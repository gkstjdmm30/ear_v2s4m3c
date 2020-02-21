DROP TABLE reply;

CREATE TABLE reply(
    replyno                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    productno                      NUMBER(10)  NOT  NULL ,
    membersno                        NUMBER(6)    NOT NULL ,
    content                           VARCHAR2(1000)     NOT NULL,
    passwd                            VARCHAR2(20)     NOT NULL,
    rdate                              DATE NOT NULL,
  FOREIGN KEY (productno) REFERENCES product (productno),
  FOREIGN KEY (membersno) REFERENCES members (membersno)
);

COMMENT ON TABLE reply is '댓글';
COMMENT ON COLUMN reply.replyno is '댓글번호';
COMMENT ON COLUMN reply.productno is '상품번호';
COMMENT ON COLUMN reply.membersno is '회원 번호';
COMMENT ON COLUMN reply.content is '내용';
COMMENT ON COLUMN reply.passwd is '비밀번호';
COMMENT ON COLUMN reply.rdate is '등록일';

INSERT INTO reply(replyno, productno, membersno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             1, 1, '댓글1', '1234', sysdate);
INSERT INTO reply(replyno, productno, membersno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             1, 1, '댓글2', '1234', sysdate);
             
                         
SELECT * FROM reply; 

DELETE FROM reply;