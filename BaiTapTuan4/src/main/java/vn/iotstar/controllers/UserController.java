package vn.iotstar.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databases.UserDAO;
import models.User;

/**
 * Servlet implementation class UserController
 */

@WebServlet(urlPatterns = {"/Client"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action.equals("login")) {
			login(request, response);
		}
		else if(action.equals("register")) {
			register(request, response);
		}
		else if(action.equals("logout")){
			logout(request, response);
		}else if(action.equals("forgotPassword")) {
			forgotPassword(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			
			UserDAO userDao = new UserDAO();
			User user = new User();
			
			user.setTenDangNhap(tenDangNhap);
			user.setMatKhau(matKhau);
			String url = "";
			
			user = userDao.checkLogin(user);
		
			String rememberMe = request.getParameter("nhoMatKhau");
			
			if (user != null) {
				//Ten dang nhap va mat khau hop le
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				url = "/views/index.jsp";
				
				if (rememberMe != null && rememberMe.equals("on")) {
	                // Tạo cookie cho tên đăng nhập
	                Cookie tenDangNhapCookie = new Cookie("tenDangNhap", tenDangNhap);
	                tenDangNhapCookie.setMaxAge(60 * 60 * 24 * 7); // Cookie có hiệu lực trong 7 ngày
	                
	                // Tạo cookie cho mật khẩu
	                Cookie matKhauCookie = new Cookie("matKhau", matKhau);
	                matKhauCookie.setMaxAge(60 * 60 * 24 * 7); // Cookie có hiệu lực trong 7 ngày
	                
	                // Lưu cookie vào trong response
	                response.addCookie(tenDangNhapCookie);
	                response.addCookie(matKhauCookie);
	            }
			}
			else {
				request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!");
				url = "/views/login.jsp";
			}
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			
			//Làm sạch hết trong session
			session.invalidate();
			
			response.sendRedirect("views/index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void register(HttpServletRequest request, HttpServletResponse response) {
		try {
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
			response.sendRedirect("notify/registerSuccess.jsp");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void forgotPassword(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhauMoi = request.getParameter("matKhauMoi");
			String reMatKhauMoi = request.getParameter("reMatKhauMoi");
			
			UserDAO userDAO = new UserDAO();
			User user = new User();
			
			user.setEmail(email);
			user.setTenDangNhap(tenDangNhap);
			user.setMatKhau(matKhauMoi);
			
			String url = "/views/forgotPassword.jsp";
			
			if(userDAO.forgotPassword(user) != null) {
				if(!matKhauMoi.equals(reMatKhauMoi)) {
					request.setAttribute("baoLoi", "Mật khẩu không khớp!");
					url = "/views/forgotPassword.jsp";
				}
				else {
					try {
						//Đổi mật khẩu
						userDAO.update(user);
						response.sendRedirect("notify/registerSuccess.jsp");
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}	
				}
			}else {
				request.setAttribute("baoLoi", "Tên đăng nhập hoặc email không tồn tại!");
				url = "/views/forgotPassword.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
}
