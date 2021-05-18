package kr.or.connect.heatmap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapCheck {

	@GetMapping("/mapCheck")
	public String joina() {
		return "mapCheck";
	}
}
