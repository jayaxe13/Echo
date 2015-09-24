/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Toshiba PC
 */
public class Review {

    private int childcare_id;
    private int user_id;
    private String review;
    
    public Review(int childcare_id, int user_id, String review){
        this.childcare_id = childcare_id;
        this.user_id = user_id;
        this.review = review;
    }
    
    public void setChildcare_id(int childcare_id){
        this.childcare_id = childcare_id;
    }
    
    public void setUser_id(int user_id){
        this.user_id = user_id;
    }
    
    public void setReview(String review){
        this.review = review;
    }
    
    public int getChildcare_id(){
        return this.childcare_id;
    }
    
    public int getUser_id(){
        return user_id;
    }

    public String getReview(){
        return this.review;
    }
}
