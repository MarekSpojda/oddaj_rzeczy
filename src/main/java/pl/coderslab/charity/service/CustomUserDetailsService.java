package pl.coderslab.charity.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.CustomUserDetails;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.annotation.Resource;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Resource
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = null;
        if (userRepository.findUserByEmail(email).isPresent()) {
            user = userRepository.findUserByEmail(email).get();
        } else {
            throw new UsernameNotFoundException("user not found");
        }
        return new CustomUserDetails(user);
    }
}
