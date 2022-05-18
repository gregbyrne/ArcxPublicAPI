package com.app.arcx.domain;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "area_of_interest_sub_items")
@NamedQuery(name = "AreaOfInterestSubItems.findAll", query="select u from AreaOfInterestSubItems u order by u.position ASC")
public class AreaOfInterestSubItems {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int parentid;

    public String name;
    public String value;

    public int position;

}
