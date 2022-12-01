package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Iphone",500,"Ngon","Apple"));
        productList.add(new Product(2,"Samsung",400,"Bo","Samsung"));
        productList.add(new Product(3,"Xiaomi",100,"re","China"));
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
    public boolean delete(int id) {
        for (Product product: productList) {
            if(product.getId() == id){
                return true;
            }
        }
        return false;
    }

    @Override
    public void update( Product product) {
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public Product findByName(String name) {
        for (Product product: productList) {
            if(product.getName().equals(name)){
                return product;
            }
        }
        return null;
    }
}
