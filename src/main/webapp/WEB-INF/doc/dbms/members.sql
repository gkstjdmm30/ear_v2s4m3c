/**********************************/
/* Table Name: ȸ�� */
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

COMMENT ON TABLE members is 'ȸ��';
COMMENT ON COLUMN members.mem_no is 'ȸ����ȣ';
COMMENT ON COLUMN members.mem_id is '���̵�';
COMMENT ON COLUMN members.mem_name is '�̸�';
COMMENT ON COLUMN members.mem_passwd is '��й�ȣ';
COMMENT ON COLUMN members.mem_tel is '�޴�����ȣ';
COMMENT ON COLUMN members.mem_email is '�̸���';
COMMENT ON COLUMN members.mem_address is '�ּ�';
COMMENT ON COLUMN members.mem_rdate is '�����';


/**********************************/
/* Table Name: �α��γ��� */
/**********************************/
CREATE TABLE member_login_log(
		mll_id                        		NUMBER(100)		 NOT NULL,
		mll_success                   		NUMBER(2)		 NOT NULL,
		mll_reason                    		VARCHAR2(100)		 NOT NULL,
		mll_no                        		NUMBER(10)		 NOT NULL,
		mll_rdate                     		DATE		 NOT NULL
);

COMMENT ON TABLE member_login_log is '�α��γ���';
COMMENT ON COLUMN member_login_log.mll_id is 'PK';
COMMENT ON COLUMN member_login_log.mll_success is '��������';
COMMENT ON COLUMN member_login_log.mll_reason is '�α��� ����/���� ����';
COMMENT ON COLUMN member_login_log.mll_no is '�α����� ȸ�� PK';
COMMENT ON COLUMN member_login_log.mll_rdate is '�α��� ��¥';



ALTER TABLE members ADD CONSTRAINT IDX_members_PK PRIMARY KEY (mem_no);

ALTER TABLE member_login_log ADD CONSTRAINT IDX_member_login_log_PK PRIMARY KEY (mll_id);
ALTER TABLE member_login_log ADD CONSTRAINT IDX_member_login_log_FK0 FOREIGN KEY (mll_no) REFERENCES members (mem_no);

