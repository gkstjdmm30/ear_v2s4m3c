/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		memberno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE member is '회원';
COMMENT ON COLUMN member.memberno is '회원번호';


/**********************************/
/* Table Name: 카테고리 그룹 */
/**********************************/
CREATE TABLE CATEGRP(
		CATEGRPNO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		NAME                          		VARCHAR2(50)		 NOT NULL,
		SEQNO                         		NUMBER(7)		 NOT NULL,
		VISIBLE                       		CHAR(1)		 NOT NULL,
		RDATE                         		DATE		 NOT NULL,
		CNT                           		NUMBER(7)		 NULL 
);

COMMENT ON TABLE CATEGRP is '카테고리 그룹';
COMMENT ON COLUMN CATEGRP.CATEGRPNO is '카테고리 그룹 번호';
COMMENT ON COLUMN CATEGRP.NAME is '이름';
COMMENT ON COLUMN CATEGRP.SEQNO is '출력 순서';
COMMENT ON COLUMN CATEGRP.VISIBLE is '출력 모드';
COMMENT ON COLUMN CATEGRP.RDATE is '그룹 생성일';
COMMENT ON COLUMN CATEGRP.CNT is '등록된 자료수';


/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsno                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memberno                      		NUMBER(10)		 NOT NULL,
		CATEGRPNO                     		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(300)		 NOT NULL,
		content                       		CLOB(10)		 NOT NULL,
		recom                         		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cnt                           		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		replycnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		word                          		VARCHAR2(100)		 NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (CATEGRPNO) REFERENCES CATEGRP (CATEGRPNO)
);

COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsno is '컨텐츠번호';
COMMENT ON COLUMN contents.memberno is '회원번호';
COMMENT ON COLUMN contents.CATEGRPNO is '카테고리 그룹 번호';
COMMENT ON COLUMN contents.title is '제목';
COMMENT ON COLUMN contents.content is '내용';
COMMENT ON COLUMN contents.recom is '추천수';
COMMENT ON COLUMN contents.cnt is '조회수';
COMMENT ON COLUMN contents.replycnt is '댓글수';
COMMENT ON COLUMN contents.rdate is '등록일';
COMMENT ON COLUMN contents.word is '검색어';

/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
DROP TABLE notice_attachfile;
CREATE TABLE notice_attachfile(
		attachfileno                  NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		noticeno                   NUMBER(10)		 NULL ,
		fname                         	VARCHAR2(100)		 NOT NULL,
		fupname                      VARCHAR2(100)		 NOT NULL,
		thumb                         VARCHAR2(100)		 NULL ,
		fsize                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
    rdate                           DATE     NOT NULL,
  FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
);

COMMENT ON TABLE notice_attachfile is '첨부파일';
COMMENT ON COLUMN notice_attachfile.attachfileno is '첨부파일번호';
COMMENT ON COLUMN notice_attachfile.noticeno is '컨텐츠번호';
COMMENT ON COLUMN notice_attachfile.fname is '원본 파일명';
COMMENT ON COLUMN notice_attachfile.fupname is '업로드 파일명';
COMMENT ON COLUMN notice_attachfile.thumb is 'Thumb 파일';
COMMENT ON COLUMN notice_attachfile.fsize is '파일 사이즈';
COMMENT ON COLUMN notice_attachfile.rdate is '등록일';

-- 1) 등록
SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile;

 ATTACHFILENO
 ------------
            1

SELECT contentsno, memberno, categrpno, title
FROM contents
ORDER BY contentsno ASC;
 
CONTENTSNO MEMBERNO CATEGRPNO TITLE
 ---------- -------- --------- -----
          1        1         1 삼양 목장

          
INSERT INTO notice_attachfile(attachfileno, noticeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM notice_attachfile),
             1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO notice_attachfile(attachfileno, noticeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM notice_attachfile),
             1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO notice_attachfile(attachfileno, noticeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM notice_attachfile),
             1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        
             
-- 2) 목록( contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachfileno, contentsno, fname, fupname, thumb, fsize, rdate
FROM attachfile
ORDER BY contentsno DESC,  attachfileno ASC;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB          FSIZE RDATE
 ------------ ---------- ------------ -------------- -------------- ----- ---------------------
            1          1 samyang.jpg  samyang_1.jpg  samyang_t.jpg   1000 2019-12-04 14:50:51.0
            2          1 samyang2.jpg samyang2_1.jpg samyang2_t.jpg  2000 2019-12-04 14:50:52.0
            3          1 samyang3.jpg samyang3_1.jpg samyang3_t.jpg  3000 2019-12-04 14:50:53.0

-- 3) 글별 파일 목록(contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachfileno, contentsno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE contentsno = 1
ORDER BY fname ASC;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car1.jpg     car1_0.jpg   car1_0_t.jpg    12099 2019-12-04 15:01:20.0
            2          1 car2.jpg     car2_0.jpg   car2_0_t.jpg    10553 2019-12-04 15:01:20.0
            3          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            4          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            5          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0
            9          1 moon.zip     moon.zip     NULL           292777 2019-12-05 10:14:12.0
            6          1 spring18.jpg spring18.jpg spring18_t.jpg 444455 2019-12-05 09:55:07.0
            7          1 spring19.jpg spring19.jpg spring19_t.jpg 126983 2019-12-05 09:55:07.0
            8          1 spring20.jpg spring20.jpg spring20_t.jpg 345322 2019-12-05 09:55:07.0

-- 4) 하나의 파일 삭제
DELETE FROM attachfile
WHERE attachfileno = 1;


-- 5) FK contentsno 부모 테이블별 레코드 갯수 산출
SELECT attachfileno, contentsno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE contentsno=1;

ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

SELECT COUNT(*) as cnt
FROM attachfile
WHERE contentsno=1;

 CNT
 ---
   3             
             
-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM attachfile
WHERE contentsno=1;

(3 rows affected)

   
7) Contents, Attachfile join
    SELECT c.title, 
               a.attachfileno, a.contentsno, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
    FROM contents c, attachfile a
    WHERE c.contentsno = a.contentsno
    ORDER BY c.contentsno DESC,  a.attachfileno ASC;
   
 TITLE     ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB            FSIZE  RDATE
 --------- ------------ ---------- ------------ -------------- ---------------- ------ ---------------------
 크리스마스            4          2 winter14.jpg winter14.jpg   winter14_t.jpg   160966 2019-12-17 12:43:24.0
 크리스마스            5          2 winter15.jpg winter15.jpg   winter15_t.jpg   180887 2019-12-17 12:43:24.0
 크리스마스            6          2 winter16.jpg winter16.jpg   winter16_t.jpg    53359 2019-12-17 12:43:24.0
 겨울 여행              1          1 winter01.jpg winter01_0.jpg winter01_0_t.jpg 171853 2019-12-17 12:42:46.0
 겨울 여행              2          1 winter02.jpg winter02_0.jpg winter02_0_t.jpg 176114 2019-12-17 12:42:47.0
 겨울 여행              3          1 winter03.jpg winter03_0.jpg winter03_0_t.jpg 192743 2019-12-17 12:42:47.0













