/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cor_learn.servlets;
import com.cor_learn.dao.AdminDao;
import com.cor_learn.dao.UserDao;
import com.cor_learn.entities.Admin;
import com.cor_learn.entities.Message;
import com.cor_learn.entities.user_info;
import com.cor_learn.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/**
 *
 * @author yashsaravane
 */
public class UserServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
      HttpSession s = request.getSession();
           Admin a=(Admin) s.getAttribute("currentAdmin");
            String name=request.getParameter("name");
                String pass=request.getParameter("pass");
                String c= request.getParameter("cid");
             int   cid=Integer.parseInt(c);
                UserDao dao= new UserDao(ConnectionProvider.getConnection());
                user_info user=new user_info(name,cid,pass,a.getId());
                if(dao.saveUser(user)){
                     // Message msg= new Message("Successfully added user and assigned courses","success","alert alert-success");
                      out.println("done");
                         Message msg= new Message("Successfully Added user ","success","alert alert-success");
                s.setAttribute("msg",msg);
                  response.sendRedirect("AdminProfile.jsp");
                }
                else{
                out.println("error");
             
                
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
