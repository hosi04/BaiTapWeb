<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ page import="javax.servlet.http.Cookie" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.red {
color: red;
}

</style>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();

String baoLoi = request.getAttribute("baoLoi") + "";
baoLoi = baoLoi.equals("null") ? "" : baoLoi;



String tenDangNhap = "";
String matKhau = "";

ArrayList<String> list = new ArrayList<>(); 
ArrayList<String> list2 = new ArrayList<>(); 
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("tenDangNhap")) {
        	tenDangNhap = cookie.getValue();
        	list.add(tenDangNhap);
        } else if (cookie.getName().equals("matKhau")) {
        	matKhau = cookie.getValue();
        	list2.add(matKhau);
        }
    }
}

%>

<link href="<%=url %>/gui/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>
<!--header start here-->
<div class="header">
		<div class="header-main">
		       <h1></h1>
			<div class="header-bottom">
				<div class="header-right w3agile">
					
					<div class="header-left-bottom agileinfo">
						
					 	<form action="<%=url %>/Client" method="post">
					 	
						 	<!--ACTION de xu ly-->
					 		<input type="hidden" name="action" value="login">	
						 	
						 	<span class="red"><%=baoLoi%></span>
							<input type="text"  value="<%=tenDangNhap %>" name="tenDangNhap" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User name';}"/>
							<input type="password"  value="<%=matKhau %>" name="matKhau" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}"/>
							<div class="remember">
					             <span class="checkbox1">
									   <label style="color: white;" ><input type="checkbox" name="nhoMatKhau" checked=""><i> </i>Remember me</label>
								 </span>
								 <div class="forgot">
								 	<h6><a href="./forgotPassword.jsp">Forgot Password?</a></h6>
								 </div>
								<div class="clear"> </div>
						  	</div>
						   
							<input type="submit" value="Login">
						</form>	
					<div class="header-left-top">
						<div class="sign-up"> <h2>or</h2> </div>
					</div>
					<form action="register.jsp" method="post">
						<input type="submit" value="Register">
					</form>	
				</div>
				</div>
			  
			</div>
		</div>
</div>
<!--header end here-->
<div class="copyright">
	<p>© 2016 Classy Login Form. All rights reserved | Design by  <a href="http://w3layouts.com/" target="_blank">  W3layouts </a></p>
</div>
<!--footer end here-->
</body>
</html>