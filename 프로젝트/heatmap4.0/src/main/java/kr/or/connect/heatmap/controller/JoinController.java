package kr.or.connect.heatmap.controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.connect.heatmap.config.ApplicationConfig;
import kr.or.connect.heatmap.dao.MemberDao;
import kr.or.connect.heatmap.dto.Member;


@Controller
public class JoinController {

	
	@GetMapping("/join")
	public String joina() {
		return "join";
	}
	
	
	
	@PostMapping("/JoinControl") //회원가입
	public String upload(@ModelAttribute Member member, HttpServletResponse response, HttpServletRequest request) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		MemberDao formdao2 = ac.getBean(MemberDao.class);
		List<Member> list = formdao2.selectAll();
		
		//이메일 정규화
		String pattern1 = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
		//String pattern2 = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		String IdStatus = "true";
		
		for(Member member1 : list) {
			if(member1.getId().equals(member.getId())) {
				IdStatus = "false";   //id중복임을 나타내는 변수
				script.println("<script>alert('아이디가 이미 있습니다.'); history.go(-1);</script>");
				script.close();
				//IdStatus = "false";
				break;
			}
		}
		
		if(member.getId() == null || member.getPassword() == null || member.getEmail() == null ||  member.getPassword2() == null) {
			
			//PrintWriter script = response.getWriter();
			script.println("<script>alert('미입력 정보있음.'); history.go(-1);</script>");
			script.close();
			
		}
		else if((member.getPassword().equals(member.getPassword2())) != true){ //비밀번호 불일치
			

			script.println("<script>alert('비밀번호 불일치.'); history.go(-1);</script>");
			script.close();
			
			
		}
		else if(!(Pattern.matches(pattern1, member.getEmail()))) {
			script.println("<script>alert('이메일 형식 불일치.'); history.go(-1);</script>");
			script.close();
			
		}
		else if(IdStatus.equals("false")) {  //아이디 중복확인을 거친후 해당 문구가 없으면 db등록 
			script.println("<script> history.go(-1);</script>");
			script.close();
			
		}
		
		
		else {   // 페이지에서 받아온 정보들은 insert전 확인 작업을 통해 확인이 되면 그때 dao객체 관련을 생성하여 넣어야함 (아니면 넣고 확인하는 작업이라 의미X)
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(member.getPassword().getBytes());
			String hex = String.format("%064x", new BigInteger(1, md.digest()));
			member.setPassword(hex);
			
			
			formdao2.insert2(member, "user");   //insert를 통해 sql에 추가 부분
			
			HttpSession session = request.getSession();

			
			session.setAttribute("id", member.getId());
			session.setAttribute("mtype", "user");
			script.println("<script>alert('회원가입 완료.'); location.href = '/heatmap/';</script>");
			script.close();
			
		}
		
		
		
		return "main"; //else를 통해 마무리시 메인 화면으로
	}
	
}
