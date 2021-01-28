/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.ciphergaming.dao;

import com.mycompany.ciphergaming.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author USER
 */
public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveProduct(Product product) {

        Session session = this.factory.openSession();
        Transaction transaction = session.beginTransaction();
        int pId = (int) session.save(product);
        transaction.commit();
        session.close();
        return pId;

    }
    
    public List<Product> getAllProducts(){
        
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    
    public List<Product> getAllProductsById(int categoryId){
        
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product where category.categoryId = :id");
        query.setParameter("id", categoryId);
        List<Product> list = query.list();
        return list;
        
    }

}
