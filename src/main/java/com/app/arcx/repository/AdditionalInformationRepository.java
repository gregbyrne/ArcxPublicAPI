package com.app.arcx.repository;

import com.app.arcx.domain.AdditionalInformation;
import com.app.arcx.domain.Regions;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "additional_information", path = "additional_information")
public interface AdditionalInformationRepository extends CrudRepository<AdditionalInformation, Integer> {

    @RestResource(path="additionalinfo",rel="additionalinfo")
    @Query(value = "SELECT * FROM additional_information WHERE regioncode = :regioncode", nativeQuery = true)
    List<AdditionalInformation> findByRegioncode (@Param("regioncode") String regioncode);

    @Override
    @Query
    @RestResource
    public List<AdditionalInformation> findAll();

}
