package service;


import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void add(Product product);
    boolean delete(int id);
    void update(Product product);
    Product findById(int id);
    Product findByName(String name);
}
