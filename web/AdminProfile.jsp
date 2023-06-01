<%-- 
    Document   : AdminProfile.jsp
    Created on : 21-May-2023, 9:15:32?pm
    Author     : yashsaravane
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@page import="com.cor_learn.entities.Admin"%>
<%@page import="com.cor_learn.entities.courses"%>
<%@page import="com.cor_learn.dao.AdminDao"%>
<%@page import="com.cor_learn.dao.CourseDao"%>
<%@page import="com.cor_learn.helper.ConnectionProvider"%>

<%@page import="java.util.ArrayList"%>
<%
    Admin a = (Admin) session.getAttribute("currentAdmin");
    if (a == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
                        
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:46:41 GMT -->
<head>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Course Management System</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="css/messi.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

</head>
<body>
    
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>Corporate Management System</h1>
			</div>

			<div class="right-div">
				<a href="LogoutServlet" class="btn btn-danger pull-right">LOG
					OUT</a>
			</div>
		</div>
	</div>
 
<section class="menu-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
                            
				<div class="navbar-collapse collapse ">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="admin-dashboard.jsp">Dashboard</a></li>
						<li><a href="admin-add-course.jsp">Add Course</a></li>
						<li><a href="admin-view-course.jsp">View Courses</a></li>
						<li><a href="admin-view-users.jsp"> View Users</a></li>
						<li><a href="admin-view-feedback.jsp">View Feedback</a></li>
						<li><a href="admin-view-contacts.jsp">View Contacts</a></li>
						<li><a href="" data-toggle="modal" data-target="#assign_course">Assign C</a></li>
                                                <li><a href=""><font color="#ff8c00"><%= a.getUsername() %></font> </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
                                        <table class="table">
  <thead class="thead-dark">
      <tr>
          <th scope="col"><span background-color:blue><h5><b>Subject</b></h5></span></th>
          <th scope="col"><h5><b>No of emp assigned</b></h5></th>
         
    </tr>
          
  </thead>
  <tbody>
      <tr>
          <th>  </th> 

      </tr>
      <%
      CourseDao cd=new CourseDao(ConnectionProvider.getConnection());
       ArrayList<courses> c= cd.getcount(a.getId());
       for(courses i:c){
       
              %>
    <tr>
      <th scope="row"><%=i.getSubject()%></th>
      <td> <%= i.getCount() %></td>
     
      
    </tr>
      <%}%>
   
   
  </tbody>
</table>
   
    
    
    
	
	<!-- MENU SECTION END-->
        <!-- Button trigger modal -->


<!-- Modal -->

	
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2023 MESSI</div>
			</div>
		</div>
	</section>
        
  <div class="modal fade" id="assign_course" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Enter User details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="UserServlet" method="POST">
            
              
              <div class="form-group">
                  <input type=""text" name="name" placeholder="Enter user name" class="form-control"/>
              </div>
               <div class="form-group">
                  <input type=""text" name="pass" placeholder="Enter password for user" class="form-control"/>
              </div>
              <div class="form-group">
                  <input type="text" name="cid" placeholder="Enter course id to be assigned" class="form-control"/>
              </div>
                 
                 
              
              
              <button type="submit" class="btn btn-primary" >Submit</button>
          </form>
          
          
          
          
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>

	
</body>
</html>

