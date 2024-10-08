<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<body>


<h1>Thao tác thành công! Hệ thống sẽ quay về trang chủ sau 3s</h1>

	<script>
		HttpSession session = request.getSession();
		//Làm sạch hết trong session
		session.invalidate();
		
        setTimeout(function(){
            <% response.sendRedirect("../views/index.jsp"); %>
        }, 3000);
    </script>

</body>
</html>