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
%>

    <div class="form-container">
        <h2>Change Information</h2>
        <form action="<%=url %>/Client" method="POST">
        	
        	<input type="hidden" name="action" value="changeInfo"/>
        	
            <div class="form-group">
                <label for="name">Họ và tên:</label>
                <input type="text" id="name" name="hoVaTen" value="<%= hoVaTen%>">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= email%>">
            </div>

            <button type="submit" class="btn">Thay đổi</button>
        </form>
    </div>

</body>
</html>