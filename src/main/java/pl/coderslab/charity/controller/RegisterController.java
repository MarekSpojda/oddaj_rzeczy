package pl.coderslab.charity.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Role;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RegisterController {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public RegisterController(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String registerPost(HttpServletRequest request) {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        boolean emailExist = userRepository.existsByEmail(email);
        if (emailExist || !password.equals(password2)) {
            return "redirect:/register";
        }

        User userToDatabase = new User();
        userToDatabase.setName(name);
        userToDatabase.setSurname(surname);
        userToDatabase.setEmail(email);
        userToDatabase.setPassword(passwordEncoder.encode(password));

        //Adding role 'USER' to new user
        List<Role> roles = new ArrayList<>();
        roles.add(roleRepository.findByIdCustom(2L));
        userToDatabase.setRoles(roles);

        userRepository.save(userToDatabase);

        return "redirect:/";
    }
}
