package pl.coderslab.charity.utilities;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.LocalTime;

public class Utilities {
//    private static InstitutionRepository institutionRepository;
//    private static UserRepository userRepository;

//    public Utilities(InstitutionRepository institutionRepository, UserRepository userRepository) {
//        Utilities.institutionRepository = institutionRepository;
//        Utilities.userRepository = userRepository;
//    }

    public static LocalDate stringToLocalDate(String dateInString) {
        return LocalDate.parse(dateInString);
    }

    public static LocalTime stringToLocalTime(String timeInString) {
        return LocalTime.parse(timeInString);
    }

//    public static String getInstitutionName(String stringID) {
//        return institutionRepository.findByIdCustom(Long.parseLong(stringID)).getName();
//    }

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
                    + user.getUsername()
                    + " "
                    + user.getUsersurname()
                    + "</button><li><a href=\"/logout\" class=\"btn btn--small btn--highlighted\">Wyloguj</a></li>";
        }
        return toReturn;
    }
}
