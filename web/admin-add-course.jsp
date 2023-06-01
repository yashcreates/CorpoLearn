<%-- 
    Document   : admin-add-course
    Created on : 26-May-2023, 5:45:37?pm
    Author     : yashsaravane
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cor_learn.entities.Admin"%>
<%@page import="com.cor_learn.dao.AdminDao"%>
<%@page import="com.cor_learn.entities.Message"%>
<%
    Admin a = (Admin) session.getAttribute("currentAdmin");
    if (a == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
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
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				<h1>Corporate Learning System</h1>
			</div>
			<div class="right-div">
				<a href="logout.jsp" class="btn btn-danger pull-right">LOG ME
					OUT</a>
			</div>
		</div>
	</div>
	<!-- LOGO HEADER END-->
	
        
         
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
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Add Course</h4>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="images/add-course.jpg" class="img-thumbnail"
						alt="Cinque Terre" style="width: 500px; height: 430px;">
				</div>
				
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">Add Course</div>
                                                
                            <%
                                Message m = (Message)session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div> 


                            <%        
                                    session.removeAttribute("msg");
                                }
                            %>
						<div class="panel-body">
							<form  action="AddCourse" method="POST"
								enctype="multipart/form-data">
								<div class="form-group">
									<label>Course id</label> <input class="form-control"
										type="text" name="courseId" />
								</div>
								<div class="form-group">
									<label>Course Name</label>
									<input class="form-control"
										type="text" name="courseName" />
								</div>
								<div class="form-group">
									<label>Subject</label> <input class="form-control"
										type="text" name="subj" />
								</div>
								<div class="form-group">
									<label>Course Resources</label> <input class="form-control"
										type="file" name="data" />
								</div>
								<button type="submit"  class="btn btn-info">Add Course</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2023 messi</div>
			</div>
		</div>
	</section>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$('#success').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#danger').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#warning').delay(3000).show().fadeOut('slow');
		});

		$(function() {
			$('#info').delay(3000).show().fadeOut('slow');
		});
	</script>
	
</body>
</html>
