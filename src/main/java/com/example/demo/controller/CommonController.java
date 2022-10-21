package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.UserService.UserService;
import com.example.demo.entity.User;

@Controller
public class CommonController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String homepage() {
		return "homepage";
	}
	
	@GetMapping("/signup")
	public String signUp() {
		return "signup";
	}

	@GetMapping("/signin")
	public String getsignin() {
		return "signin";
	}
	
	// process sign_up (register)
	@PostMapping("/process_signup")
	public String register(Model model, @ModelAttribute("user") User user) {
			
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(user.getPassword()) ;
		user.setPassword(encodedPassword);
		
		userService.saveUser(user);
			
		return "signin";
	}
}


