package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Controller
@RequestMapping("/donation")
public class DonationController {

    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @Autowired
    public DonationController(CategoryRepository categoryRepository,
                              InstitutionRepository institutionRepository,
                              DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> institutions() {
        return institutionRepository.findAll();
    }

    @RequestMapping("/form")
    public String donationForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "donationForm"; // nazwa szablonu HTML
    }

    @PostMapping("/submit")
    public String submitDonation(@ModelAttribute("donation") Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            // Obsługa błędów
            return "donationForm";
        }

        // Zapis do bazy danych lub dalsza obsługa
        donationRepository.save(donation);
        return "redirect:/donation/thank-you"; // przekierowanie po sukcesie
    }

    // Dodatkowe metody kontrolera, jeśli są potrzebne

    @RequestMapping("/thank-you")
    public String thankYou() {
        return "thankYouPage"; // strona podziękowania
    }
}
