/**********************************/
/* Table Name: �������� �з� ī�װ�*/
/**********************************/
-- ����
DROP TABLE notice_categrp;

-- ����
CREATE TABLE notice_categrp (
  categrpno   NUMBER(7) NOT NULL PRIMARY KEY, -- -9999999 ~ 9999999
  name          VARCHAR2(20) NOT NULL,
  seqno         NUMBER(7) NOT NULL,
  rdate          DATE NOT NULL,
  cnt             NUMBER(7) DEFAULT 0 NOT NULL
);

COMMENT ON TABLE notice_categrp is '�������� ī�װ� �׷�';
COMMENT ON COLUMN notice_categrp.categrpno is 'ī�װ� �׷��ȣ';
COMMENT ON COLUMN notice_categrp.name is 'ī�װ� �̸�';
COMMENT ON COLUMN notice_categrp.seqno is '��� ����';
COMMENT ON COLUMN notice_categrp.rdate is '�׷� ������';
COMMENT ON COLUMN notice_categrp.cnt is '�������� ��ϰ���';

-- ���
INSERT INTO notice_categrp(categrpno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM notice_categrp),
                '��������', 1, sysdate, 0);
INSERT INTO notice_categrp(categrpno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM notice_categrp),
                '�ڷ��', 2, sysdate, 0);
INSERT INTO notice_categrp(categrpno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM notice_categrp),
                'Q&A', 3, sysdate, 0);
            
-- ���            
SELECT * FROM notice_categrp ORDER BY categrpno ASC;

 CATEGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ----- ----- ------- --------------------- ---
         1 ��������1     1 Y       2019-11-29 14:54:22.0   0
         2 ��������2     2 Y       2019-11-29 14:54:23.0   0
         3 ��������3     3 Y       2019-11-29 14:54:24.0   0

/**********************************/
/* Table Name: ���� ���� ī�װ� */
/**********************************/

-- ����
DROP TABLE survey_categrp;

-- ����
CREATE TABLE survey_categrp (
  categrpno NUMBER(7) NOT NULL, -- -9999999 ~ 9999999
  name VARCHAR(20) NOT NULL,
  seqno NUMBER(7) NOT NULL,
  visible CHAR(1) DEFAULT 'Y' NOT NULL,
  rdate DATE NOT NULL,
  cnt NUMBER(7) DEFAULT 0 NOT NULL,
  PRIMARY KEY(categrpno)
);

COMMENT ON TABLE survey_categrp is '���� ī�װ� �׷�';
COMMENT ON COLUMN survey_categrp.categrpno is '���� ī�װ� �׷��ȣ';
COMMENT ON COLUMN survey_categrp.name is '���� ī�װ� �̸�';
COMMENT ON COLUMN survey_categrp.seqno is '��� ����';
COMMENT ON COLUMN survey_categrp.visible is '��� ���';
COMMENT ON COLUMN survey_categrp.rdate is '�׷� ������';
COMMENT ON COLUMN notice_categrp.cnt is '������ ���� Ƚ��';

-- ���
INSERT INTO survey_categrp(categrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM survey_categrp),
                '1�� ����', 1, 'Y', sysdate, 0);
INSERT INTO survey_categrp(categrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM survey_categrp),
                '2�� ����', 1, 'Y', sysdate, 0);
INSERT INTO survey_categrp(categrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM survey_categrp),
                '3�� ����', 1, 'Y', sysdate, 0);
                
-- ���            
SELECT * FROM survey_categrp ORDER BY categrpno ASC;                
                
 CATEGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ----- ----- ------- --------------------- ---
         1 1�� ����     1 Y       2019-11-29 15:21:44.0   0
         2 1�� ����     1 Y       2019-11-29 15:22:14.0   0
         3 2�� ����     1 Y       2019-11-29 15:22:15.0   0
         4 3�� ����     1 Y       2019-11-29 15:22:16.0   0
