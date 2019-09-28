package pl.coderslab.charity.utilities;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;

public class Utilities {
    public static boolean isUserLoggedIn() {
        return SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails;
    }

    public static String topSiteMenu(HttpServletRequest request, UserRepository userRepository) {
        String toReturn = "<li><a href=\"/login\" class=\"btn btn--small btn--without-border\">Zaloguj</a></li>" +
                "<li><a href=\"/register\" class=\"btn btn--small btn--highlighted\">Załóż konto</a></li>";
        if (isUserLoggedIn()) {
            String email = request.getUserPrincipal().getName();
            User user = userRepository.findUserByEmailCustom(email);
            toReturn = "<button class=\"btn btn--small btn--highlighted\">Witaj "
                    + user.getName()
                    + " "
                    + user.getSurname()
                    + "</button><li><a href=\"/logged\" class=\"btn btn--small btn--highlighted\">Menu</a></li>"
                    + "</button><li><a href=\"/logout\" class=\"btn btn--small btn--highlighted\">Wyloguj</a></li>";
        }
        return toReturn;
    }
}
