package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepo {
    List<Customer> selectAll();

    boolean addCustomer(Customer customer);

    boolean editCustomer(Customer customer);
}
