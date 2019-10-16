package pl.coderslab.charity.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController implements ErrorController {
    private static final String PATH = "/error";

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    //    @PreAuthorize("hasAnyRole('ADMIN')")
//    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("/logged")
    public String onlyForLoggedIn(HttpServletRequest request) {
        //This method display content that should be viewable only to logged users, such as menus or account manager.
        //TODO Should be filled with content.
        if (request.isUserInRole("ROLE_USER")) {
            return "logged";
        }
        return "redirect:/";
    }

    @GetMapping("/admin")
    public String onlyForLoggedAdmin(HttpServletRequest request) {
        //This method display content that should be viewable only to logged users, such as menus or account manager.
        if (request.isUserInRole("ROLE_ADMIN")) {
            return "admin";
        }
        return "redirect:/";
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
