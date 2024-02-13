package com.example.api;

import com.example.api.controllers.UserController;
import com.example.api.entity.User;
import com.example.api.repository.UserRepository;
import com.example.api.service.UserService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class UserControllerTest {
	@Mock
	private UserService userService; // Assuming you have a UserService

	@InjectMocks
	private UserController userController;

	@Test
	public void testSaveUser() {
		// given
		User user = new User();
		user.setFirstName("John");
		user.setEmail("john@example.com");

		when(userService.saveUser(user)).thenReturn(user);

		// when
		User savedUser = userController.createUser(user);

		// then
		assertEquals(user, savedUser);
	}
}
