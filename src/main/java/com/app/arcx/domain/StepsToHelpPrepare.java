package com.app.arcx.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "steps_to_help_prepare")
@NamedQuery(name = "StepsToHelpPrepare.findAll", query="select u from StepsToHelpPrepare u order by u.id ASC")
public class StepsToHelpPrepare {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    public String name;
    public String sub_title;
    public String description;

}
