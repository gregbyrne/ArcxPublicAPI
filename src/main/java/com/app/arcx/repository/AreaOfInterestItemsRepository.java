package com.app.arcx.repository;

import com.app.arcx.domain.AreaOfInterestItems;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.List;

@RepositoryRestResource(collectionResourceRel = "area_of_interest_items", path = "area_of_interest_items")
public interface AreaOfInterestItemsRepository extends CrudRepository<AreaOfInterestItems, Integer> {

@Override
@Query
@RestResource
public List<AreaOfInterestItems> findAll();

}
