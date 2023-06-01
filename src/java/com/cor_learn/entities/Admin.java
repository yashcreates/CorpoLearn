/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.entities;

import java.sql.*;
public class Admin {
    private int id;
    private String username;
    private String email;
    private String pass;
    private String gender;

    public Admin(int id, String username, String email, String pass, String gender) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.pass = pass;
        this.gender = gender;
    }
    
    public Admin(){
        
    }
    public Admin( String username, String email, String pass, String gender) {
       
        this.username = username;
        this.email = email;
        this.pass = pass;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

   
    
}
    
    