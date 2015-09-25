/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Blob;
import java.util.ArrayList;

/**
 *
 * @author Qianpin
 */
public class User {

    private int user_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private int postal;
    private Blob image;
    private boolean isAdmin;
    private ArrayList<User> user_list = new ArrayList<>();

    public User(int user_id, String firstname, String lastname, String email, String password, int postal, Blob image, boolean isAdmin) {
        this.user_id = user_id;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.password = password;
        this.postal = postal;
        this.image = image;
        this.isAdmin = isAdmin;
    }

    public int getUserId() {
        return user_id;
    }
    public String getFirstname(){
        return firstname;
    }
    public String getLastname(){
        return lastname;
    }
    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    public int getPostal(){
        return postal;
    }
    public Blob getImage(){
        return image;
    }
    public boolean isAdmin() {
        return isAdmin;
    }
    public void setPassword(String pw){//when users forgot password
        this.password = pw;
    }
}
