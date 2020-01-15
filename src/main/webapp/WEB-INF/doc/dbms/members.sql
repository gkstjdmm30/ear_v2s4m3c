/**********************************/
/* Table Name: ȸ�� */
/**********************************/

DROP table members;
CREATE TABLE members(
    membersno                            NUMBER(10)     NOT NULL,
    id                            VARCHAR2(50)     NOT NULL,
    name                          VARCHAR2(50)     NOT NULL,
    passwd                        VARCHAR2(32)     NOT NULL,
    tel                           VARCHAR2(50)     NOT NULL,
    email                         VARCHAR2(70)     NOT NULL,
    zipcode                      VARCHAR2(8)    NOT NULL,
    address1                      VARCHAR2(100)    NULL ,
    address2                       VARCHAR2(100)    NULL ,
    rdate                         DATE     NOT NULL
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