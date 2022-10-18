package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String signin() {
		return "signin";
	}
	
	@GetMapping("/signup")
	public String signUp() {
		return "signup";
	}

	@GetMapping("/homepage")
	public String homePage() {
		return "homepage";
	}
	
	@PostMapping("/process_signup")
	public String registerUser(Model model, @ModelAttribute("user") User user) {
		userService.saveUser(user); // we dont have any checking if user exist for now, but later
		return "/signin";
	}
}


