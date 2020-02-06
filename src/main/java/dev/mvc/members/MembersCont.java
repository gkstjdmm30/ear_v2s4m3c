package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class MembersCont {
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc") // 이름 지정
  private MembersProcInter membersProc;
  public MembersCont() {
    System.out.println("MemebersCont created");
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
      mav.setViewName("redirect:/members/mem_create_msg.jsp?count=" + count);      
    } else {
      mav.setViewName("redirect:/index.jsp");
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

    String ck_id = ""; // id 저장 변수
    String ck_id_save = ""; // id 저장 여부를 체크하는 변수
    String ck_passwd = ""; // passwd 저장 변수
    String ck_passwd_save = ""; // passwd 저장 여부를 체크하는 변수

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
        
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
    
    mav.setViewName("/members/mem_login");
       
    return mav;
  }
  
  @RequestMapping(value = "/members/mem_login.do", method = RequestMethod.POST)
  public ModelAndView mem_login_proc(HttpServletRequest request,
                                                  HttpServletResponse response,
                                                  HttpSession session,
                                                  String id, String passwd,
                                                  @RequestParam(value="id_save", defaultValue="") String id_save,
                                                  @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    
    int count = membersProc.mem_login(map);
    if (count == 1) { // 로그인 성공
      MembersVO membersVO = membersProc.mem_readByID(id);
      session.setAttribute("membersno",  membersVO.getMembersno());
      session.setAttribute("id", id);
      session.setAttribute("name", membersVO.getName());
      session.setAttribute("ps", membersVO.getPs());
      
      if (id_save.equals("Y")) { // id를 저장할 경우
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
        response.addCookie(ck_id);
      } else { // N, id를 저장하지 않는 경우
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      
      if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
        Cookie ck_passwd = new Cookie("ck_passwd", passwd);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, 패스워드를 저장하지 않을 경우
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
        
      mav.setViewName("redirect:/index.jsp");
    } else {
      mav.setViewName("redirect:/members/mem_login_fail_msg.jsp");
    }
    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/member/mem_checkId.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String checkId(String id) {
    int count = membersProc.mem_checkId(id);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString();
  }
  

  @RequestMapping(value = "/members/mem_read.do", 
                                          method = RequestMethod.GET)
  public ModelAndView mem_read(int membersno) {
    ModelAndView mav = new ModelAndView();

    MembersVO membersVO = membersProc.mem_read(membersno);
    mav.addObject("membersVO", membersVO);

    mav.setViewName("/members/mem_read");

    return mav;
  }
  
  @RequestMapping(value = "/members/mem_update.do", 
      method = RequestMethod.POST)
  public ModelAndView mem_update(RedirectAttributes ra, MembersVO membersVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = membersProc.mem_update(membersVO);
    ra.addAttribute("count", count);
    ra.addAttribute("membersno", membersVO.getMembersno());
    mav.setViewName("redirect:/members/mem_update_msg.jsp");
    return mav;  
  }
  
  @RequestMapping(value="/members/passwd_update.do", method = RequestMethod.GET)
  public ModelAndView passwd_update(int membersno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/passwd_update");
    return mav;
  }
  
  @RequestMapping(value="/members/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(RedirectAttributes ra, int membersno,
                                                  String passwd, String new_passwd) {
    ModelAndView mav = new ModelAndView();
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("membersno", membersno);
    map.put("passwd", passwd);
    int count = membersProc.passwd_check(map);
    int update_count = 0;
    
    if(count ==0) {
      ra.addAttribute("count", count);
      mav.setViewName("redirect:/members/passwd_update_fail_msg.jsp");
    } else {
      map.put("passwd",  new_passwd);
      update_count = membersProc.passwd_update(map);
      ra.addAttribute("update_count", update_count);
      mav.setViewName("redirect:/members/passwd_update_success_msg.jsp");
    }
    return mav;
  }
  
  @RequestMapping(value = "/members/mem_logout.do", method=RequestMethod.GET)
  public ModelAndView mem_logout(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    session.invalidate();
    mav.setViewName("redirect:/members/mem_logout.jsp");
    return mav;
  }
  
  @RequestMapping(value="/members/mem_delete.do", method = RequestMethod.GET)
  public ModelAndView mem_delete(int membersno) {
    ModelAndView mav = new ModelAndView();
    
    MembersVO membersVO = membersProc.mem_read(membersno);
    mav.addObject("membersVO", membersVO);
    
    mav.setViewName("/members/mem_delete");
    return mav;
  }
  
  @RequestMapping(value="/members/mem_delete.do", method = RequestMethod.POST)
  public ModelAndView mem_delete(RedirectAttributes ra, int membersno) {
    ModelAndView mav = new ModelAndView();
    String name = membersProc.mem_read(membersno).getName();
    String id = membersProc.mem_read(membersno).getId();
    ra.addAttribute("name", name);
    ra.addAttribute("id", id);
    int count = membersProc.mem_delete(membersno);
    ra.addAttribute("count", count);
    mav.setViewName("redirect:/members/mem_delete_msg.jsp?count=" + count);
    return mav;
  }
  
}
