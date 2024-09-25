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

	<!-- Begin Header -->
		<jsp:include page="header.jsp"></jsp:include>
	<!-- End Header -->
	
	 <!-- Begin Main Content-->
    <header class="masthead">
        <div class="container">
            <div class="masthead-subheading">Chào mừng đến với trang web của chúng tôi!</div>
            <div class="masthead-heading text-uppercase">Dịch vụ chất lượng cao</div>
            <a class="btn btn-primary btn-xl text-uppercase" href="#services">Xem thêm</a>
        </div>
    </header>

    <section id="services" class="page-section">
        <div class="container">
            <div class="text-center">
                <h2 class="section-heading text-uppercase">Dịch vụ của chúng tôi</h2>
                <h3 class="section-subheading text-muted">Chúng tôi cung cấp những dịch vụ tốt nhất</h3>
            </div>
            <div class="row text-center">
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="my-3">Dịch vụ A</h4>
                    <p class="text-muted">Mô tả về dịch vụ A.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="my-3">Dịch vụ B</h4>
                    <p class="text-muted">Mô tả về dịch vụ B.</p>
                </div>
                <div class="col-md-4">
                    <span class="fa-stack fa-4x">
                        <i class="fas fa-circle fa-stack-2x text-primary"></i>
                        <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                    <h4 class="my-3">Dịch vụ C</h4>
                    <p class="text-muted">Mô tả về dịch vụ C.</p>
                </div>
            </div>
        </div>
    </section>
	<!-- End Main Content-->
	
	<!-- Begin Footer -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- End Footer -->

</body>
</html>