package com.example.api.controllers;

import com.example.api.dto.UserDTO;
import com.example.api.entity.User;
import com.example.api.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
//@RequestMapping(value = "/user", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)

@RestController
@RequestMapping(value = "/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return users;
    }
    @PostMapping
    public User createUser(@RequestBody User user) {
        User dbUser = userService.saveUser(user);
        return dbUser;
    }
    @PutMapping("/{id}")
    public String updateUser(@PathVariable Long id, @RequestBody UserDTO user) {
        userService.updateUser(user);
        return "User created: " + user;
    }
    @DeleteMapping("/{id}")
    public String deleteUser(@PathVariable Long id) {        userService.removeUser(id);
        return "User not found";
    }
}
