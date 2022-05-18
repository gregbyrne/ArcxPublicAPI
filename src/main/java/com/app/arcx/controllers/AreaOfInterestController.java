package com.app.arcx.controllers;

import com.app.arcx.domain.AreaOfInterest;
import com.app.arcx.repository.AreaOfInterestRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/api")
public class AreaOfInterestController {

    private final AreaOfInterestRepository repository;

    public boolean userVerified = false;

    public AreaOfInterestController(AreaOfInterestRepository repository) {
        this.repository = repository;
    }


    @GetMapping("/area_of_interest")
    public List<AreaOfInterest> getAOI() {

        List<AreaOfInterest> response = null;

        response = repository.findAll();

        return response;
    }




}
