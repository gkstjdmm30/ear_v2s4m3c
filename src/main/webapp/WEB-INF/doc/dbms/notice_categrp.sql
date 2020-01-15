/**********************************/
/* Table Name: 공지사항 분류 카테고리*/
/**********************************/
-- 삭제
DROP TABLE notice_categrp;

-- 생성
CREATE TABLE notice_categrp (
  categrpno   NUMBER(7) NOT NULL PRIMARY KEY, -- -9999999 ~ 9999999
  name          VARCHAR2(20) NOT NULL,
  seqno         NUMBER(7) NOT NULL,
  rdate          DATE NOT NULL,
  cnt             NUMBER(7) DEFAULT 0 NOT NULL
);

COMMENT ON TABLE notice_categrp is '공지사항 카테고리 그룹';
COMMENT ON COLUMN notice_categrp.categrpno is '카테고리 그룹번호';
COMMENT ON COLUMN notice_categrp.name is '카테고리 이름';
COMMENT ON COLUMN notice_categrp.seqno is '출력 순서';
COMMENT ON COLUMN notice_categrp.rdate is '그룹 생성일';
COMMENT ON COLUMN notice_categrp.cnt is '공지사항 등록개수';

-- 등록
INSERT INTO notice_categrp(categrpno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM notice_categrp),
                '공지사항', 1, sysdate, 0);
INSERT INTO notice_categrp(categrpno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM notice_categrp),
                '자료실', 2, sysdate, 0);
INSERT INTO notice_categrp(categrpno, name, seqno, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM notice_categrp),
                'Q&A', 3, sysdate, 0);
            
-- 목록            
SELECT * FROM notice_categrp ORDER BY categrpno ASC;

 CATEGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ----- ----- ------- --------------------- ---
         1 공지사항1     1 Y       2019-11-29 14:54:22.0   0
         2 공지사항2     2 Y       2019-11-29 14:54:23.0   0
         3 공지사항3     3 Y       2019-11-29 14:54:24.0   0

/**********************************/
/* Table Name: 설문 제목 카테고리 */
/**********************************/

-- 삭제
DROP TABLE survey_categrp;

-- 생성
CREATE TABLE survey_categrp (
  categrpno NUMBER(7) NOT NULL, -- -9999999 ~ 9999999
  name VARCHAR(20) NOT NULL,
  seqno NUMBER(7) NOT NULL,
  visible CHAR(1) DEFAULT 'Y' NOT NULL,
  rdate DATE NOT NULL,
  cnt NUMBER(7) DEFAULT 0 NOT NULL,
  PRIMARY KEY(categrpno)
);

COMMENT ON TABLE survey_categrp is '설문 카테고리 그룹';
COMMENT ON COLUMN survey_categrp.categrpno is '설문 카테고리 그룹번호';
COMMENT ON COLUMN survey_categrp.name is '설문 카테고리 이름';
COMMENT ON COLUMN survey_categrp.seqno is '출력 순서';
COMMENT ON COLUMN survey_categrp.visible is '출력 모드';
COMMENT ON COLUMN survey_categrp.rdate is '그룹 생성일';
COMMENT ON COLUMN notice_categrp.cnt is '설문지 응답 횟수';

-- 등록
INSERT INTO survey_categrp(categrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM survey_categrp),
                '1번 설문', 1, 'Y', sysdate, 0);
INSERT INTO survey_categrp(categrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM survey_categrp),
                '2번 설문', 1, 'Y', sysdate, 0);
INSERT INTO survey_categrp(categrpno, name, seqno, visible, rdate, cnt)
VALUES((SELECT NVL(MAX(categrpno), 0) + 1 as categrpno FROM survey_categrp),
                '3번 설문', 1, 'Y', sysdate, 0);
                
-- 목록            
SELECT * FROM survey_categrp ORDER BY categrpno ASC;                
                
 CATEGRPNO NAME  SEQNO VISIBLE RDATE                 CNT
 --------- ----- ----- ------- --------------------- ---
         1 1번 설문     1 Y       2019-11-29 15:21:44.0   0
         2 1번 설문     1 Y       2019-11-29 15:22:14.0   0
         3 2번 설문     1 Y       2019-11-29 15:22:15.0   0
         4 3번 설문     1 Y       2019-11-29 15:22:16.0   0
