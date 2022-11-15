package com.practice.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class factoryProvider {
    
    private static SessionFactory factory;
    
    public static SessionFactory getFactory()
    {
        try {
            if(factory == null)
            {
                factory = new Configuration().configure("Hibernate.cfg.xml").buildSessionFactory();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return factory;
    }
}
