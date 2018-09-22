package com.forhadmethun.simplesearchapplication.developer;
        import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
        import com.forhadmethun.simplesearchapplication.language.LanguageEntity;
        import com.forhadmethun.simplesearchapplication.programminglanguage.ProgrammingLanguageEntity;
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
@Table(name = "developers")
public class DeveloperEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String email;

//    private long languageId;



//    private long programmingLanguageId;

    @ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.ALL})
    @JoinTable(
            name = "developers_languages",
            joinColumns = {@JoinColumn(name = "developersid")},
            inverseJoinColumns = {@JoinColumn(name="languagesid")}
    )
//    @JsonIgnoreProperties("users")
//    @JsonIgnoreProperties("columns")
    private List<LanguageEntity> languageEntities = new ArrayList<>();
//    @JsonIgnoreProperties("assignedUsers")





    //    @JsonIgnore
    @ManyToMany(mappedBy = "developerEntitiesP")
//    @JsonIgnoreProperties("columns")
    @JsonIgnoreProperties("developerEntitiesP")
    private List<ProgrammingLanguageEntity> programmingLanguageEntities = new ArrayList<>();


//@ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.ALL})
//@JoinTable(
//        name = "developers_programming_languages",
//        joinColumns = {@JoinColumn(name = "developersid")},
//        inverseJoinColumns = {@JoinColumn(name="programming_languagesid")}
//)
////    @JsonIgnoreProperties("users")
//@JsonIgnoreProperties("developerEntitiesP")
//private List<ProgrammingLanguageEntity> programmingLanguageEntities = new ArrayList<>();




    public DeveloperEntity( String email,List<LanguageEntity> languageEntities,List<ProgrammingLanguageEntity> programmingLanguageEntities){

        this.email = email;
        this.languageEntities = languageEntities;
        this.programmingLanguageEntities = programmingLanguageEntities;
//        this.languageId = languageId;
//        this.programmingLanguageId = programmingLanguageId;
    }
    public DeveloperEntity( String email){

        this.email = email;
//        this.languageId = languageId;
//        this.programmingLanguageId = programmingLanguageId;
    }



//    private double pricePerNight;
//    private int nbOfNights;

}
