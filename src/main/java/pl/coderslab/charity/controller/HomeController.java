package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, CategoryRepository categoryRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.categoryRepository = categoryRepository;
    }



    @GetMapping("/")
    public String showInstitutions(Model model) {




        // Dodaj pusty formularz do modelu

        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("institutions", institutions);



        Long totalQuantity = donationRepository.countTotalQuantity();
        model.addAttribute("totalQuantity", totalQuantity);

        List<Category> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);

        Long totalDonations = donationRepository.countTotalDonations();
        model.addAttribute("totalDonations", totalDonations);

        model.addAttribute("command", new Donation());
        model.addAttribute("donations", new Donation());


        return "index";
    }
}
