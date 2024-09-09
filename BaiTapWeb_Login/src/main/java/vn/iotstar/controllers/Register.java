package vn.iotstar.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databases.UserDAO;
import models.User;

/**
 * Servlet implementation class Register
 */

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		
		String hoVaTen = request.getParameter("hoVaTen");
		String email = request.getParameter("email");
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		String nhapLaiMatKhau = request.getParameter("nhapLaiMatKhau");
		
		request.setAttribute("hoVaTen", hoVaTen);
		request.setAttribute("email", email);
		request.setAttribute("tenDangNhap", tenDangNhap);
		request.setAttribute("matKhau", matKhau);
		request.setAttribute("nhapLaiMatKhau", nhapLaiMatKhau);
		
		UserDAO userDao = new UserDAO();
		User user = new User(tenDangNhap, nhapLaiMatKhau, hoVaTen, email);
		userDao.insert(user);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
