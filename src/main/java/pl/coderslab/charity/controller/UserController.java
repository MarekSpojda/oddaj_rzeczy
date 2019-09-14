package pl.coderslab.charity.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.utilities.Utilities;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @GetMapping("/hello")
    @ResponseBody
    public String simpleHello(HttpServletRequest request) {
//        in method header: HttpServletRequest request
//        Principal principal = request.getUserPrincipal();
//        return principal.getName();
        String userName = "not logged in:(";
        if (Utilities.isUserLoggedIn()) {
            userName = request.getUserPrincipal().getName();
        }
        return "Hello, " + userName + ", length: " + userName.length();
    }
}
