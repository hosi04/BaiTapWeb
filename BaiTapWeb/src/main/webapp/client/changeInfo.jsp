<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi thông tin tài khoản</title>
<link rel="stylesheet" href="../gui/css/style_changeInfo.css">
</head>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>

<body>

<%
	User user = (User) session.getAttribute("user");
	
	String hoVaTen= user.getHoVaTen();
	
	String email= user.getEmail();
	
	String phone= user.getPhone();
	
	String profileImage= user.getImages();
%>
    <div class="form-container">
        <h2>Change Information</h2>
       <form action="<%=url %>/Client" method="POST" enctype="multipart/form-data">
        	
        	<input type="hidden" name="action" value="changeInfo"/>
        	
            <div class="form-group">
				<label for="name">Họ và tên:</label> <input type="text" id="name"
					name="hoVaTen" value="<%=hoVaTen%>">
			</div>

			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" value="<%=email%>">
			</div>

			<div class="form-group">
				<label for="phone">Số điện thoại: </label> <input type="text"
					id="phone" name="phone" value="<%=phone%>">
			</div>

			<div class="form-group">
				<label for="profileImage">Tải lên ảnh đại diện:</label> <input
					type="file" id="profileImage" name="profileImage" value="<%=profileImage %>"
					onchange="previewImage(event)">
			</div>

			<!-- Hiển thị ảnh đại diện nếu có -->
			<% if (profileImage != null && !profileImage.isEmpty()) { %>
			    <h3>Ảnh đại diện:</h3>
			    <!-- Sử dụng context path và relative path lưu trong database -->
			    <img src="<%= request.getContextPath() + "/" + profileImage %>" alt="Ảnh đại diện" style="max-width: 200px; height: auto;">
			<% } else { %>
			    <p>Chưa có ảnh đại diện.</p>
			<% } %>
			
			<button type="submit" class="btn">Thay đổi</button>
        </form>
	</div>
	
</body>
</html>