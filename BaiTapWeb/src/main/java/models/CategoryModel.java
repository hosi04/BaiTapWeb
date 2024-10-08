package models;

public class CategoryModel {
	private int categoryId;
	private String categoryName;
	private String images;
	private int status;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public CategoryModel() {
		super();
	}
	
	
	public CategoryModel(String categoryName, String images, int status) {
		super();
		this.categoryName = categoryName;
		this.images = images;
		this.status = status;
	}
	public CategoryModel(int categoryId, String categoryName, String images, int status) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.images = images;
		this.status = status;
	}
}
