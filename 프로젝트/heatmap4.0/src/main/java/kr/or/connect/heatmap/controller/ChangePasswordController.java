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
public class ChangePasswordController {
	
	@GetMapping("/ChangePassword")
	public String changepassword() {
		return "ChangePassword";
	}
	
	
	@PostMapping("/ChangePasswordControl") //비밀번호 변경
	public String password(@ModelAttribute Member member, HttpServletResponse response, HttpServletRequest request) throws Exception {
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
					
					
					if(member.getChangepassword().equals(member.getChangepassword2())) {  //변경할 비밀번호 일치 확인
						md.update(member.getChangepassword().getBytes());
						String hex2 = String.format("%064x", new BigInteger(1, md.digest()));  //바뀐 비밀번호 해시함수로 변경
						
						Member mem = new Member();  // 수정을 위한 하나의 객체 생성
						mem.setPassword(hex2);  // 수정할 비번
						mem.setId(member1.getId());  // id일치를 위한 코드
						formdao3.update(mem);  //수정 
						
						script.println("<script>alert('변경 성공.'); location.href = '/heatmap/';</script>");
						script.close();
						break;
					}

					else {  //변경할 비번 확인이 틀릴때
					
					
					script.println("<script>alert('비밀번호 확인이 일치하지 않습니다.'); history.back();</script>");
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
		script.println("<script>alert('ID를 다시 확인해주세요.'); history.back();</script>");
		script.close();
		
		
		return "RealLogin";
	}

	
	
}
