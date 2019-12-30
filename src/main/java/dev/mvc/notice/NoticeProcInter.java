package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {

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



