package dev.mvc.members;

import java.util.List;

public interface MembersProcInter {
  public int mem_create(MembersVO membersVO);
  public List<MembersVO> list_mem_no_asc();
  
  public int mem_checkId(String id);
}
