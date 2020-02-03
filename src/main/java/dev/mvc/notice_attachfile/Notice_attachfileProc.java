package dev.mvc.notice_attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.notice_attachfile.Notice_attachfileProc")
public class Notice_attachfileProc implements Notice_attachfileProcInter {
  @Autowired
  private Notice_attachfileDAOInter notice_attachfileDAO; 
  
  @Override
  public int create(Notice_attachfileVO notice_attachfileVO) {
    int count = notice_attachfileDAO.create(notice_attachfileVO);
    return count;
  }

  @Override
  public List<Notice_attachfileVO> list() {
    List<Notice_attachfileVO> list = notice_attachfileDAO.list();
    return list;
  }

  @Override
  public List<Notice_attachfileVO> list_by_noticeno(int noticeno) {
    List<Notice_attachfileVO> list = notice_attachfileDAO.list_by_noticeno(noticeno);
    return list;
  }

  @Override
  public int delete(int attachfileno) {
    int count = notice_attachfileDAO.delete(attachfileno);
    return count;
  }

  @Override
  public int count_by_noticeno(int noticeno) {
    int count = notice_attachfileDAO.count_by_noticeno(noticeno);
    return count;
  }

  @Override
  public int delete_by_noticeno(int noticeno) {
    int count = notice_attachfileDAO.delete_by_noticeno(noticeno);
    return count;
  }

}




