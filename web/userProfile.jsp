<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.cor_learn.helper.*"%>
<%@page import="com.cor_learn.entities.user_info"%>
<%@page import="com.cor_learn.dao.UserDao"%>
<%
    user_info u = (user_info) session.getAttribute("currentUser");
    if (u == null) {
      
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
				<h1>Corpo Learn System</h1>
			</div>

			<div class="right-div">
				<a href="logout.jsp" class="btn btn-danger pull-right">LOG ME
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
						<li><a href="userDashboard.jsp">Enroll Course</a></li>
						<li><a href="user-feedback.jsp">Give Feedback</a></li>
						<li><a href="contact-us.jsp">Contact Us</a></li>
						<li><a href="view-user-profile.jsp">View Profile</a></li>
						<li><a href="user-change-password.jsp">Change Password</a></li>
						<li><a href=""><font color="#ff8c00"><%= u.getName() %></font></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">View Courses</h4>
				</div>
			</div>
			
		
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-warning">
						<div class="panel-heading">View Courses</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>DATA</th>
											<th>Course Name</th>
											
										</tr>
									</thead>
									
									<tbody>
                                                                           
                                                                            <%
                                                                                String un=u.getName(); 
                                                                                String pa=u.getPass();
                                                                                String query="select video_data,course_name from courses inner join user_info on courses.course_id=user_info.course_id where name=? and pass=?";
                                                               
										Connection con=ConnectionProvider.getConnection();
                                                                                PreparedStatement ps = con.prepareStatement( query);
                                                                                ps.setString(1,un);
                                                                                ps.setString(2,pa);
				                                                ResultSet rs = ps.executeQuery();
                                                                                 while(rs.next()){
                                                                                        %>
                                                                                <tr>

					<%
					if (rs.getString("video_data").endsWith(".pdf")) {
					%>

					<th scope="row"><img alt="" src="images/pdf.jpg" width="200px"
						height="100px"> <h6><a href="up_file/<%=rs.getString("video_data")%>">watch</a></h6></th>


					<%
					} else if (rs.getString("video_data").endsWith(".xlsx")) {
					%>

					<th scope="row"><img alt="" src="imgs/xls.jpg" width="200px"
                                                             height="100px">  <h6><a href="up_file/<%=rs.getString("video_data")%>">watch</a></h6></th>


					<%
					} else {
					%>
					<th scope="row"><img alt=""
						src="up_file/<%=rs.getString("video_data")%>" width="200px"
                                                height="100px"> <h6><a href="up_file/<%=rs.getString("video_data")%>">watch</a></h6></th>
					<%
					}
					%>




					<td><%=rs.getString("course_name")%></td>

				</tr>
				<%
				}
				%>



									</tbody>
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">&copy; 2023 Course Management System</div>

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

</body>
</html>
