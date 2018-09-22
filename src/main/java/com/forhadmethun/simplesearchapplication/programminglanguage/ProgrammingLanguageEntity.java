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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

//    private long developerId;




    @ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.ALL})
    @JoinTable(
            name = "programming_languages_developers",
            joinColumns = {@JoinColumn(name = "programming_languagesid")},
            inverseJoinColumns = {@JoinColumn(name="developersid")}
    )
//    @JsonIgnoreProperties("users")
//    @JsonIgnoreProperties("columns")
    private List<DeveloperEntity> developerEntitiesP = new ArrayList<>();




//    //    @JsonIgnore
//    @ManyToMany(mappedBy = "programmingLanguageEntities")
////    @JsonIgnoreProperties("columns")
//    @JsonIgnoreProperties("programmingLanguageEntities")
//    private List<DeveloperEntity> developerEntitiesP = new ArrayList<>();








//    private long languageId;

//    private double pricePerNight;
//    private int nbOfNights;
    public ProgrammingLanguageEntity(long id,String name){
        this.id = id;
        this.name = name;
//        this.developerId = developerId;
    }
    public ProgrammingLanguageEntity(String name){
        this.name = name;
//        this.developerId = developerId;
    }

}

