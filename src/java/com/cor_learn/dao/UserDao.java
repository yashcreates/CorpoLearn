/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.dao;
import com.cor_learn.entities.Admin;
import com.cor_learn.entities.user_info;
import static java.lang.System.out;
import java.sql.*;
import java.sql.Connection;
import java.sql. DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpServletRequest;


 
public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
     public boolean saveUser(user_info user)
    {
       
        boolean f=false;
        try{
             
            
           String query="insert into user_info(name,pass,course_id,admin_id) values(?,?,?,?);";
           PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getPass());
            pstmt.setInt(3,user.getCourse_id());
            pstmt.setInt(4,user.getAdmin_id());
          int i=  pstmt.executeUpdate();
          
    
             f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
        }
     
      public user_info getUser(String name,String pass){
        user_info  user=null;
        try{
            String query ="select * from user_info where name=? and pass=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1,name);
            p.setString(2,pass);
            ResultSet set=p.executeQuery();
            if(set.next()){
                user=new user_info();
                user.setName(set.getString("name"));
                user.setPass(set.getString("pass"));
               // user.setEmail(set.getString("email"));
               // user.setPass(set.getString("pass"));
               // user.setGender(set.getString("gender"));
            }
         
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
    
}
