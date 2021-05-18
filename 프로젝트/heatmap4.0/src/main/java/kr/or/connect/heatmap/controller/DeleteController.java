package kr.or.connect.heatmap.controller;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class DeleteController {
	
	@GetMapping("/delete")
	public String delete() {
		return "delete";
	}

	
	@PostMapping("/DeleteControl")  //회원탈퇴
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
				String hex = String.format("%064x", new BigInteger(1, md.digest()));  //db에는 해시함수형태 비번임으로 변경해서 확인작업 필요
				
				if(member1.getPassword().equals(hex)) { //id,비번 일치
					
					formdao3.delete(member1.getId());
					script.println("<script>alert('정상처리 되었습니다.'); location.href = '/heatmap/';</script>");
					script.close();
					break;
					
					
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
