package com.example.api.service;

import com.example.api.dto.UserDTO;
import com.example.api.entity.User;
import com.example.api.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;
@Service
public class UserService {
    Logger logger = Logger.getLogger(UserService.class.getName());
    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(long id) {
        return userRepository.findById((long) id).orElse(null);
    }

    public User saveUser(User request) {
        User user = new User();
        user.setFirstName(request.getFirstName());
        user.setEmail(request.getEmail());
        user.setLastName(request.getLastName());
        userRepository.save(user);
        return user;
    }
    public User updateUser(UserDTO request) {
        User user = userRepository.findById(request.id)
                .orElseThrow(() -> new Error("Brak użytkownika"));
        user.setFirstName(request.getFirstName());
        user.setEmail(request.getEmail());
        user.setLastName(request.getLastName());
        return userRepository.save(user);
    }
    public String removeUser(Long id) {
        Optional<User> userToRemove = userRepository.findById(id);
        if (!userToRemove.isPresent()) {
            return "Użytkownik o podanym ID nie istnieje.";
        }

        userRepository.delete(userToRemove.get());
        return "Użytkownik został usunięty.";
    }
}
