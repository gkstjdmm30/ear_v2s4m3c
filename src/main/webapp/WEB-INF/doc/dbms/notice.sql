/**********************************/
/* Table Name: ȸ�� */
/**********************************/

/**********************************/
/* Table Name: �������� ī�װ� �׷� */
/**********************************/
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

/**********************************/
/* Table Name: �������� */
/**********************************/
DROP TABLE notice_categrp;
DROP TABLE notice;
CREATE TABLE notice(
		noticeno                    		NUMBER(10)		 NOT NULL PRIMARY KEY,
		categrpno                     		NUMBER(7)		 NOT NULL,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB      		 NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
  FOREIGN KEY (categrpno) REFERENCES notice_categrp (categrpno)
);

COMMENT ON TABLE notice is '��������';
COMMENT ON COLUMN notice.noticeno is '�������� ��ȣ';
COMMENT ON COLUMN notice.categrpno is 'ī�װ� �׷��ȣ';
COMMENT ON COLUMN notice.title is '����';
COMMENT ON COLUMN notice.content is '����';
COMMENT ON COLUMN notice.recom is '��õ��';
COMMENT ON COLUMN notice.cnt is '��ȸ��';
COMMENT ON COLUMN notice.replycnt is '��ۼ�';
COMMENT ON COLUMN notice.rdate is '�����';
COMMENT ON COLUMN notice.word is '�˻���';

1) ���
-- PK ����
SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice;

 CONTENTSNO
 ----------
          1

INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '����1', '����1',
             0, 0, 0, sysdate, '�˻���1');
             
INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '����2', '����2',
             0, 0, 0, sysdate, '�˻���2');
             
INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '����3', '����3',
             0, 0, 0, sysdate, '�˻���3');
             
INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '����4', '����4',
             0, 0, 0, sysdate, '�˻���4');
             
 SELECT * FROM notice;

-- ORA-02291: integrity constraint (AI.SYS_C007068) violated - parent key not found
-- FK �÷��� ���� �θ� ���̺� ��ϵǾ� ���� �ʾƼ� �߻�
-- member ���̺� ��� Ȯ��
INSERT INTO member(memberno)
VALUES((SELECT NVL(MAX(memberno), 0) + 1 as memberno FROM member));
INSERT INTO member(memberno)
VALUES((SELECT NVL(MAX(memberno), 0) + 1 as memberno FROM member));
INSERT INTO member(memberno)
VALUES((SELECT NVL(MAX(memberno), 0) + 1 as memberno FROM member));

SELECT memberno FROM member ORDER BY memberno; 

 MEMBERNO
 --------
        1
        2
        3
        
-- categrp ���̺� ��� Ȯ��                                
SELECT categrpno, name, seqno, visible, rdate, cnt
FROM categrp
ORDER BY seqno ASC;

 CATEGRPNO NAME  SEQNO VISIBLE RDATE             CNT
 --------- ----- ----- ------- --------------------- ---
         1 �ؿ� ����     1 Y       2019-11-25 16:08:23.0   0
         2 ���� ����     2 Y       2019-11-25 16:08:24.0   0
         3 ���� �ڷ�     3 N       2019-11-25 16:08:25.0   0

-- 1) contents ���(member: 1, categrpno: 1),
--     varchar�� '' ��ϵǸ� null�� insert ��
INSERT INTO contents(contentsno, 
                                memberno, categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM contents),
             1, 1, '����1', '����1',
             0, 0, 0, sysdate, '');

-- 2) ���
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
ORDER BY contentsno DESC;
 CONTENTSNO MEMBERNO CATEGRPNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ---------- -------- --------- ----- ------- ----- --- -------- --------------------- ----
          1        1         1 ����1   ����1         0   0        0 2019-11-25 16:14:17.0 NULL

-- 3) categrpno�� ��ü ���
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=1 -- 1: �ؿ� ����, 2: ���� ����
ORDER BY contentsno DESC;

-- 4) ��ü ���ڵ� ��
SELECT COUNT(*) as count
FROM contents;
             
-- 5) ��ȸ
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE contentsno=1;

-- 6) ����
UPDATE contents
SET title='���� ����', content='���� ����', word='�˻���'
WHERE contentsno = 1;

-- 7) ����
DELETE FROM contents
WHERE contentsno=1;

-- 8) FK �θ� ���̺� ���ڵ� ���� ����
SELECT contentsno, memberno, categrpno, title
FROM contents
WHERE categrpno=6;

 CONTENTSNO MEMBERNO CATEGRPNO TITLE
 ---------- -------- --------- -----------------------
          3          1                6                  12�� ���� ����ȳ�
          5          1                6                  �̹��� ������ �ɾ� �����մϴ�.
          7          1                6                  ��Ű�� �Ա� ������ ��ӵ��ο��� �������ּ���~

SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=6;

 CNT
 ---
   3             
             
-- 9) FK �θ� ���̺� ���ڵ� ����
DELETE FROM contents
WHERE categrpno=6;

(3 rows affected)

10) ��ۼ� ����
UPDATE contents
SET replycnt = replycnt + 1
WHERE contentsno = 1;

11) ��ۼ� ����
UPDATE contents
SET replycnt = replycnt - 1
WHERE contentsno = 1;

12) �˻�
�� categrpno�� �˻� ���
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%������%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%���ǽ�%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%���ǽ�%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%swiss%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%����%'
ORDER BY contentsno DESC;

�� �˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=2;

-- �˻� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=2 AND word LIKE '%������%';

   
   
   




