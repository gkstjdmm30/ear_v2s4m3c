/**********************************/
/* Table Name: ȸ�� */
/**********************************/

DROP table members;
CREATE TABLE members(
    membersno                            NUMBER(10)     NOT NULL PRIMARY KEY,
    id                            VARCHAR2(50)     NOT NULL,
    name                          VARCHAR2(50)     NOT NULL,
    passwd                        VARCHAR2(32)     NOT NULL,
    tel                           VARCHAR2(50)     NOT NULL,
    email                         VARCHAR2(70)     NOT NULL,
    zipcode                      VARCHAR2(8)    NOT NULL,
    address1                      VARCHAR2(100)    NULL,
    address2                       VARCHAR2(100)    NULL,
    rdate                         DATE     NOT NULL,
    ps                            NUMBER(1) DEFAULT 1 NOT NULL 
);

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.membersno is 'ȸ����ȣ';
COMMENT ON COLUMN members.id is '���̵�';
COMMENT ON COLUMN members.name is '�̸�';
COMMENT ON COLUMN members.passwd is '��й�ȣ';
COMMENT ON COLUMN members.tel is '�޴�����ȣ';
COMMENT ON COLUMN members.email is '�̸���';
COMMENT ON COLUMN members.zipcode is '�����ȣ';
COMMENT ON COLUMN members.address1 is '�ּ�1';
COMMENT ON COLUMN members.address2 is '�ּ�2';
COMMENT ON COLUMN members.rdate is '�����';
COMMENT ON COLUMN members.ps is '���';

INSERT INTO members(membersno, id, name, passwd, tel, email, zipcode, address1, address2, rdate)
VALUES((SELECT NVL(MAX(membersno), 0) + 1 as membersno FROM members),
   'admin', 'ADMIN', '1234', '0', '0', '0', '0', '0', sysdate);
   
INSERT INTO members(membersno, id, name, passwd, tel, email, zipcode, address1, address2, rdate)
VALUES((SELECT NVL(MAX(membersno), 0) + 1 as mem_no FROM members),
   'user1', 'USER1', '1234', '0', '0', '0', '0', '0', sysdate);
   
SELECT * FROM members;

SELECT to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') FROM dual;
