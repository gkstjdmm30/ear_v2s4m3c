/**********************************/
/* Table Name: 회원 */
/**********************************/

/**********************************/
/* Table Name: 공지사항 카테고리 그룹 */
/**********************************/
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

/**********************************/
/* Table Name: 공지사항 */
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

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항 번호';
COMMENT ON COLUMN notice.categrpno is '카테고리 그룹번호';
COMMENT ON COLUMN notice.title is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.recom is '추천수';
COMMENT ON COLUMN notice.cnt is '조회수';
COMMENT ON COLUMN notice.replycnt is '댓글수';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.word is '검색어';

1) 등록
-- PK 생성
SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice;

 CONTENTSNO
 ----------
          1

INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '제목1', '내용1',
             0, 0, 0, sysdate, '검색어1');
             
INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '제목2', '내용2',
             0, 0, 0, sysdate, '검색어2');
             
INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '제목3', '내용3',
             0, 0, 0, sysdate, '검색어3');
             
INSERT INTO notice(noticeno,
                                categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
             1, '제목4', '내용4',
             0, 0, 0, sysdate, '검색어4');
             
 SELECT * FROM notice;

-- ORA-02291: integrity constraint (AI.SYS_C007068) violated - parent key not found
-- FK 컬럼의 값이 부모 테이블에 등록되어 있지 않아서 발생
-- member 테이블 목록 확인
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
        
-- categrp 테이블 목록 확인                                
SELECT categrpno, name, seqno, visible, rdate, cnt
FROM categrp
ORDER BY seqno ASC;

 CATEGRPNO NAME  SEQNO VISIBLE RDATE             CNT
 --------- ----- ----- ------- --------------------- ---
         1 해외 여행     1 Y       2019-11-25 16:08:23.0   0
         2 국내 여행     2 Y       2019-11-25 16:08:24.0   0
         3 개발 자료     3 N       2019-11-25 16:08:25.0   0

-- 1) contents 등록(member: 1, categrpno: 1),
--     varchar에 '' 등록되면 null이 insert 됨
INSERT INTO contents(contentsno, 
                                memberno, categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word)
VALUES((SELECT NVL(MAX(contentsno), 0) + 1 as contentsno FROM contents),
             1, 1, '제목1', '내용1',
             0, 0, 0, sysdate, '');

-- 2) 목록
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
ORDER BY contentsno DESC;
 CONTENTSNO MEMBERNO CATEGRPNO TITLE CONTENT RECOM CNT REPLYCNT RDATE                 WORD
 ---------- -------- --------- ----- ------- ----- --- -------- --------------------- ----
          1        1         1 제목1   내용1         0   0        0 2019-11-25 16:14:17.0 NULL

-- 3) categrpno별 전체 목록
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=1 -- 1: 해외 여행, 2: 국내 여행
ORDER BY contentsno DESC;

-- 4) 전체 레코드 수
SELECT COUNT(*) as count
FROM contents;
             
-- 5) 조회
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE contentsno=1;

-- 6) 수정
UPDATE contents
SET title='제목 수정', content='내용 수정', word='검색어'
WHERE contentsno = 1;

-- 7) 삭제
DELETE FROM contents
WHERE contentsno=1;

-- 8) FK 부모 테이블별 레코드 갯수 산출
SELECT contentsno, memberno, categrpno, title
FROM contents
WHERE categrpno=6;

 CONTENTSNO MEMBERNO CATEGRPNO TITLE
 ---------- -------- --------- -----------------------
          3          1                6                  12월 객실 예약안내
          5          1                6                  이번주 폭설로 심야 개장합니다.
          7          1                6                  스키장 입구 폭설로 고속도로에서 진입해주세요~

SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=6;

 CNT
 ---
   3             
             
-- 9) FK 부모 테이블별 레코드 삭제
DELETE FROM contents
WHERE categrpno=6;

(3 rows affected)

10) 댓글수 증가
UPDATE contents
SET replycnt = replycnt + 1
WHERE contentsno = 1;

11) 댓글수 감소
UPDATE contents
SET replycnt = replycnt - 1
WHERE contentsno = 1;

12) 검색
① categrpno별 검색 목록
SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%스위스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%스의스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%수의스%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%swiss%'
ORDER BY contentsno DESC;

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word
FROM contents
WHERE categrpno=2 AND word LIKE '%유럽%'
ORDER BY contentsno DESC;

② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=2;

-- 검색 레코드 갯수
SELECT COUNT(*) as cnt
FROM contents
WHERE categrpno=2 AND word LIKE '%스위스%';

   
   
   




