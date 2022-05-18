package com.app.arcx.repository;

import com.app.arcx.domain.AreaOfInterest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;


import java.util.List;

@RepositoryRestResource(collectionResourceRel = "area_of_interest", path = "area_of_interest")
public interface AreaOfInterestRepository extends CrudRepository<AreaOfInterest, Integer> {

    @Override
    @Query
    @RestResource
    public List<AreaOfInterest> findAll();

}
