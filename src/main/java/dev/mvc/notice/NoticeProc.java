package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.notice.NoticeVO;

// 빈의 이름 지정
@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
  // CategrpDAOInter가 MyBATIS를 호출하는 코드가 자동구현됨.
  // 자동 구현된 클래스의 객체가 자동 할당됨.
  @Autowired
  private NoticeDAOInter noticeDAO; 

  @Override
  public List<NoticeVO> list_seqno_asc() {
    List<NoticeVO> list = noticeDAO.list_seqno_asc();
    
    return list;
  }

	@Override
	public int create(NoticeVO noticeVO) {
		int count = noticeDAO.create(noticeVO);
		return count;
	}

	@Override
	public int delete(int categrpno) {
		int count = noticeDAO.delete(categrpno);
		return count;
	}

	@Override
	public NoticeVO read(int categrpno) {
		NoticeVO noticeVO = noticeDAO.read(categrpno);
		return noticeVO;
	}

	@Override
	public int update(NoticeVO noticeVO) {
		int count = noticeDAO.update(noticeVO);
		return count;
	}
	



}



