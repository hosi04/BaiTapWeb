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
	
	String images= user.getImages();
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
					type="file" id="profileImage" name="profileImage" value="<%=images %>"
					onchange="previewImage(event)">
			</div>

			<!-- Thêm ảnh preview -->
			<div class="form-group">
				<img id="imagePreview"
					src="<%=request.getContextPath() + "/" + images%>"
					alt="Ảnh xem trước"
					style="width: 200px; height: 200px; object-fit: cover;">
			</div>

			<button type="submit" class="btn">Thay đổi</button>
        </form>
	</div>
	
	<script>
		function previewImage(event) {
			var image = document.getElementById('imagePreview');
			var file = event.target.files[0];

			if (file) {
				var reader = new FileReader();
				reader.onload = function(e) {
					image.src = e.target.result;
					image.style.display = 'block'; // Hiện ảnh xem trước
				};
				reader.readAsDataURL(file);
			} else {
				image.style.display = 'none'; // Ẩn ảnh nếu không có file nào được chọn
			}
		}
	</script>

</body>
</html>