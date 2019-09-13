package pl.coderslab.charity.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.entity.CustomUserDetails;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import java.util.Optional;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final UserRepository userRepository;

    public CustomUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String useremail) throws UsernameNotFoundException {
        Optional<User> optionalUser = userRepository.findUserByEmailCustom(useremail);

        optionalUser
                .orElseThrow(() -> new UsernameNotFoundException("User not found, sorry :/"));

        return optionalUser
                .map(CustomUserDetails::new).get();
    }
}
