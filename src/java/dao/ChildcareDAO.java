/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Childcare;
import entity.Review;

/**
 *
 * @author Qianpin
 */
public class ChildcareDAO {

    ArrayList<String> namelist = new ArrayList<>();
    ArrayList<Childcare> childcare_list = new ArrayList<>();
    Childcare childcare = null;
    ArrayList<Review> childcare_reviews = new ArrayList<>();

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //STANDARD METHOD 
    public ArrayList<Childcare> getChildcares() {
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from childcare");
            rs = ps.executeQuery();

            while (rs.next()) {
                childcare_list.add(new Childcare(rs.getInt("childcare_id"), rs.getString("name"), rs.getString("address"), 
                        rs.getInt("postal"), rs.getString("image"), rs.getString("website"), rs.getInt("rating")));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return childcare_list;
    }
    
    public Childcare getChildcare(int childcare_id) {        
        
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from childcare where childcare_id = " + childcare_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                childcare = new Childcare(rs.getInt("childcare_id"), rs.getString("name"), rs.getString("address"), 
                        rs.getInt("postal"), rs.getString("image"), rs.getString("website"), rs.getInt("rating"));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return childcare;
    }
    
    public ArrayList<Childcare> getRankedChildcares(){

        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from childcare ORDER BY rating DESC LIMIT 10");
            rs = ps.executeQuery();

            while (rs.next()) {
                childcare_list.add(new Childcare(rs.getInt("childcare_id"), rs.getString("name"), rs.getString("address"), 
                        rs.getInt("postal"), rs.getString("image"), rs.getString("website"), rs.getInt("rating")));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return childcare_list;
    }
    
    public Childcare getChildcare(String name){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("SELECT * from childcare where name =?");
            ps.setString(1, name);
            rs = ps.executeQuery();

            while (rs.next()) {
                childcare =(new Childcare(rs.getInt("childcare_id"), rs.getString("name"), rs.getString("address"), 
                        rs.getInt("postal"), rs.getString("image"), rs.getString("website"), rs.getInt("rating")));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return childcare;
    }
    
    //returns Reviews made for a particular Childcare
    public ArrayList<Review> getReviewsForChildcare(int childcare_id){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("SELECT * from reviews where childcare_id =" + childcare_id);
            
            rs = ps.executeQuery();

            while (rs.next()) {
                childcare_reviews.add(new Review(rs.getInt("childcare_id"), rs.getInt("user_id"), rs.getString("review")));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return childcare_reviews;
    }
    
    public ArrayList<Childcare> search(String query){ 
        ArrayList<Childcare> childcares = getChildcares();
        ArrayList<Childcare> toReturn = new  ArrayList<Childcare>();
        for(Childcare childcare : childcares){
            if(childcare.getName().contains(query)){
                toReturn.add(childcare);
                continue;
            }
            
            if(childcare.getAddress().contains(query)){
                toReturn.add(childcare);
                continue;
            }
            
            
        }
        return toReturn;
    }
}
