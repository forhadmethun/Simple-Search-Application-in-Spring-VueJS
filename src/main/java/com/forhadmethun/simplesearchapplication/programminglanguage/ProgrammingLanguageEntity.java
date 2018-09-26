package com.forhadmethun.simplesearchapplication.programminglanguage;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.forhadmethun.simplesearchapplication.developer.DeveloperEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "programming_languages")
public class ProgrammingLanguageEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String name;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "programming_languages_developers",
            joinColumns = {@JoinColumn(name = "programming_languagesid")},
            inverseJoinColumns = {@JoinColumn(name="developersid")}
    )
    private List<DeveloperEntity> developerEntitiesP = new ArrayList<>();

    public ProgrammingLanguageEntity(long id,String name){
        this.id = id;
        this.name = name;
    }
    public ProgrammingLanguageEntity(String name){
        this.name = name;
    }

}

