/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cor_learn.servlets;
import com.cor_learn.dao.CourseDao;
import com.cor_learn.entities.Admin;
import com.cor_learn.entities.Message;
import com.cor_learn.entities.courses;
import com.cor_learn.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import static java.lang.System.out;
import java.sql.*;
import java.sql.Connection;
import java.sql. DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;
/**
 *
 * @author yashsaravane
 */
@MultipartConfig
public class AddCourse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           HttpSession s = request.getSession();
           Admin a=(Admin) s.getAttribute("currentAdmin");
            String iid =request.getParameter("courseId");
                String name=request.getParameter("courseName");
                String sub=request.getParameter("subj");
                  int   cid=Integer.parseInt(iid);
             
            Part part=request.getPart("data");
              String filename=part.getSubmittedFileName();
              
             
               CourseDao dao= new CourseDao(ConnectionProvider.getConnection());
                courses course=new courses(name,cid,filename,a.getId(),sub);
               
             
             if(dao.saveCourse(course)){
                   
                      Message msg= new Message("Successfully Added course ","success","alert alert-success");
                s.setAttribute("msg",msg);
                  
                String path=getServletContext().getRealPath("")+"up_file";
                File file=new File(path);
              
                part.write(path+File.separator+filename);
                  System.out.println(path);
                  response.sendRedirect("admin-add-course.jsp");
                    
                    
                    
                    
                }
                else{
                    out.println("error");
                    out.println();
                }
            
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
