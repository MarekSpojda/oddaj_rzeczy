package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.repository.CategoryRepository;

import javax.servlet.http.HttpSession;

@Controller
public class DonationController {
    private final CategoryRepository categoryRepository;

    public DonationController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @RequestMapping("/donation")
    public String donation(Model model, HttpSession session) {
        session.setAttribute("categories", categoryRepository.findAll());
        model.addAttribute("donation", new Donation());
        return "donation";
    }
}
