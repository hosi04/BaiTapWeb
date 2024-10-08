<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh mục sản phẩm</title>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<link href="<%=url %>/gui/css/style_category.css" rel="stylesheet" />

</head>
<body>

<!-- Begin Product-->
	<section id="products" class="page-section bg-light">
		<div class="container">
			<h2>CATEGORY</h2>
		    <table class="product-table">
		        <thead>
		            <tr>
		                <th>Category ID</th>
		                <th>Category Name</th>
		                <th>Image</th>
		                <th>Status</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="category" items="${categoryList}">
		                <tr>
		                    <td> ${category.categoryId}</td>
		                    <td>${category.categoryName}</td>
		                    <td>
		                    	<img src="${category.images}" alt="Image of ${category.categoryName}">
		                    </td>
		                    <td>
		                    	${category.status == 0 ? 'Hết hàng' : 'Còn hàng'}
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
	</section>
<!-- End Product-->

</body>
</html>