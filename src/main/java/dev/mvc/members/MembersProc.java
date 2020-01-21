package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

  @Override
  public MembersVO mem_read(int membersno) {
    MembersVO list = membersDAO.mem_read(membersno);
    return list;
  }

  @Override
  public int mem_update(MembersVO membersVO) {
    int count = membersDAO.mem_update(membersVO);
    return count;
  }

  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int count = membersDAO.passwd_check(map);
    return count;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int count = membersDAO.passwd_update(map);
    return count;
  }

  @Override
  public int mem_delete(int membersno) {
    int count = membersDAO.mem_delete(membersno);
    return count;
  }

  @Override
  public int mem_login(Map<Object, Object> map) {
    int count = membersDAO.mem_login(map);
    return count;
  }

  @Override
  public MembersVO mem_readByID(String id) {
    MembersVO membersVO = membersDAO.mem_readByID(id);
    return membersVO;
  }

}
