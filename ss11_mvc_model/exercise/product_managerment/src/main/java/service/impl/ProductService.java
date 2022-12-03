package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone", 500, "Ngon", "Apple"));
        productList.add(new Product(2, "Samsung", 400, "Bo", "Samsung"));
        productList.add(new Product(3, "Xiaomi", 100, "re", "China"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productList);
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        int index = 0;
        for (int i = 0; i < productList.size(); i++) {
            if (id ==productList.get(i).getId()) {
                index = i;
                break;
            }
        }
        productList.remove(index);
    }

    @Override
    public void update(int id, Product product) {
        int index = 0;
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                index = i;
                break;
            }
        }
        productList.set(index, product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public Product findByName(String name) {
        for (Product product : productList) {
            if (product.getName().equals(name)) {
                return product;
            }
        }
        return null;
    }
}
