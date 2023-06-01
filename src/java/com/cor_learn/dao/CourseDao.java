/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.dao;

import com.cor_learn.entities.Admin;
import com.cor_learn.entities.courses;
import java.sql.*;

import static java.lang.System.out;
import java.sql.*;
import java.sql.Connection;
import java.sql. DriverManager;

import java.sql.SQLException;
import jakarta.servlet.http.HttpServletRequest;
import java.io.File;


import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author yashsaravane
 */
public class CourseDao {
      private Connection con;

    public CourseDao(Connection con) {
        this.con = con;
    }
       public boolean saveCourse(courses course)
    {
       
        boolean f=false;
        try{
            
           String query="insert into courses(course_id,course_name,video_data,subject,admin_id) values(?,?,?,?,?)";
           PreparedStatement pstmt= this.con.prepareStatement(query);
            pstmt.setInt(1,course.getCourse_id());
            pstmt.setString(2,course.getCourse_name());
            pstmt.setString(3,course.getVideo_data());
            pstmt.setString(4,course.getSubject());
            pstmt.setInt(5,course.getAdmin_id());
     int i= pstmt.executeUpdate();
          
    
             f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
        }
       
       
       public ArrayList<courses> getcount(int b) {
        ArrayList<courses> list1 = new ArrayList<>();
       
        
        try {

            String q = "select subject, count(*) as c  from courses  group by subject,admin_id having admin_id="+b;
             PreparedStatement p= con.prepareStatement(q);
           
           // p.setInt(1,b);
            ResultSet set = p.executeQuery(q);
            while (set.next()) {
                courses c;
                String subjj = set.getString("subject");
               int counnt=set.getInt("c");
                 c = new courses(counnt,subjj);
                list1.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list1;
    }
}


    