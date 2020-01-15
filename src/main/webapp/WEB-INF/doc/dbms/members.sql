/**********************************/
/* Table Name: 회원 */
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

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.membersno is '회원번호';
COMMENT ON COLUMN members.id is '아이디';
COMMENT ON COLUMN members.name is '이름';
COMMENT ON COLUMN members.passwd is '비밀번호';
COMMENT ON COLUMN members.tel is '휴대폰번호';
COMMENT ON COLUMN members.email is '이메일';
COMMENT ON COLUMN members.zipcode is '우편번호';
COMMENT ON COLUMN members.address1 is '주소1';
COMMENT ON COLUMN members.address2 is '주소2';
COMMENT ON COLUMN members.rdate is '등록일';