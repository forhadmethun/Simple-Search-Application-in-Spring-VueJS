package com.forhadmethun.simplesearchapplication;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManagerFactory;
import java.util.List;

@Service
public class DAO {
    public List<Object[]> searchByProgrammingLanguage(String name) {
        Session s = sessionFactory.openSession();
        Transaction tx = s.beginTransaction();
        String query2=
                "SELECT per.id,\n" +
                        "  per.email,\n" +
                        "  conf.code,\n" +
                        "  pub.name\n" +
                        "FROM Developers AS per\n" +
                        "  LEFT JOIN developers_languages AS pconf\n" +
                        "    ON per.id = pconf.developersid\n" +
                        "  LEFT JOIN languages AS conf\n" +
                        "    ON pconf.languagesid = conf.id\n" +
                        "  LEFT JOIN programming_languages_developers AS ppub\n" +
                        "    ON per.id = ppub.developersid\n" +
                        "  LEFT JOIN programming_languages AS pub\n" +
                        "    ON ppub.programming_languagesid = pub.id\n";
        if(name.length()!=0)query2+= "  where pub.name = :name";
        List<Object[]> rows;
        if(name.length()!=0)rows= s.createSQLQuery(query2).setString("name", name)
                .list();
        else rows = s.createSQLQuery(query2).list();
        tx.commit();
        s.close();
        return rows;
    }

    public List<Object[]> search(String name,String code, String email) {
        if(name!=null && !name.isEmpty()){}else name = null;
        if(code!=null && !code.isEmpty()){}else code= null;
        if(email!=null && !email.isEmpty()){}else email = null;

        Session s = sessionFactory.openSession();
        Transaction tx = s.beginTransaction();

        String query2=
                "SELECT per.id,\n" +
                        "  per.email,\n" +
                        "  conf.code,\n" +
                        "  pub.name\n" +
                        "FROM Developers AS per\n" +
                        "  LEFT JOIN developers_languages AS pconf\n" +
                        "    ON per.id = pconf.developersid\n" +
                        "  LEFT JOIN languages AS conf\n" +
                        "    ON pconf.languagesid = conf.id\n" +
                        "  LEFT JOIN programming_languages_developers AS ppub\n" +
                        "    ON per.id = ppub.developersid\n" +
                        "  LEFT JOIN programming_languages AS pub\n" +
                        "    ON ppub.programming_languagesid = pub.id\n"+
                        "  where (:name is null or pub.name = :name )" +
                        " and (:code is null or conf.code = :code )" +
                        " and ( :email is null or per.email = :email) ";

        List<Object[]> rows= s.createSQLQuery(query2)
                        .setString("name", name)
                        .setString("code", code)
                        .setString("email",email)
                .list();
        tx.commit();
        s.close();
        return rows;
    }



    private SessionFactory sessionFactory;
    @Autowired
    public DAO(EntityManagerFactory factory) {
        if(factory.unwrap(SessionFactory.class) == null){
            throw new NullPointerException("factory is not a hibernate factory");
        }
        this.sessionFactory = factory.unwrap(SessionFactory.class);
    }

}
