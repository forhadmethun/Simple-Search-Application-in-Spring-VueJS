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

    @ManyToMany(mappedBy = "languageEntities",cascade = {CascadeType.REMOVE},fetch = FetchType.LAZY)
    @JsonIgnoreProperties("languageEntities")
    private List<DeveloperEntity> developerEntities = new ArrayList<>();

    public LanguageEntity( String code){
        this.code = code;
    }



}

