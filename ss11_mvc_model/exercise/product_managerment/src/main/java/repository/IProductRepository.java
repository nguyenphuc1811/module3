package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void add(Product product);
    void delete(int id);
    void update(int id,Product product);
    Product findById(int id);
    Product findByName(String name);
}
