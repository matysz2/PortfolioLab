package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Controller

public class DonationController {
    private final Donation donation = new Donation();


    @Autowired
    private InstitutionRepository institutionRepository;
    @Autowired
    private DonationRepository donationRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @PostMapping("/step1")
    @ResponseBody
    public String processStep2(@RequestParam("step1") List<Category> selectedCategories, Model model) {

        donation.setCategories(selectedCategories);
        model.addAttribute("donation", donation);
        return "donation";
    }

    @PostMapping("/step2")
    @ResponseBody
    public String processStep2(@RequestParam("quantity") Integer quantity,Model model) {
        donation.setQuantity(quantity);
        model.addAttribute("donation", donation);
        return "donation";
    }

    @PostMapping("/step3")
    @ResponseBody
    public String saveDonation(@ModelAttribute("donation") Donation donation) {

        Long institutionId = donation.getInstitution().getId();
        Optional<Institution> institution = institutionRepository.findById(institutionId);

        donation.setInstitution(institution.orElse(null));




        return "donation";
    }

    @PostMapping("/step4")
    @ResponseBody
    public String processStep3(@RequestParam("street") String street,
                               @RequestParam("city") String city,
                               @RequestParam("zipCode") String zipCode,
                               @RequestParam("phone") String phone,
                               @RequestParam("pickUpDate") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate pickUpDate,
                               @RequestParam("pickUpTime") @DateTimeFormat(pattern = "HH:mm") LocalTime pickUpTime,
                               @RequestParam("pickUpComment") String pickUpComment, Model model) {


        donation.setStreet(street);
        donation.setCity(city);
        donation.setZipCode(zipCode);
        donation.setPhone(phone);
        donation.setPickUpDate(pickUpDate);
        donation.setPickUpTime(pickUpTime);
        donation.setPickUpComment(pickUpComment);

        model.addAttribute("donation", donation);
        return "donation"; // Return the name of the view to be rendered
    }
    @GetMapping("/data")
    @ResponseBody
    public Donation getDonationData() {
        return donation;
    }
}
