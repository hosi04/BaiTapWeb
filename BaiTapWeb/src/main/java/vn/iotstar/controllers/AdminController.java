package vn.iotstar.controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mysql.cj.protocol.a.NativeConstants.IntegerDataType;

import databases.CategoryDAO;
import models.CategoryModel;

/**
 * Servlet implementation class AdminController
 */
@WebServlet(urlPatterns = {"/Admin"})
@MultipartConfig
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Set Character
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String action = request.getParameter("action");
		
		if(action.equals("insertCategory")) {
			insertCategory(request, response);
		}
		else if(action.equals("deleteCategory")) {
			deleteCategory(request, response);
		}
		else if(action.equals("changeCategory")) {
			changeCategory(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void insertCategory(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
//		//Set Character
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
		
		try {
			String productName = request.getParameter("tenSanPham");
			//String productImages = request.getParameter("anhSanPham");
			String status = request.getParameter("trangThai");
			int status_ok;
			if(status.equals("available"))
				status_ok = 1;
			else
				status_ok = 0;
			
			// Xử lý file upload
	        Part filePart = request.getPart("profileImage");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

	        System.out.println("OK");
	        // Đường dẫn lưu file ảnh trên server
	        String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
	        File uploadFolder = new File(uploadDir);
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs(); // Tạo thư mục nếu chưa tồn tại
	        }

	        // Lưu file ảnh vào thư mục
	        String filePath = uploadDir + File.separator + fileName;
	        filePart.write(filePath);

	        // Lưu đường dẫn file ảnh (relative path) vào cơ sở dữ liệu
	        String images = "uploads/" + fileName; //imgPath
	        
	        String url = "";
			
	        CategoryModel categoryModel = new CategoryModel(productName, images, status_ok);
	        CategoryDAO categoryDAO = new CategoryDAO();
	        categoryDAO.insert(categoryModel);
	        url = "/notify/registerSuccess.jsp";
	        
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);

		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
	 	
		try {
			int id = Integer.parseInt(request.getParameter("productId"));
			CategoryDAO categoryDAO = new CategoryDAO();
			CategoryModel categoryModel = new CategoryModel();
			categoryModel.setCategoryId(id);
			categoryDAO.delete(categoryModel);
			
			String url = "/views/admin.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	private void changeCategory(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		
		try {
			int idSanPham = Integer.parseInt(request.getParameter("idSanPham"));
			String tenSanPham = request.getParameter("tenSanPham");
			
			// Xử lý file upload
	        Part filePart = request.getPart("profileImage");
	        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

	        System.out.println("OK");
	        // Đường dẫn lưu file ảnh trên server
	        String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
	        File uploadFolder = new File(uploadDir);
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs(); // Tạo thư mục nếu chưa tồn tại
	        }

	        // Lưu file ảnh vào thư mục
	        String filePath = uploadDir + File.separator + fileName;
	        filePart.write(filePath);

	        // Lưu đường dẫn file ảnh (relative path) vào cơ sở dữ liệu
	        String anhSanPham = "uploads/" + fileName; //imgPath
			String tmp = request.getParameter("trangThai");
			int trangThai;
			if(tmp.equals("available"))
				trangThai = 1;
			else {
				trangThai = 0;
			}
			
			CategoryDAO categoryDAO = new CategoryDAO();
			CategoryModel categoryModel = new CategoryModel(idSanPham, tenSanPham, anhSanPham, trangThai);
			categoryDAO.update(categoryModel);
			
			String url = "/notify/registerSuccess.jsp";
	        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
