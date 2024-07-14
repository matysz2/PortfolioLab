package pl.coderslab.charity.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RestController;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;



@RestController

public class DonationController {


    @Autowired
    private InstitutionRepository institutionRepository;
    @Autowired
    private DonationRepository donationRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Transactional

    @PostMapping("/donation")
    public String saveDonation(Donation donation) {
        donation.setStreet(donation.getStreet());
        donation.setCity(donation.getCity());
        donation.setZipCode(donation.getZipCode());
        donation.setPhone(donation.getPhone());
        donation.setPickUpComment(donation.getPickUpComment());
        donation.setPickUpDate(donation.getPickUpDate());
        donation.setPickUpTime(donation.getPickUpTime());
        donation.setQuantity(donation.getQuantity());
        donation.setInstitutionId(donation.getInstitutionId());

        donationRepository.save(donation);

        return "redirect:/form_confirmation";
    }
    @GetMapping("/form_confirmation")
    public String targetPage() {
        return "form_confirmation";
    }
}