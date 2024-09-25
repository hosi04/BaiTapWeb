<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>



<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();

String baoLoi = request.getAttribute("baoLoi") + "";
baoLoi = baoLoi.equals("null") ? "" : baoLoi;
%>

<style type="text/css">

.red {
color: red;
}

.white{
color: #FFFFFF	;
}

</style>

<link href="<%=url %>/gui/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>

	<div class="header">
		<div class="header-main">
			<h1></h1>
			<div class="header-bottom">
				<div class="header-right w3agile">

					<div class="header-left-bottom agileinfo">

						<form action="<%=url %>/Client" method="post">
							<!--ACTION de xu ly-->
							<input type="hidden" name="action" value="forgotPassword"> 
							
							<span class="red"><%=baoLoi%></span>
							<br></br>
							<span class="white">Vui lòng nhập Email của bạn!</span>					
							<input type="text"
								name="email"/>
								
							<span class="white">Vui lòng nhập tên đăng nhập của bạn!</span>
							<input type="text"
								name="tenDangNhap"/>
								
								<span class="white">Vui lòng nhập mật khẩu mới!</span>
							<input type="password"
								name="matKhauMoi"/>
								
								<span class="white">Vui lòng nhập lại mật khẩu!</span>
							<input type="password"
								name="reMatKhauMoi"/>
								
							<input type="submit" value="Confirm">
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>