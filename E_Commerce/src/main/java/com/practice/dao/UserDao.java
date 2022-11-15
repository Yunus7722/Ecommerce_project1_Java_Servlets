
package com.practice.dao;

import com.practice.entities.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getUserByEmailAndPassword(String email,String password)
    {
       User user = null;
       
        try {
            
            String query = "from User where userEmail =: e and userPassword =: p"; // bringing w.r.t User bean class class
            Session session =this.factory.openSession(); // hibernate session
            Query q = session.createQuery(query); //creation of query to select
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            user = (User) q.uniqueResult(); // its like a result set in hibernate
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
       
       
       return user;
    }
    
    public List<User> getUsers(){
        Session sess = this.factory.openSession();
        Query query = sess.createQuery("from User");
        List<User> list = query.list();
        return list;
    }
    
}
