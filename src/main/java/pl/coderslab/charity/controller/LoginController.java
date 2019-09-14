package pl.coderslab.charity.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoginController implements ErrorController {
    private static final String PATH = "/error";

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @PreAuthorize("hasAnyRole('ADMIN')")
//    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("/secure/hello")
    @ResponseBody
    public String securedHello() {
        return "Secured hello";
    }

    @RequestMapping(value = PATH)
    public String error() {
        return "redirect:/";
    }

    @Override
    public String getErrorPath() {
        return PATH;
    }
}