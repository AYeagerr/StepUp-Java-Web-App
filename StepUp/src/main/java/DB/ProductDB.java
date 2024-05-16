package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Model.Product;

public class ProductDB {
    private Connection con;
    private String query;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ProductDB(Connection con) {
        this.con = con;
    }
    
    public boolean addProduct(Product product) {
        String query = "INSERT INTO products (name, category, price, img, stock) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = this.con.prepareStatement(query)) {
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setString(3, product.getPrice());
            pstmt.setString(4, product.getImage());
            pstmt.setInt(5, product.getStock());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error adding product: " + e.getMessage());
            return false;
        }
    }
    
    //Instead of actually deleting the product, flag it as inactive or unavailable. 
    //This method keeps historical data intact.
    public boolean deactivateProduct(int productId) {
    	try {
    		String query = "UPDATE products SET is_active = FALSE WHERE id = ?";
    		PreparedStatement pstmt = this.con.prepareStatement(query);
    		pstmt.setInt(1, productId);
    		int result = pstmt.executeUpdate();
    		return result > 0;
    	} catch (SQLException e) {
    		System.out.println("Error deactivating product: " + e.getMessage());
    		return false;
    	}
    }
    
    public boolean activateProduct(int productId) {
        try {
            String query = "UPDATE products SET is_active = TRUE WHERE id = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, productId);
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error activating product: " + e.getMessage());
            return false;
        }
    }
    
    public boolean updateProduct(Product product) {
        try {
            String query = "UPDATE products SET name = ?, category = ?, price = ?, img = ?, stock = ? WHERE id = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setString(3, product.getPrice());
            pstmt.setString(4, product.getImage());
            pstmt.setInt(5, product.getStock());
            pstmt.setInt(6, product.getId());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error updating product: " + e.getMessage());
            return false;
        }
    }


    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            query = "SELECT * FROM products";
            pstmt = this.con.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getString("price"));
                product.setImage(rs.getString("img"));
                product.setStock(rs.getInt("stock"));
                product.setActive(rs.getBoolean("is_active"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    
    // Edit inventory
    public Product getProductById(int productId) {
        Product product = null;
        try {
            query = "SELECT * FROM products WHERE id = ?";
            pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, productId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getString("price"));
                product.setImage(rs.getString("img"));
                product.setStock(rs.getInt("stock"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    
    public boolean updateProductStock(int productId, int quantity) {
        try {
            query = "UPDATE products SET stock = GREATEST(0, stock - ?) WHERE id = ? AND stock >= ?";
            pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, quantity);
            pstmt.setInt(2, productId);
            pstmt.setInt(3, quantity);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}