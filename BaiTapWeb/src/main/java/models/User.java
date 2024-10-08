package models;

public class User {
	private String hoVaTen;
	private String email;
	private String tenDangNhap;
	private String matKhau;
	private String images;
	private String phone;
	private String roleId;
	
	
	public String getRoleId() {
		return roleId;
	}


	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}


	public String getImages() {
		return images;
	}


	public void setImages(String images) {
		this.images = images;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


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
	
	public User(String tenDangNhap, String hoVaTen, String email) {
		super();
		this.hoVaTen = hoVaTen;
		this.email = email;
		this.tenDangNhap = tenDangNhap;
	}


	public User(String tenDangNhap, String matKhau, String hoVaTen, String email) {
		super();
		this.hoVaTen = hoVaTen;
		this.email = email;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
	}


	public User(String hoVaTen, String email, String tenDangNhap, String images, String phone) {
		super();
		this.hoVaTen = hoVaTen;
		this.email = email;
		this.tenDangNhap = tenDangNhap;
		this.images = images;
		this.phone = phone;
	}


	public User(String hoVaTen, String email, String tenDangNhap, String matKhau, String images, String phone) {
		super();
		this.hoVaTen = hoVaTen;
		this.email = email;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.images = images;
		this.phone = phone;
	}
	


	public User(String hoVaTen, String email, String tenDangNhap, String matKhau, String images, String phone,
			String roleId) {
		super();
		this.hoVaTen = hoVaTen;
		this.email = email;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.images = images;
		this.phone = phone;
		this.roleId = roleId;
	}


	public User() {
		// TODO Auto-generated constructor stub
	}
	
	
}
