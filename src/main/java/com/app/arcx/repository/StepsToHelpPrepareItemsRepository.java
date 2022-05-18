package com.app.arcx.repository;

import com.app.arcx.domain.StepsToHelpPrepareItems;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import org.springframework.data.rest.core.annotation.RestResource;


@RepositoryRestResource(collectionResourceRel = "steps_to_help_prepare_items", path = "steps_to_help_prepare_items")
public interface StepsToHelpPrepareItemsRepository extends CrudRepository<StepsToHelpPrepareItems, Integer> {

    @Override
    @Query
    @RestResource
    public List<StepsToHelpPrepareItems> findAll();

}
