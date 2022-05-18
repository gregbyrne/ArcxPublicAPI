package com.app.arcx.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "regions")
@NamedQuery(name = "Regions.findAll", query="select u from Regions u order by u.id ASC")
public class Regions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    public String name;
    public String regioncode;

}
