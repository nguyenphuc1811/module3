package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAll();

    boolean addCustomer(Customer customer);

    boolean editCustomer(Customer customer);

    boolean deleteCustomer(int id);
}
