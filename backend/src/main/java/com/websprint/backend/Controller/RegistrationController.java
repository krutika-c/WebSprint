package com.websprint.backend.Controller;

import java.time.Instant;

import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.websprint.backend.Model.MyAppUser;
import com.websprint.backend.Model.MyAppUserRepository;
import com.websprint.backend.Model.SignupRequest;

@Controller // was @RestController — this now redirects a normal browser form post,
            // it doesn't return JSON
public class RegistrationController {

    private final MyAppUserRepository myAppUserRepository;
    private final PasswordEncoder passwordEncoder;

    public RegistrationController(MyAppUserRepository myAppUserRepository, PasswordEncoder passwordEncoder) {
        this.myAppUserRepository = myAppUserRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping(value = "/req/signup", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String createUser(@ModelAttribute SignupRequest request,
                         RedirectAttributes redirectAttributes) {

    if (myAppUserRepository.findByEmail(request.getEmail()).isPresent()) {
        redirectAttributes.addFlashAttribute("emailError", "Email already registered");
        return "redirect:/req/signup";
    }

    if (request.getPassword() == null || !request.getPassword().equals(request.getConfirmPassword())) {

        redirectAttributes.addFlashAttribute("passwordError", "Passwords do not match");
        return "redirect:/req/signup";
    }

    MyAppUser user = new MyAppUser();
    user.setFull_name(request.getFullName());
    user.setEmail(request.getEmail());
    user.setPassword_hash(passwordEncoder.encode(request.getPassword()));
    user.setAuth_provider("local");
    user.setCreated_at(Instant.now());

    myAppUserRepository.save(user);

    redirectAttributes.addFlashAttribute("success", "Account created successfully!");

    return "redirect:/login";
}
}