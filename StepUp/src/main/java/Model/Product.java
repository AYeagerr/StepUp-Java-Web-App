package Model;

public class Product {
	private int id;
	private String name;
	private String category;
	private String price;
	private String image;
	private int stock;
	private int qyt;
	private boolean isActive; // represent the active status of the product
	
	public Product() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getname() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getName() {
		return name;
	}

	public void setQyt(int qyt) {
		this.qyt = qyt;
	}
	
	public int getQyt() {
		return this.qyt;
	}
	
	public void setActive(boolean isActive) {
        this.isActive = isActive;
    }
	
	public boolean isActive() {
	    return isActive;
	}


}	