package dev.mvc.members;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.members.MembersProc")
public class MembersProc implements MembersProcInter {

  @Autowired
  private MembersDAOInter membersDAO;
  
  @Override
  public int mem_create(MembersVO membersVO) {
    
    int count = membersDAO.mem_create(membersVO);
    return count;
  }

  @Override
  public List<MembersVO> list_mem_no_asc() {
    List<MembersVO> list = membersDAO.list_mem_no_asc();
    return list;
  }

  @Override
  public int mem_checkId(String id) {
    int count = membersDAO.mem_checkId(id);
    return count;
  }

}
