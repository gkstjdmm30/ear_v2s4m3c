package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MembersDAOInter {
  public int mem_create(MembersVO membersVO);
  public List<MembersVO> list_mem_no_asc();
  public int mem_checkId(String id);
  public MembersVO mem_read(int membersno);
  public MembersVO mem_readByID(String id);
  public int mem_update(MembersVO membersVO);
  public int passwd_check(HashMap<Object, Object> map);
  public int passwd_update(HashMap<Object, Object> map);
  public int mem_delete(int membersno);
  public int mem_login(Map<Object, Object> map);
  
}
