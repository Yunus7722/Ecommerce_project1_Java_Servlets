package com.practice.dao;

import com.practice.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f= false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product); //saving the product
            tx.commit();
            session.close();
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        
        return f;
    }
    
    public List<Product> getProducts(){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
        
    }
    
     public List<Product> getProductsByCategory(int cid){
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id",cid );
        List<Product> list = query.list();
        return list;
        
    }
     
     //my logic
     public int deleteProduct(Product product,int proId){
         int n=0;
         try {
              Session session = this.factory.openSession();
              Transaction tx = session.beginTransaction();
              Query qd = session.createQuery("delete from Product p where p.pId=:c");
              qd.setParameter("c", proId);
              n = qd.executeUpdate();
              
        
              tx.commit();
              session.close();
              return n;
              
        
         } catch (Exception e) {
             e.printStackTrace();
             
         }
        
        return n;
     }

}
