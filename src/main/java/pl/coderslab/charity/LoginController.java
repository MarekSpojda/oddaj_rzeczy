package pl.coderslab.charity;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoginController {
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping(path = "/login")
    public void loginPost() {
        //TODO login things
    }

//    @PreAuthorize("hasAnyRole('ADMIN')")
    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("/secure/hello")
    @ResponseBody
    public String securedHello() {
        return "Secured hello";
    }

    @RequestMapping("/errorpage")
    public String errorLogin() {
        return "errorlogin";
    }
}
