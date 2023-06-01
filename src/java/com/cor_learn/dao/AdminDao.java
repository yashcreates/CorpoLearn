/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.dao;
import com.cor_learn.entities.Admin;
import static java.lang.System.out;
import java.sql.*;
import java.sql.Connection;
import java.sql. DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author yashsaravane
 */
public class AdminDao {
    
    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveAdmin(Admin admin)
    {
       
        boolean f=false;
        try{
            
           String query="insert into admin1(username,email,pass,gender) values(?,?,?,?);";
           PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setString(1,admin.getUsername());
            pstmt.setString(2,admin.getEmail());
            pstmt.setString(3,admin.getPass());
            pstmt.setString(4,admin.getGender());
          int i=  pstmt.executeUpdate();
          
    
             f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
        }
    
        //ADMIN LOGIN
    public Admin getAdmin(String email,String pass){
        Admin admin=null;
        try{
            String query ="select * from admin1 where email=? and pass=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1,email);
            p.setString(2,pass);
            ResultSet set=p.executeQuery();
            if(set.next()){
                admin=new Admin();
                admin.setId(set.getInt("id"));
                admin.setUsername(set.getString("username"));
                admin.setEmail(set.getString("email"));
                admin.setPass(set.getString("pass"));
                admin.setGender(set.getString("gender"));
            }
         
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return admin;
    }
    
    
    
    
    }

