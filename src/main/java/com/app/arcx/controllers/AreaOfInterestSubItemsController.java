package com.app.arcx.controllers;

import com.app.arcx.domain.AreaOfInterestSubItems;
import com.app.arcx.repository.AreaOfInterestSubItemsRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
@RestController
@RequestMapping("/api")
public class AreaOfInterestSubItemsController {

    private final AreaOfInterestSubItemsRepository repository;

    public AreaOfInterestSubItemsController(AreaOfInterestSubItemsRepository repository) {
        this.repository = repository;
    }

    @CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
    @GetMapping("/area_of_interest_sub_items")
    public List<AreaOfInterestSubItems> getAOISubItem() {

        List<AreaOfInterestSubItems> response = null;

        response = repository.findAll();

        return response;
    }

}
