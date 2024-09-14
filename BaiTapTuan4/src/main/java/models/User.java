package models;

public class User {
	private String hoVaTen;
	private String email;
	private String tenDangNhap;
	private String matKhau;
	
	
	public String getHoVaTen() {
		return hoVaTen;
	}


	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTenDangNhap() {
		return tenDangNhap;
	}


	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}


	public String getMatKhau() {
		return matKhau;
	}


	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}


	public User(String tenDangNhap, String matKhau, String hoVaTen, String email) {
		super();
		this.hoVaTen = hoVaTen;
		this.email = email;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
	}


	public User() {
		// TODO Auto-generated constructor stub
	}
	
	
}
