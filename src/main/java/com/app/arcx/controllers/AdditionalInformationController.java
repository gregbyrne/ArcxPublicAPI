package com.app.arcx.controllers;

import com.app.arcx.domain.AdditionalInformation;
import com.app.arcx.repository.AdditionalInformationRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

@CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
@RestController
@RequestMapping("/api")
public class AdditionalInformationController {

    private final AdditionalInformationRepository repository;

    public AdditionalInformationController(AdditionalInformationRepository repository) {
        this.repository = repository;
    }

    @CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
    @GetMapping("/additional_information")
    public List<AdditionalInformation> getAdditionalInformation(@PathParam("regioncode") String regioncode) {

        List<AdditionalInformation> response = null;

        response = repository.findAll();

        return response;
    }

    @CrossOrigin(origins = {"http://localhost:8080", "https://climateadaptationadminstg.epa.gov"})
    @GetMapping("/additional_information/{regioncode}")
    public List<AdditionalInformation> getAdditionalInformationReg( @PathVariable String regioncode) {

        List<AdditionalInformation> response = null;

        response = repository.findByRegioncode(regioncode);

        return response;
    }



}
