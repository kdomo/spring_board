package kh.com.board.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/toSignup")
	public String toSignup() {
		return "member/signup";
	}
	
	@RequestMapping(value = "/checkId")
	@ResponseBody // 비동기 통신 응답값이 있을때
	public String checkId(String id) throws Exception {
		if(service.checkId(id)) {
			return "available";
		}else {
			return "unavailable";
		}
	}
	
	@RequestMapping(value="/signup")
	public String signup(MemberDTO dto,Model model) throws Exception {
		service.signup(dto);
		model.addAttribute("rs", "true");
		return "home";
	}
	
	@RequestMapping(value="/login",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String login(String id , String password,Model model) throws Exception {
		if(service.login(id,password)) {
			MemberDTO dto = service.getMember(id);
			System.out.println(dto.toString());
			session.setAttribute("loginSession", dto);
			return "loginSuccess";
			
		}else {
			return "loginFail";
		}
	}
	
	@RequestMapping(value="/toWelCome")
	public String toWelCome() throws Exception{
		return "member/welcome";
	}
	
	@RequestMapping(value="/logout")
	public String logout() throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/toModify")
	public String toModify() throws Exception{
		return "member/modify";
	}
	
	@RequestMapping(value="/modify")
	public String modify(MemberDTO dto) throws Exception{
		service.modify(dto);
		session.setAttribute("loginSession", dto);
		return "member/modify";
	}
}
