package com.app.arcx.controllers;

import com.app.arcx.domain.StepsToHelpPrepareItems;
import com.app.arcx.repository.StepsToHelpPrepareItemsRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
@RestController
@RequestMapping("/api")
public class StepsToHelpPrepareItemsController {

    private final StepsToHelpPrepareItemsRepository repository;

    public StepsToHelpPrepareItemsController(StepsToHelpPrepareItemsRepository repository) {
        this.repository = repository;
    }


    @CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
    @GetMapping("/steps_to_help_prepare_items")
    public List<StepsToHelpPrepareItems> getStepsItems() {

        List<StepsToHelpPrepareItems> response = null;


        response = repository.findAll();

        return response;
    }

}
