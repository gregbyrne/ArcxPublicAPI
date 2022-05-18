package com.app.arcx.controllers;

import com.app.arcx.domain.AreaOfInterestItems;
import com.app.arcx.repository.AreaOfInterestItemsRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
@RestController
@RequestMapping("/api")
public class AreaOfInterestItemsController {

    private final AreaOfInterestItemsRepository repository;

    public boolean userVerified = false;

    public AreaOfInterestItemsController(AreaOfInterestItemsRepository repository) {
        this.repository = repository;
    }


    @CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
    @GetMapping("/area_of_interest_items")
    public List<AreaOfInterestItems> getAOIItems() {

        List<AreaOfInterestItems> response = null;

        response = repository.findAll();

        return response;
    }



}
