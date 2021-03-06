package dev.mvc.notice_categrp;

import java.util.List;

public interface Notice_categrpProcInter {

  /** seqno 오름차순 출력 */
  public List<Notice_categrpVO> list_seqno_asc();
  
  /** 카테고리 추가 */
  public int create(Notice_categrpVO notice_categrpVO);
  
  /** 카테고리 삭제 */
  public int delete(int categrpno);
  
  /** 카테고리 조회 */
  public Notice_categrpVO read(int categrpno);
  
  /** 카테고리 수정 */
  public int update(Notice_categrpVO notice_categrpVO);
  
  /** seqno 우선순위 상향 */
  public int update_seqno_up(int categrpno);
  
  /** seqno 우선순위 하향 */
  public int update_seqno_down(int categrpno);
  
  /** 그룹에 속한 컨텐츠 글수 증가 */
  public int increaseCnt(int categrpno);
  
  /** 그룹에 속한 컨텐츠 글수 감소 */
  public int decreaseCnt(int categrpno);
  
  /** cnt 컬럼 0으로 초기화 */
  public int cnt_zero(int categrpno);
  
  
  
  
  
}



