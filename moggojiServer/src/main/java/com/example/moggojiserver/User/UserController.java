package com.example.moggojiserver.User;

import jakarta.validation.Valid;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public List<UserItem> getUser() { return userRepository.findAll(); }

    @PostMapping(value = "/register")
    public UserItem register(@Valid @RequestBody UserItem userItem) {
        System.out.println(userItem);
        return  userRepository.save(userItem);
    }

    @PostMapping(value = "/login")
    public ResponseEntity login(@Valid @RequestBody UserItem userItem) {
        return ResponseEntity.ok().body(null);
    }

//    @PostMapping(value = "/login")
//    public ResponseEntity login() {
//        return ResponseEntity.ok().body(null);
//    }

//    @PostMapping(value = "/login")
//    public UserItem login(@RequestBody UserItem userItem) {
//        UserItem oldUser = userRepository.findAll();
//        return oldUser;
//    }
}