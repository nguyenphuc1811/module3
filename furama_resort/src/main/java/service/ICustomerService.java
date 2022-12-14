package service;

import model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAll();

    boolean addCustomer(Customer customer);

    boolean editCustomer(Customer customer);

    boolean deleteCustomer(int id);

    public List<Customer> searchCustomer(String name, int customerTypeId, String address);
}
