package databases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.CategoryModel;
import models.User;

public class CategoryDAO implements DAOInterface<CategoryModel>{

	@Override
	public ArrayList<CategoryModel> selectAll() {
		ArrayList<CategoryModel> ketQua = new ArrayList<CategoryModel>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM categories";
			
			PreparedStatement st = con.prepareStatement(sql);
			
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				int categoryId = rs.getInt("categoryid");
				String categoryName = rs.getString("categoryname");
				String images = rs.getString("images");
				int status = rs.getInt("status");
				
				CategoryModel categoryModel = new CategoryModel(categoryId, categoryName, images, status);
				ketQua.add(categoryModel);
			}
		}
		catch (Exception e) {
			// TODO: handle exceptione
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public CategoryModel selectById(CategoryModel t) {
		CategoryModel ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM categories WHERE categoryid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getCategoryId());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				int categoryId = rs.getInt("categoryid");
				String categoryName = rs.getString("categoryName");
				String images = rs.getString("images");
				int status = rs.getInt("status");
				
				ketQua = new CategoryModel(categoryId, categoryName, images, status);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insert(CategoryModel t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO categories (categoryname, images, status) "
					+ " VALUES (?,?,?)";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryName());
			st.setString(2, t.getImages());
			st.setInt(3, t.getStatus());



			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<CategoryModel> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(CategoryModel t) {
		int ketQua = 0; 
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from categories " + " WHERE categoryid = ?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, t.getCategoryId());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<CategoryModel> arr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(CategoryModel t) {
		int ketQua = 0;
		try {
			Connection con = JDBCUtil.getConnection();
		
			String sql = "UPDATE categories " +
		             "SET categoryname = ?, " +  // thêm dấu phẩy
		             "images = ?, " +            // thêm dấu phẩy
		             "status = ? " +             // không có dấu phẩy ở cuối
		             "WHERE categoryid = ?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryName());
			st.setString(2, t.getImages());
			st.setInt(3, t.getStatus());
			st.setInt(4, t.getCategoryId());
			
			System.out.println(sql);
			ketQua = st.executeUpdate();
			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ketQua;
	}

}
