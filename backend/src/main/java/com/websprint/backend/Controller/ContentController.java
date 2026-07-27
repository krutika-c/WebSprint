package com.websprint.backend.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContentController {

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/req/signup")
    public String signup() {
        return "signup";
    }

    @GetMapping("/") 
    public String home() {
        return "h1";
    }

    @GetMapping("/choose-topic") 
    public String chooseTopic() {
        return "choose-topic";
    }

    @GetMapping("/html-roadmap") 
    public String htmlMap() {
        return "html-roadmap";
    }

    @GetMapping("/css-roadmap") 
    public String cssMap() {
        return "css-roadmap";
    }

    @GetMapping("/js-roadmap") 
    public String jsMap() {
        return "js-roadmap";
    }

    @GetMapping("/dashboard") 
    public String dashboard() {
        return "dashboard";
    }

    @GetMapping("/achivements") 
    public String achivements() {
        return "achivements";
    }

    @GetMapping("/settings") 
    public String settings() {
        return "settings";
    }

    @GetMapping("/profile") 
    public String profile() {
        return "profile";
    }
}
