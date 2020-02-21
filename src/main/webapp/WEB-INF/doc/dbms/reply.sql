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

COMMENT ON TABLE reply is '���';
COMMENT ON COLUMN reply.replyno is '��۹�ȣ';
COMMENT ON COLUMN reply.productno is '��ǰ��ȣ';
COMMENT ON COLUMN reply.membersno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN reply.content is '����';
COMMENT ON COLUMN reply.passwd is '��й�ȣ';
COMMENT ON COLUMN reply.rdate is '�����';

INSERT INTO reply(replyno, productno, membersno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             1, 1, '���1', '1234', sysdate);
INSERT INTO reply(replyno, productno, membersno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             1, 1, '���2', '1234', sysdate);
             
                         
SELECT * FROM reply; 

DELETE FROM reply;