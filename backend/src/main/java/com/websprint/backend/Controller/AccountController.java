package com.websprint.backend.Controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.websprint.backend.Repository.MyAppUserRepository;
import com.websprint.backend.Service.AccountService;

@RestController
@RequestMapping("/api/account")
public class AccountController {

    public record ConfirmRequest(String confirmation) { }

    private final AccountService accountService;
    private final MyAppUserRepository userRepository;

    public AccountController(AccountService accountService, MyAppUserRepository userRepository) {
        this.accountService = accountService;
        this.userRepository = userRepository;
    }

    @PostMapping("/delete")
    public ResponseEntity<Void> deleteAccount(@RequestBody ConfirmRequest body, Authentication auth) {
        if (body == null || !"DELETE".equals(body.confirmation())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Type DELETE to confirm");
        }
        Long userId = userRepository.findByEmail(auth.getName())    
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED))
                .getId();
        accountService.deleteAccount(userId);
        return ResponseEntity.noContent().build();
    }
}
