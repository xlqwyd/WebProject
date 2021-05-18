package kr.or.connect.heatmap.controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.connect.heatmap.config.ApplicationConfig;
import kr.or.connect.heatmap.dao.MemberDao;
import kr.or.connect.heatmap.dto.Member;

@Controller
public class RealLoginController {
	//@Autowired
	//private UserMailSendService mailsender;



	
	@GetMapping("/RealLogin")
	public String reallogin() {
		return "RealLogin";
	}
	
	@RequestMapping("/logout")  //로그아웃부분
    public ModelAndView logout(HttpSession session, HttpServletResponse response) throws Exception {
		//PrintWriter script = response.getWriter();
        session.invalidate();  //세션 초기화
       /* response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		script.println("<script>alert('logout complete.');</script>");
		script.close();
		*/
        ModelAndView mv = new ModelAndView("redirect:/");   //돌아가기
        return mv;
        
    }
	
	@GetMapping("/PasswordSearch")
	public String PasswordSearch() { //비밀번호 찾기 페이지 이동시키기
		return "PasswordSearch";
	}
	
	@PostMapping("/RealLoginControl") //로그인 부분
	public String login(@ModelAttribute Member member, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
		
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		MemberDao formdao3 = ac.getBean(MemberDao.class);
		
		List<Member> list = formdao3.selectAll();// sql의 회원정보 다 갖고오는 작업
		
		
		for(Member member1 : list) {
			if(member1.getId().equals(member.getId())) {// id 일치시 (일치할때까지 for문 돌림)
				
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(member.getPassword().getBytes());
				String hex = String.format("%064x", new BigInteger(1, md.digest()));
				
				if(member1.getPassword().equals(hex)) { //id,비번 일치
					HttpSession session = request.getSession();
					
					if(member1.getMtype().equals("admin")) {
						session.setAttribute("id", member.getId());
						session.setAttribute("mtype", member1.getMtype());
						script.println("<script>alert('로그인 성공.'); location.href = '/heatmap/';</script>");
						script.close();
						break;
					}

					else {
					session.setAttribute("id", member.getId()); //일치동시에 해당 id 세션에 넘김
					session.setAttribute("mtype", member1.getMtype());
					
					script.println("<script>alert('로그인 성공.'); location.href = '/heatmap/';</script>");
					script.close();
					break;  //확인 되었으니 탈출
					}
					
				}
				else {//비번 불일치 (ID에서 일치확인후 비밀번호 확인이기 때문에 for문 영향X)
					script.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
					script.close();
					break;
					
				}
			}
			
			
			
		}
		//  아이디 없을시(리스트 목록 다 둘러보고 없는것을 확인)
		script.println("<script>alert('존재하지 않는 ID입니다.'); history.back();</script>");
		script.close();
		
		
		return "RealLogin";
	}


	


	
	
	
	
	
}
