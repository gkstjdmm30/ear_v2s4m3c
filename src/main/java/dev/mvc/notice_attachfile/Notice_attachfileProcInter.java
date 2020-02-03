package dev.mvc.notice_attachfile;

import java.util.List;

public interface Notice_attachfileProcInter {
 
  /**
   * <xmp>
   * ���� ���
   * <insert id="create" parameterType="Notice_attachfileVO">
   * </xmp>
   * @param notice_attachfileVO
   * @return
   */
  public int create(Notice_attachfileVO notice_attachfileVO);
    
  /**
   * ���� ���
   * @return
   */
  public List<Notice_attachfileVO> list();
  
  /**
   * noticeno�� ÷�� ���� ��� 
   * @param noticeno
   * @return
   */
  public List<Notice_attachfileVO> list_by_noticeno(int noticeno);
  
  /**
   * ��ȣ������ ���� ���� 
   * @param noticeno
   * @return ������ ���ڵ� ����
   */
  public int delete(int attachfileno); 
  
  /**
   * noticeno �� ���ڵ� ����
   * @param noticeno
   * @return ���ڵ� ����
   */
  public int count_by_noticeno(int noticeno);
  
  /**
   * contentsno �� ���ڵ� ����
   * @param contentsno
   * @return ���ڵ� ����
   */
  public int delete_by_noticeno(int noticeno);
  
}





