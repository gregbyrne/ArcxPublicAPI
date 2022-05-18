package com.app.arcx.repository;

import com.app.arcx.domain.Regions;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "regions", path = "regions")
public interface RegionsRepository extends CrudRepository<Regions, Integer> {

    @Override
    @Query
    @RestResource
    public List<Regions> findAll();

}
