package dev.mvc.notice;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언 
public interface NoticeDAOInter {
	
  // 매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.
  /** seqno 오름차순 출력 */
  public List<NoticeVO> list_seqno_asc();
  
  /** 카테고리 추가 */
  public int create(NoticeVO noticeVO);
  
  /** 카테고리 삭제 */
  public int delete(int categrpno);
  
  /** 카테고리 조회 */
  public NoticeVO read(int categrpno);
  
  /** 카테고리 수정 */
  public int update(NoticeVO notice);
  
  
  
}







