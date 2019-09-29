package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.utilities.Utilities;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserRepository userRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, UserRepository userRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userRepository = userRepository;
    }

    @RequestMapping("/")
    public String homeAction(HttpSession session, HttpServletRequest httpServletRequest) {
        session.setAttribute("institutions", institutionRepository.findAll());
        session.setAttribute("allbags", DonationRepository.findAllBags(donationRepository.findAll()));
        session.setAttribute("allinstitutionsamount", institutionRepository.findAll().size());
//        session.setAttribute("topMenu", Utilities.topSiteMenu(httpServletRequest, userRepository));
        return "index";
    }
}
