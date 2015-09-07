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
import entity.Review;

/**
 *
 * @author Qianpin
 */
public class UserReviewDAO {
    
    ArrayList<String> namelist = new ArrayList<>();
    ArrayList<Review> review_list = new ArrayList<>();//must declare outside for it to be returned
    int row = 0;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //STANDARD METHOD
    public ArrayList<Review> getReviews() {
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from reviews");
            rs = ps.executeQuery();

            while (rs.next()) {
                review_list.add(new Review(rs.getInt("childcare_id"), rs.getInt("user_id"), rs.getString("review")));
            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return review_list;
    }
    
    public ArrayList<Review> getReviews(int user_id){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from reviews WHERE user_id = " + user_id + "");
            rs = ps.executeQuery();

            while (rs.next()) {
                review_list.add(new Review(rs.getInt("childcare_id"), rs.getInt("user_id"), rs.getString("review")));
            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return review_list;
    }
    
    public void addReview(int childcareid, int userid, String review){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("INSERT INTO reviews (childcare_id, user_id, review) values (?, ?, ?);");

            ps.setInt(1, childcareid);
            ps.setInt(2, userid);
            ps.setString(3, review);
            
            boolean execute = ps.execute(); //sends statement to the database server

        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
    } 
}
