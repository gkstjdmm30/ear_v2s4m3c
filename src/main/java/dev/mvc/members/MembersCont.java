package dev.mvc.members;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MembersCont {
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc") // �̸� ����
  private MembersProcInter membersProc;
  public MembersCont() {
    System.out.println("MemeberCont created");
  }
  
  @RequestMapping(value="/members/mem_create.do", method = RequestMethod.GET)
  public ModelAndView mem_create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/mem_create");
    return mav;
  }

  @RequestMapping(value="/members/mem_create.do", method = RequestMethod.POST)
  public ModelAndView mem_create(MembersVO membersVO) {
    ModelAndView mav = new ModelAndView();
    int count = membersProc.mem_create(membersVO);
    
    if(count ==0) {
      mav.setViewName("redirecct:/members/mem_create_msg.jsp?count=" + count);      
    } else {
      mav.setViewName("redirect:/members/list.do");
    }
    return mav;
  }
//  http://localhost:9090/team4/members/mem_list.do
  @RequestMapping(value="/members/mem_list.do", method=RequestMethod.GET)
  public ModelAndView mem_list() {
    ModelAndView mav = new ModelAndView();
    List<MembersVO> list = membersProc.list_mem_no_asc();
    
    mav.addObject("list", list);
    mav.setViewName("/members/mem_list");
    return mav;
  }
  
  @RequestMapping(value="/members/mem_login.do", method=RequestMethod.GET)
  public ModelAndView mem_login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id ���� ����
    String ck_id_save = ""; // id ���� ���θ� üũ�ϴ� ����
    String ck_passwd = ""; // passwd ���� ����
    String ck_passwd_save = ""; // passwd ���� ���θ� üũ�ϴ� ����

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // ��Ű ��ü ����
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    
    mav.setViewName("/member/mem_login");
       
    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/member/mem_checkId.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String checkId(String mem_id) {
    // System.out.println("--> id: " + id);
    int count = membersProc.mem_checkId(mem_id);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
}
