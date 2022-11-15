
package com.practice.dao;

import com.practice.entities.Category;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CategoryDao {
    
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cat){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int  catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
        
    }
    
    // To get the category list and show in product select option
    
    public List<Category> getCategories(){
        Session sess = this.factory.openSession();
        Query q = sess.createQuery("from Category");
        List<Category> list = q.list();
        return list;
    }
    
    public Category getCategoryById(int cid){
        
        Category cat=null;
        try {
            
            Session session = this.factory.openSession();
            cat  = session.get(Category.class, cid);
            session.close();
          
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
    
    
}
