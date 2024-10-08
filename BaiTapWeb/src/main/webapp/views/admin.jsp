<%@page import="models.CategoryModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();

%>
<head>
    <meta charset="UTF-8">
    <title>Thông tin danh mục sản phẩm</title>
    <link rel="stylesheet" type="text/css" href="<%=url%>/gui/css/style_admin.css">
    <link href="<%=url %>/gui/css/style_category.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>Thêm danh mục sản phẩm</h1>
        <form action="<%=url %>/Admin" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="action" value="insertCategory"/>
            <table id="productTable">
                <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Ảnh sản phẩm</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="tenSanPham"></td>
                        <td>
							<div class="form-group">
								<label for="profileImage">Tải lên ảnh đại diện:</label> <input
									type="file" id="profileImage" name="profileImage"
									value="" onchange="previewImage(event)">
							</div>
						</td>
                        <td>
                            <select name="trangThai">
                                <option value="available">Còn hàng</option>
                                <option value="unavailable">Hết hàng</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
            <button type="submit">Lưu sản phẩm</button>
        </form>
        
         <!-- Form xóa sản phẩm -->
        <h1>Xóa danh mục sản phẩm</h1>
        
        <form action="<%=url %>/Admin" method="POST">
            <input type="hidden" name="action" value="deleteCategory"/>
            <div class="form-group">
                <label for="deleteProductId">Nhập ID sản phẩm để xóa:</label>
                <input type="text" id="deleteProductId" name=productId placeholder="ID sản phẩm" required>
            </div>
            <button type="submit" class="btn btn-danger" onclick="return confirmDelete()">Xóa sản phẩm</button>
        </form>
        
        
        <h1>Thay đổi thông tin danh mục sản phẩm</h1>
        <form action="<%=url %>/Admin" method="POST" enctype="multipart/form-data">
	        <input type="hidden" name="action" value="changeCategory"/>
	        <input type="hidden" name="action" value="insertCategory"/>
	            <table id="productTable">
	                <thead>
	                    <tr>
	                    	<th>ID sản phẩm</th>
	                        <th>Tên sản phẩm</th>
	                        <th>Ảnh sản phẩm</th>
	                        <th>Trạng thái</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                    	<td><input type="text" name="idSanPham"></td>
	                        <td><input type="text" name="tenSanPham"></td>
	                        <td>
								<div class="form-group">
									<label for="profileImage">Tải lên ảnh đại diện:</label> <input
										type="file" id="profileImage" name="profileImage"
										onchange="previewImage(event)">
								</div>
							</td>
	                        <td>
	                            <select name="trangThai">
	                                <option value="available">Còn hàng</option>
	                                <option value="unavailable">Hết hàng</option>
	                            </select>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	            <button type="submit">Thay đổi</button>
        </form>
    </div>

    <script>
        // Optional function for previewing the uploaded image
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function() {
                const output = document.getElementById('outputImage');
                if (output) {
                    output.src = reader.result;
                }
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        // Function to confirm before deleting
        function confirmDelete() {
            return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');
        }
    </script>
    </div>
</body>
</html>
