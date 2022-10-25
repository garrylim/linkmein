package com.example.demo.UserService;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.UserRepository.UserRepository;
import com.example.demo.entity.User;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	// save, update user object
	public void saveUser(User user) {
		userRepository.save(user);
	}
	
	public User getUserByUsername(String username) {
		return userRepository.findUserByUsername(username);
	}
	
	public User getUserById(Integer id) {
		return userRepository.findById(id).get();
	}
	
	 // return all user information
	public List<User> retrieveAllUserProfile() {
		return userRepository.findAll();
	}
	
	public List<User> search(String keyword) {
		return userRepository.search(keyword);
	}
}