package com.forhadmethun.simplesearchapplication;

import com.forhadmethun.simplesearchapplication.developer.DeveloperEntity;
import com.forhadmethun.simplesearchapplication.developer.DeveloperRepository;
import com.forhadmethun.simplesearchapplication.language.LanguageEntity;
import com.forhadmethun.simplesearchapplication.language.LanguageRepository;
import com.forhadmethun.simplesearchapplication.programminglanguage.ProgrammingLanguageEntity;
import com.forhadmethun.simplesearchapplication.programminglanguage.ProgrammingLanguageRepository;
import com.forhadmethun.simplesearchapplication.test.BookingRepository;
import com.forhadmethun.simplesearchapplication.test.HotelBookingEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class DatabaseSeeder implements CommandLineRunner {
    private BookingRepository bookingRepository;

    private DeveloperRepository developerRepository;

    private LanguageRepository languageRepository;

    private ProgrammingLanguageRepository programmingLanguageRepository;

    @Autowired
    public DatabaseSeeder(BookingRepository bookingRepository,
                          DeveloperRepository developerRepository,
                          LanguageRepository languageRepository,
                          ProgrammingLanguageRepository programmingLanguageRepository

    ){
        this.bookingRepository = bookingRepository;
        this.developerRepository = developerRepository;
        this.languageRepository = languageRepository;
        this.programmingLanguageRepository = programmingLanguageRepository;

    }



    @Override
    public void run(String... args) throws Exception {
        List<HotelBookingEntity> bookings = new ArrayList<>();
        bookings = new ArrayList<>();
        bookings.add(new HotelBookingEntity(1L,"Marriot",200.5,3));
        bookings.add(new HotelBookingEntity(2L,"Bis",90,4));
        bookings.add(new HotelBookingEntity(3L,"Novotr",100.75,1));

        bookingRepository.save(bookings);

        List<LanguageEntity> languageEntities  = new ArrayList<>();
        List<ProgrammingLanguageEntity> programmingLanguageEntities = new ArrayList<>();

        languageEntities.add(new LanguageEntity("en"));

        programmingLanguageEntities.add(new ProgrammingLanguageEntity(1L,"java"));

//        languageRepository.save(languageEntities);


        List<DeveloperEntity> developerEntities = new ArrayList<>();
        developerEntities.add(new DeveloperEntity("a@a.a",languageEntities,programmingLanguageEntities));

        programmingLanguageEntities.add(new ProgrammingLanguageEntity(2L,"c"));

        languageEntities.add(new LanguageEntity("bn"));
        developerEntities.add(new DeveloperEntity("b@b.b",languageEntities,programmingLanguageEntities));


        languageEntities.add(new LanguageEntity("jpn"));


        programmingLanguageEntities.add(new ProgrammingLanguageEntity(3L,"php"));

        developerEntities.add(new DeveloperEntity("c@c.c",languageEntities,programmingLanguageEntities));

//        programmingLanguageEntities.get(0).setDeveloperEntitiesP(developerEntities);
        programmingLanguageRepository.save(programmingLanguageEntities);

        developerEntities.add(new DeveloperEntity("d@d.d",languageEntities,programmingLanguageEntities));

        developerRepository.save(developerEntities);
//        programmingLanguageEntities.get(0).setDeveloperEntitiesP(developerEntities);
//
//        programmingLanguageRepository.save(programmingLanguageEntities);









//        programmingLanguageRepository.save(programmingLanguageEntities);





    }
}
