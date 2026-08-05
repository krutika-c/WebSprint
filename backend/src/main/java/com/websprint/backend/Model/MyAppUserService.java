package com.websprint.backend.Model;

import java.util.Optional;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor // Lombok automatically creates the constructor for repository injection
public class MyAppUserService implements UserDetailsService {

    // Removed @Autowired. Lombok handles injection via constructor because of @AllArgsConstructor
    private final MyAppUserRepository repository; 

    @Override
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    Optional<MyAppUser> user = repository.findByEmail(username);

    if (user.isPresent()) {
        MyAppUser userObj = user.get();

        return User.builder()
            .username(userObj.getEmail())
            .password(userObj.getPassword_hash())
            .roles("USER")
            .build();
    } else {
        throw new UsernameNotFoundException("User not found with identifier: " + username);
    }
}
}
