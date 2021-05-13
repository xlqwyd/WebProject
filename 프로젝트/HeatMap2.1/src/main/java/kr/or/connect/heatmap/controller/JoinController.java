package kr.or.connect.heatmap.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.connect.heatmap.dto.Member;


@Controller
@RequestMapping("/signup/*")
public class JoinController {

	
	@GetMapping("/join")
	public String joina() {
		return "join";
	}
	
	
	






	//@PostMapping("/JoinControl")
}
