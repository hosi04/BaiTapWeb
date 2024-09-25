<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>

<link href="<%=url %>/gui/css/style_register.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="<%=url %>/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">


</head>
<body>

		<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>SignUp Form</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form action="<%=url %>/Client" method="post">
					<!--ACTION de xu ly-->
					 <input type="hidden" name="action" value="register">
					 
					<input class="text" type="text" name="hoVaTen" placeholder="Fullname" required="">
					<input class="text email" type="email" name="email" placeholder="Email" required="">
					<input style="margin-bottom: 28px" class="text" type="text" name="phone" placeholder="Phone" required="">
					<input style="margin-bottom: 28px" class="text" type="text" name="tenDangNhap" placeholder="Username" required="">
					<input class="text" type="password" name="matKhau" placeholder="Password" required="">
					<input class="text w3lpass" type="password" name="nhapLaiMatKhau" placeholder="Confirm Password" required="">
					<input type="submit" value="SIGN UP">
				</form>
				<p>You have been an Account? <a href="./login.jsp"> Login Now!</a></p>
			</div>
		</div>
	</div>
	<!-- //main -->
</body>
</html>