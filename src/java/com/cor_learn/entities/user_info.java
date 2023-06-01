/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.entities;

/**
 *
 * @author yashsaravane
 */
public class user_info {
    private String name;
    private int user_id;
    private int course_id;
    private String pass;
    private int admin_id;

    public user_info(String name, int user_id, int course_id, String pass, int admin_id) {
        this.name = name;
        this.user_id = user_id;
        this.course_id = course_id;
        this.pass = pass;
        this.admin_id = admin_id;
    }

    public user_info() {
    }

    public user_info(String name, int user_id, String pass) {
        this.name = name;
        this.user_id = user_id;
        this.pass = pass;
    }

    public user_info(String name, int course_id, String pass, int admin_id) {
        this.name = name;
        this.course_id=course_id;
        this.pass = pass;
        this.admin_id = admin_id;
    }
    
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }
    
    

   

    
}
