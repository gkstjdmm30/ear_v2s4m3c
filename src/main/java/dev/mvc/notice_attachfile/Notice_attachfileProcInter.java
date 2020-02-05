package dev.mvc.notice_attachfile;

import java.util.List;

public interface Notice_attachfileProcInter {
 
  /**
   * <xmp>
   * 파일 등록
   * <insert id="create" parameterType="Notice_attachfileVO">
   * </xmp>
   * @param notice_attachfileVO
   * @return
   */
  public int create(Notice_attachfileVO notice_attachfileVO);
    
  /**
   * 파일 목록
   * @return
   */
  public List<Notice_attachfileVO> list();
  
  /**
   * noticeno별 첨부 파일 목록 
   * @param noticeno
   * @return
   */
  public List<Notice_attachfileVO> list_by_noticeno(int noticeno);
  
  /**
   * 번호에따른 파일 삭제 
   * @param noticeno
   * @return 삭제된 레코드 갯수
   */
  public int delete(int attachfileno); 
  
  /**
   * noticeno 별 레코드 갯수
   * @param noticeno
   * @return 레코드 갯수
   */
  public int count_by_noticeno(int noticeno);
  
  /**
   * contentsno 별 레코드 삭제
   * @param contentsno
   * @return 레코드 갯수
   */
  public int delete_by_noticeno(int noticeno);
  
}





