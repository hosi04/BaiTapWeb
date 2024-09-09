<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>

<link href="<%=url %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>
	
l<!--header start here-->
<div class="header">
		<div class="header-main">
		       <h1>BaiTapLogin</h1>
			<div class="header-bottom">
				<div class="header-right w3agile">
					
					<div class="header-left-bottom agileinfo">
						
					 <form action="<%=url %>/Login" method="post">
						<input type="text"  value="User name" name="tenDangNhap" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User name';}"/>
					<input type="password"  value="Password" name="matKhau" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}"/>
						<div class="remember">
			             <span class="checkbox1">
							   <label class="checkbox"><input type="checkbox" name="" checked=""><i> </i>Remember me</label>
						 </span>
						 <div class="forgot">
						 	<h6><a href="#">Forgot Password?</a></h6>
						 </div>
						<div class="clear"> </div>
					  </div>
					   
						<input type="submit" value="Login">
					</form>	
					<div class="header-left-top">
						<div class="sign-up"> 
						<h2>or</h2> 
					</div>
					</div>
					
					<form action="./register.jsp">
						<input type="submit" value="Register">
					</form>
						
				</div>
				</div>
			  
			</div>
		</div>
</div>
<!--header end here-->	
	
</body>
</html>