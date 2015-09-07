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
import entity.User;

/**
 *
 * @author Qianpin
 */
public class UserDAO {

    ArrayList<String> namelist = new ArrayList<>();
    ArrayList<User> user_list = new ArrayList<>();
    User user = null;
    int userid = 0;
    int row = 0;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //STANDARD METHOD
    public ArrayList<User> getUsers() {
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from user");
            rs = ps.executeQuery();

            while (rs.next()) {
                user_list.add(new User(rs.getInt("user_id"), rs.getString("firstname"), rs.getString("lastname"),
                        rs.getString("email"), rs.getString("password"), rs.getInt("postal"), rs.getString("image"), 
                        rs.getBoolean("isAdmin")));
            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return user_list;
    }
    
    public User getUser(int user_id) {
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from user where user_id = " + user_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt("user_id"),rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), 
                rs.getString("password"), rs.getInt("postal"), rs.getString("image"), rs.getBoolean("isAdmin"));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return user;
    }
    
    public User getUser(String email) {
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select * from user where email = '" + email + "'");
            rs = ps.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt("user_id"),rs.getString("firstname"), rs.getString("lastname"), rs.getString("email"), 
                rs.getString("password"), rs.getInt("postal"), rs.getString("image"), rs.getBoolean("isAdmin"));

            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return user;
    }
    
    public int addNewUser(String firstname, String lastname, String email, String password, int postal, String image){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("INSERT INTO user (firstname, lastname, email, password, postal, image, isAdmin) values (?, ?, ?, ?, ?, ?, ?);");

            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setInt(5, postal);
            ps.setString(6, image);
            ps.setInt(7, 0);
            
            row = ps.executeUpdate(); //sends statement to the database server
            
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        
        return row;
    }
    
    public ArrayList<String> getEmailList(){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("select email from user");
            rs = ps.executeQuery();

            while (rs.next()) {
                namelist.add(rs.getString("email"));
            }
        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return namelist;
    }
    
    public int getIdFromEmail(String email){
        try {
            conn = ConnectionManager.getConnection();
            ps = conn.prepareStatement("SELECT user_id FROM user WHERE email='" + email + "'");
            rs = ps.executeQuery();
            while (rs.next()) {
                userid = rs.getInt("user_id");
            }

        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
        return userid;
    }
    
    public void setNewPassword(String pw, int userid){
        try {
            conn = ConnectionManager.getConnection();
            String sql2 = "UPDATE `user` SET `password` ='" + pw + "' where `user_id` ='" + userid + "';";
            ps = conn.prepareStatement(sql2);
            ps.execute();

        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
    }
    
    public void editUser(int Id, String firstName, String lastName, String email, String password, int Postal){
        try {
            conn = ConnectionManager.getConnection();
            String sql2 = "UPDATE `user` SET `firstname` ='" + firstName + "',`lastname` ='" + lastName + "', `email` ='" + email + "',`password` ='" + password+ "',`postal` = '" + Postal + "'  where `user_id` ='" + Id + "';";
            ps = conn.prepareStatement(sql2);
            ps.execute();

        } catch (Exception e) {
        } finally {
            ConnectionManager.close(conn, ps, rs);
        }
    }
}
