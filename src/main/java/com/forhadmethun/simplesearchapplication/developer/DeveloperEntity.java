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
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    private String email;

    @ManyToMany(fetch = FetchType.EAGER,cascade = {CascadeType.ALL})
    @JoinTable(
            name = "developers_languages",
            joinColumns = {@JoinColumn(name = "developersid")},
            inverseJoinColumns = {@JoinColumn(name="languagesid")}
    )
    private List<LanguageEntity> languageEntities = new ArrayList<>();
    @ManyToMany(mappedBy = "developerEntitiesP")
    @JsonIgnoreProperties("developerEntitiesP")
    private List<ProgrammingLanguageEntity> programmingLanguageEntities = new ArrayList<>();

    public DeveloperEntity( String email,List<LanguageEntity> languageEntities,List<ProgrammingLanguageEntity> programmingLanguageEntities){
        this.email = email;
        this.languageEntities = languageEntities;
        this.programmingLanguageEntities = programmingLanguageEntities;
    }
    public DeveloperEntity( String email){
        this.email = email;
    }



}
