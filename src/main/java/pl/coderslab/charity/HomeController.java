package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.servlet.http.HttpSession;


@Controller
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final CategoryRepository categoryRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, CategoryRepository categoryRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model, HttpSession session) {
        session.setAttribute("institutions", institutionRepository.findAll());
        session.setAttribute("allbags", DonationRepository.findAllBags(donationRepository.findAll()));
        session.setAttribute("allinstitutionsamount", institutionRepository.findAll().size());
        session.setAttribute("categories", categoryRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "index";
    }
}
