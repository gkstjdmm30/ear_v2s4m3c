/**********************************/
/* Table Name: 회원 */
/**********************************/

DROP table members;
CREATE TABLE members(
		mem_no                        		NUMBER(10)		 NOT NULL,
		mem_id                        		VARCHAR2(50)		 NOT NULL,
		mem_name                      		VARCHAR2(50)		 NOT NULL,
		mem_passwd                    		VARCHAR2(32)		 NOT NULL,
		mem_tel                       		VARCHAR2(50)		 NOT NULL,
		mem_email                     		VARCHAR2(70)		 NOT NULL,
		mem_address1                   		VARCHAR2(100)		 NULL ,
		mem_address2                       VARCHAR2(100)    NULL ,
		mem_rdate                     		DATE		 NOT NULL
);

COMMENT ON TABLE members is '회원';
COMMENT ON COLUMN members.mem_no is '회원번호';
COMMENT ON COLUMN members.mem_id is '아이디';
COMMENT ON COLUMN members.mem_name is '이름';
COMMENT ON COLUMN members.mem_passwd is '비밀번호';
COMMENT ON COLUMN members.mem_tel is '휴대폰번호';
COMMENT ON COLUMN members.mem_email is '이메일';
COMMENT ON COLUMN members.mem_address is '주소';
COMMENT ON COLUMN members.mem_rdate is '등록일';


/**********************************/
/* Table Name: 로그인내역 */
/**********************************/
CREATE TABLE member_login_log(
		mll_id                        		NUMBER(100)		 NOT NULL,
		mll_success                   		NUMBER(2)		 NOT NULL,
		mll_reason                    		VARCHAR2(100)		 NOT NULL,
		mll_no                        		NUMBER(10)		 NOT NULL,
		mll_rdate                     		DATE		 NOT NULL
);

COMMENT ON TABLE member_login_log is '로그인내역';
COMMENT ON COLUMN member_login_log.mll_id is 'PK';
COMMENT ON COLUMN member_login_log.mll_success is '성공여부';
COMMENT ON COLUMN member_login_log.mll_reason is '로그인 성공/실패 이유';
COMMENT ON COLUMN member_login_log.mll_no is '로그인한 회원 PK';
COMMENT ON COLUMN member_login_log.mll_rdate is '로그인 날짜';



ALTER TABLE members ADD CONSTRAINT IDX_members_PK PRIMARY KEY (mem_no);

ALTER TABLE member_login_log ADD CONSTRAINT IDX_member_login_log_PK PRIMARY KEY (mll_id);
ALTER TABLE member_login_log ADD CONSTRAINT IDX_member_login_log_FK0 FOREIGN KEY (mll_no) REFERENCES members (mem_no);

