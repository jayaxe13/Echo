/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author Qianpin
 */
public class Childcare {
    
    private int childcare_id;
    private String name;
    private String address;
    private int postal;
    private String image;
    private String website;
    private int rating;
    private ArrayList<Childcare> child_list = new ArrayList<>();
    
    public Childcare (int childcare_id, String name, String address, int postal, String image, String website, int rating) {
        this.childcare_id = childcare_id;
        this.name = name;
        this.address = address;
        this.postal = postal;
        this.image = image;
        this.website = website;
        this.rating = rating;
    }
    
    public int getID() {
        return childcare_id;
    }
    
    public String getName() {
        return name;
    }
    
    public String getAddress() {
        return address;
    }
    
    public int getPostal(){
        return postal;
    }
    
    public String getImage(){
        return image;
    }
    
    public int getRating(){
        return rating;
    }
    
}
