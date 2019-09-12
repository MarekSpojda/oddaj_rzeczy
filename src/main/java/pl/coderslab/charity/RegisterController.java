package pl.coderslab.charity;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RegisterController {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public RegisterController(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(HttpServletRequest request) {
        String username = request.getParameter("username");
        String usersurname = request.getParameter("usersurname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        boolean emailExist = userRepository.existsByEmail(email);
        if (emailExist || !password.equals(password2)) {
            return "redirect:/register";
        }

        User userToDatabase = new User();
        userToDatabase.setUsername(username);
        userToDatabase.setUsersurname(usersurname);
        userToDatabase.setEmail(email);
        userToDatabase.setPassword(passwordEncoder.encode(password));

        userRepository.save(userToDatabase);

        return "redirect:/";
    }
}
