package com.app.arcx.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "additional_information")
@NamedQuery(name = "AdditionalInformation.findAll", query="select u from AdditionalInformation u order by u.id ASC")
public class AdditionalInformation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    public String description;
    public String regioncode;

}
