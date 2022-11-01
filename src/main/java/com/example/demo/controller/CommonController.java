package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.UserService.CustomUserDetails;
import com.example.demo.UserService.UserService;
import com.example.demo.entity.User;

@Controller
public class CommonController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/signup")
	public String signUp() {
		return "signup";
	}

	@GetMapping("/signin")
	public String getsignin() {
		return "signin";
	}
	
	// register new user
		@PostMapping("/process_signup")
		public String registerNewUser(User user, HttpServletRequest request)
				throws UnsupportedEncodingException, MessagingException {
			userService.register(user, getSiteURL(request));
			return "signin";
		}
		
		@GetMapping("/profile")
		public String getProfilePage(HttpServletRequest request,
				Model model, @AuthenticationPrincipal CustomUserDetails loggedinUser) {
			
			String username = loggedinUser.getUsername();
			model.addAttribute("username", username);
			
			Integer user_id = Integer.parseInt(request.getParameter("id"));
			model.addAttribute("user_id", user_id);
			
			User user = userService.getUserById(user_id);
			model.addAttribute("user", user);
			return "profile";
		}
	
	@GetMapping("/")
	public String getDashboardPage(Model model, @CurrentSecurityContext(expression = "authentication?.name") String username) {
		List<User> users = userService.retrieveAllUserProfile();
		model.addAttribute("users", users);
		
		//retrieve loggedinuser id
		User loggedInUser = userService.getUserByUsername(username);
		model.addAttribute("loggedinuser", loggedInUser);
		return "homepage";
	}
	
	@PostMapping("/update-profile")
	public String updateProfilePage(@ModelAttribute("user") User user,
			@AuthenticationPrincipal CustomUserDetails loggedinUser) {
		
		// check, if username has changed, update username on system
		if(user.getUsername() != loggedinUser.getUsername()) {
			loggedinUser.setUsername(user.getUsername());
		}
		
		Integer user_id = user.getId();
		userService.updateProfile(user);

        return "homepage";
    }
	@PostMapping("/homepage")
	public void search(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		List<User> users = userService.search(keyword);
		Integer count = users.size();
		
		model.addAttribute("count", count);
		model.addAttribute("users", users);
		//return "dashboard";
	}
	private String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
	@GetMapping("/verify")
	public String verifyUser(@Param("code") String code) {
	    if (userService.verify(code)) {
	        return "verify_success";
	    } else {
	        return "verify_fail";
	    }
	}
	@GetMapping("/forgot-password")
	public String forgotPasswordPage() {
		// show forgot password page, ask user to 
		// enter verified registered email
		return "forgot-password";
	}
	
	@PostMapping("/forgot-password")
	public String processForgotPassword(Model model, HttpServletRequest request) 
			throws UnsupportedEncodingException, MessagingException {
		
		String email = request.getParameter("email");
		
		if(userService.getUserByEmail(email) != null) {
			
			userService.generateResetPasswordToken(email, getSiteURL(request));
			model.addAttribute("error_success", "We have sent you a reset password link to your email. Please check.");
		} else {
			model.addAttribute("error_warning", "Opss!! user not found!");
		}
		
		return "forgot-password";
	}
	
	@GetMapping("/verify-reset-password")
	public String verifyResetPasswordToken(@Param("code") String code) {
		User user = userService.getUserByResetPasswordToken(code);
		// if user exists, means verified user
	    if (user != null) {
	    	userService.resetPasswordToken(code);
	    	String url = "redirect:reset-password?email=" + user.getEmail();
	        return url;
	    } else {
	        return "redirect:verify-fail";
	    }
	}
	
	@GetMapping("/verify-fail")
	public String verifyFailPage() {
		return "verify_fail";
	}
	
	@GetMapping("/reset-password")
	public String resetPasswordPage(Model model,
			@Param("email") String email) {
		model.addAttribute("email", email);
		return "reset-password";
	}
	
	@PostMapping("/reset-password")
	public String processResetPassword(Model model, HttpServletRequest request) {
		
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");
		String email = request.getParameter("email");
		
		if(password.equals(cpassword)) { // true, reset password
			System.out.println("email = " + email); // debugging purposes
			userService.updatePassword(email, cpassword);
			
			return "redirect:signin";
			
		} else { // false
			model.addAttribute("error_warning", 
					"hey!! password not match!! Try again.");
			return "reset-password";
		}
		
		
	}
}


