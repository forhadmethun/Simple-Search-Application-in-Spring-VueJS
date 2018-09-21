package com.forhadmethun.simplesearchapplication.language;
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
@Table(name = "languages")
public class LanguageEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String code;

//    private long developerId;




    //    @JsonIgnore
    @ManyToMany(mappedBy = "languageEntities")
//    @JsonIgnoreProperties("columns")
    @JsonIgnoreProperties("languageEntities")
    private List<DeveloperEntity> developerEntities = new ArrayList<>();



//    private long programmingLanguageId;

//    private double pricePerNight;
//    private int nbOfNights;
    public LanguageEntity( String code){
        this.code = code;
//        this.developerId = developerId;
    }



}

