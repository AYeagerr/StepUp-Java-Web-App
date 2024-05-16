package Model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Product> products = new ArrayList<>();

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public void addProduct(Product product) {
        // Check if the product is already in the cart
        for (Product p : products) {
            if (p.getId() == product.getId()) {
                p.setQyt(p.getQyt() + product.getQyt());
                return;
            }
        }
        products.add(product);
    }

    public void removeProduct(int productId) {
        products.removeIf(p -> p.getId() == productId);
    }

    public double getTotalPrice() {
        double total = 0;
        for (Product p : products) {
            total += Double.parseDouble(p.getPrice()) * p.getQyt();
        }
        return total;
    }
}