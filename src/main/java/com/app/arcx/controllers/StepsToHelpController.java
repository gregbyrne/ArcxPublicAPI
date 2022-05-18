package com.app.arcx.controllers;

import com.app.arcx.domain.StepsToHelpPrepare;
import com.app.arcx.repository.StepsToHelpPrepareRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin(origins = {"http://localhost:3000", "http://localhost:8080", "http://localhost:8082", "http://localhost:7000", "https://arcx-development-admin-ui.devsecops-eval.epa.gov"})
@RestController
@RequestMapping("/api")
public class StepsToHelpController {

    private final StepsToHelpPrepareRepository repository;

    public StepsToHelpController(StepsToHelpPrepareRepository repository) {
        this.repository = repository;
    }



    @CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
    @GetMapping("/steps_to_help_prepare")
    public List<StepsToHelpPrepare> getSTHP() {

        List<StepsToHelpPrepare> response = null;

        response = repository.findAll();

        return response;
    }


}
