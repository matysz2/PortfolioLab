package pl.coderslab.charity.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import java.util.List;


@Controller
public class DonationController {


    @Autowired
    private InstitutionRepository institutionRepository;


    @Autowired
    private DonationRepository donationRepository;

    @Autowired
    private CategoryRepository categoryRepository;


    @PostMapping("/donation")
    public String submitForm(@ModelAttribute Donation donation, RedirectAttributes redirectAttributes){
        Long institutionId = donation.getInstitution().getId();

            Institution institution = new Institution();
            List<Institution> institutionList=institutionRepository.findInstitutionById(institutionId);
            institution.setId(institutionList.getFirst().getId());
            institution.setName(institutionList.getFirst().getName());
            institution.setDescription(institutionList.getFirst().getDescription());


            donation.setInstitution(institution);
            donationRepository.save(donation);
            return "/form_confirmation";
        }

        @GetMapping("/form_confirmation")
        public String targetPage () {
            return "form_confirmation";
        }
    }
