package kr.or.connect.heatmap.controller;

import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RealLoginController {
	
	@GetMapping("/RealLogin")
	public String reallogin() {
		return "RealLogin";
	}
	

	


	
	
	
	
	
}
