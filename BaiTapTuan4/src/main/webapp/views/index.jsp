<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

<!-- BOOTSTRAP -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();


%>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=url %>/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=url %>/gui/css/style_index.css" rel="stylesheet" />



</head>
<body>

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="<%=url %>/gui/images/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#services">Dịch vụ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#portfolio">Danh mục sản phẩm</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">Giới thiệu</a></li>
                        <li class="nav-item"><a class="nav-link" href="#team">Đồng đội</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Liên hệ</a></li>
                              
                        <%
                        Object obj = session.getAttribute("user");
                    	User user = null;
                    	if (obj == null){
						%>
                        	<li class="nav-item"><a class="nav-link" href="login.jsp">Đăng nhập</a></li>
                       		<li class="nav-item"><a class="nav-link" href="register.jsp">Đăng ký</a></li>
                        <%}else {%>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Thay đổi thông tin</a></li>
									<li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="<%=url %>/Client?action=logout">Đăng xuất</a></li>
								</ul>
							</li>
					<%}%>
                        
                        
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>