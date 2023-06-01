/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.helper;

import static java.lang.System.out;
import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;

    public static Connection getConnection() {
        try {

            if (con == null) {
               
                Class.forName("com.mysql.jdbc.Driver");

                
                con = DriverManager.
                        getConnection("jdbc:mysql://localhost:3306/sys", "root", "mango@12345");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}
