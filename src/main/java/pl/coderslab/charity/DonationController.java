package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.utilities.Utilities;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final DonationRepository donationRepository;
    private final InstitutionRepository institutionRepository;

    public DonationController(CategoryRepository categoryRepository, DonationRepository donationRepository, InstitutionRepository institutionRepository) {
        this.categoryRepository = categoryRepository;
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
    }

    @RequestMapping("/donation")
    public String donation(Model model, HttpSession session) {
        session.setAttribute("categories", categoryRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "donation";
    }

    @PostMapping("/confirm")
    public String confirm(HttpServletRequest request) {
        //@ModelAttribute("donation") Donation donation,
        String[] stringCategories = request.getParameterValues("categories");
        Donation donation = new Donation();
        List<Category> categories = new ArrayList<>();

        //Fill categories in donation object
        for (String str : stringCategories) {
            categories.add(categoryRepository.findByIdCustom(Long.parseLong(str)));
        }
        donation.setCategories(categories);

        //Fill quantity of bags in donation object
        donation.setQuantity(Integer.parseInt(request.getParameter("quantity")));

        //Fill organization in donation object
        Institution institution = institutionRepository.getOne(Long.parseLong(request.getParameter("organization")));
        donation.setInstitution(institution);

        //Fill street in donation object
        donation.setStreet(request.getParameter("street"));

        //Fill city in donation object
        donation.setCity(request.getParameter("city"));

        //Fill zipcode in donation object
        donation.setZipCode(request.getParameter("zipcode"));

        //Fill phone in donation object
        donation.setPhoneNumber(request.getParameter("phone"));

        //Fill pickUpDate in donation object
        donation.setPickUpDate(Utilities.stringToLocalDate(request.getParameter("pickUpDate")));

        //Fill pickUpTime in donation object
        donation.setPickUpTime(Utilities.stringToLocalTime(request.getParameter("pickUpTime")));

        //Fill pickUpComment in donation object
        donation.setPickUpComment(request.getParameter("pickUpComment"));

        donationRepository.save(donation);
        return "confirm";
    }
}
