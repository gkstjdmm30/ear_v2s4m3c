package dev.mvc.notice_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.notice_categrp.Notice_categrpVO;

// ���� �̸� ����
@Component("dev.mvc.notice_categrp.Notice_categrpProc")
public class Notice_categrpProc implements Notice_categrpProcInter {
  // CategrpDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private Notice_categrpDAOInter notice_categrpDAO; 

  @Override
  public List<Notice_categrpVO> list_seqno_asc() {
    List<Notice_categrpVO> list = notice_categrpDAO.list_seqno_asc();
    
    return list;
  }

	@Override
	public int create(Notice_categrpVO notice_categrpVO) {
		int count = notice_categrpDAO.create(notice_categrpVO);
		return count;
	}

	@Override
	public int delete(int categrpno) {
		int count = notice_categrpDAO.delete(categrpno);
		return count;
	}

	@Override
	public Notice_categrpVO read(int categrpno) {
		Notice_categrpVO notice_categrpVO = notice_categrpDAO.read(categrpno);
		return notice_categrpVO;
	}

	@Override
	public int update(Notice_categrpVO notice_categrpVO) {
		int count = notice_categrpDAO.update(notice_categrpVO);
		return count;
	}

	@Override
	public int update_seqno_down(int categrpno) {
		int count = notice_categrpDAO.update_seqno_up(categrpno);
		return count;
	}
	
	@Override
	public int update_seqno_up(int categrpno) {
		int count = notice_categrpDAO.update_seqno_down(categrpno);
		return count;
	}

	@Override
	public int increaseCnt(int categrpno) {
		int count = notice_categrpDAO.increaseCnt(categrpno);
		return count;
	}

	@Override
	public int decreaseCnt(int categrpno) {
		int count = notice_categrpDAO.decreaseCnt(categrpno);
		return count;
	}



}



