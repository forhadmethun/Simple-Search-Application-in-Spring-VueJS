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
        import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = "")
public class RESTController {
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private DeveloperRepository developerRepository;

    @Autowired
    private LanguageRepository languageRepository;

    @Autowired
    private ProgrammingLanguageRepository programmingLanguageRepository;

    @Autowired
    private DAO dao;

    @Autowired
//    public RESTController(BookingRepository bookingRepository){
//        this.bookingRepository = bookingRepository;
//
//
//    }
    @RequestMapping(value="/all",method = RequestMethod.GET)
    public List<HotelBookingEntity> getAll(){
        return bookingRepository.findAll();
    }

    @RequestMapping(value="/alldev",method = RequestMethod.GET)
    public List<DeveloperEntity> getAllDev(){
        return developerRepository.findAll();
    }

    @RequestMapping(value="/alll",method = RequestMethod.GET)
    public List<LanguageEntity> getAllL(){
        return languageRepository.findAll();
    }

    @RequestMapping(value="/allp",method = RequestMethod.GET)
    public List<ProgrammingLanguageEntity> getAllP(){
        return programmingLanguageRepository.findAll();
    }

    //get email list
    @RequestMapping(value="/getemaillist/{lang}",method = RequestMethod.GET)
    public ArrayList<String> getemaillist(@PathVariable String lang){
        List<DeveloperEntity> developerEntities =  developerRepository.findByEmailLike("%"+lang+"%");
        ArrayList<String> emails = new ArrayList<>();
        for(int i=0;i<developerEntities.size();i++){
            emails.add(developerEntities.get(i).getEmail());
        }

        return emails;
    }
    //get programming language list
    @RequestMapping(value="/getprogramminglanguagelist/{lang}",method = RequestMethod.GET)
    public ArrayList<String> getprogramminglanguagelist(@PathVariable String lang){
        List<ProgrammingLanguageEntity> programmingLanguageEntities =  programmingLanguageRepository.findByNameLike("%"+lang+"%");
        ArrayList<String> codes = new ArrayList<>();
        for(int i=0;i<programmingLanguageEntities.size();i++){
            codes.add(programmingLanguageEntities.get(i).getName());
        }

        return codes;
    }
    //get language list
    @RequestMapping(value="/getlanguagelist/{lang}",method = RequestMethod.GET)
    public ArrayList<String> getlanguagelist(@PathVariable String lang){
        List<LanguageEntity> developerEntities =  languageRepository.findByCodeLike("%"+lang+"%");
        ArrayList<String> codes = new ArrayList<>();
        for(int i=0;i<developerEntities.size();i++){
            codes.add(developerEntities.get(i).getCode());
        }

        return codes;
    }



    //search by programminglanguage

    @RequestMapping(value="/searchp",method = RequestMethod.GET)
    public  List<Object[]> searchByP(){
        List<Object[]> rows = dao.searchByProgrammingLanguage("en");
//        System.out.println("==========");
//        return programmingLanguageRepository.findAll();
        return rows;
    }
    @RequestMapping(value="/searchp/{lang}",method = RequestMethod.GET)
    public  List<Object[]> searchByL(@PathVariable String lang){
        List<Object[]> rows = dao.searchByProgrammingLanguage(lang);
//        System.out.println("==========");
//        return programmingLanguageRepository.findAll();
        return rows;
    }

    //search by programming language
    @RequestMapping(value="/searchpl/{lang}",method = RequestMethod.GET)
    public  List<Table>  searchBypl(@PathVariable String lang){
        List<Object[]> rows = dao.searchByProgrammingLanguage(lang);
//        System.out.println("==========");
//        return programmingLanguageRepository.findAll();
        List<Table> tables = new ArrayList<>();
        for(Object[] row: rows){
            Table table = new Table();
//str!=null && str.equals("hi") (String)
            table.setEmail(row[1]!=null?(String)row[1]:"");
            BigInteger bigInteger = (BigInteger)row[0];
            table.setUserId(bigInteger.longValue());
//            table.setUserId((Long) row[0]!=null?(Long)row[0]:-1);
            table.setLanguage((String) row[2]!=null?(String)row[2]:"");
            table.setProgrammingLanguage((String) row[3]!=null?(String)row[3]:"");
            tables.add(table);

        }
        return tables;
    }



    @RequestMapping(value="/searchall",method = RequestMethod.GET)
    public  List<Table> searchall(){
        List<Object[]> rows = dao.searchByProgrammingLanguage("");
//        System.out.println("==========");
//        return programmingLanguageRepository.findAll();
        List<Table> tables = new ArrayList<>();
        for(Object[] row: rows){
            Table table = new Table();
//str!=null && str.equals("hi") (String)
            table.setEmail(row[1]!=null?(String)row[1]:"");
            BigInteger bigInteger = (BigInteger)row[0];
            table.setUserId(bigInteger.longValue());
//            table.setUserId((Long) row[0]!=null?(Long)row[0]:-1);
            table.setLanguage((String) row[2]!=null?(String)row[2]:"");
            table.setProgrammingLanguage((String) row[3]!=null?(String)row[3]:"");
            tables.add(table);

        }
        return tables;
    }





    @RequestMapping(value="/affordable/{price}",method = RequestMethod.GET)
    public List<HotelBookingEntity> getAffordable(@PathVariable double price){
        return bookingRepository.findByPricePerNightLessThan(price);

    }
    @RequestMapping(value="/create", method=RequestMethod.POST)
    public List<HotelBookingEntity> create(@RequestBody HotelBookingEntity hotelBookingEntity){
        bookingRepository.save(hotelBookingEntity);
        return bookingRepository.findAll();

    }

    @RequestMapping(value="/delete/{id}", method = RequestMethod.GET)
    public List<HotelBookingEntity> remove(@PathVariable long id){
        bookingRepository.delete(bookingRepository.getOne(id));
        return bookingRepository.findAll();
    }

}
