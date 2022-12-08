package repository;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepo {
    List<Customer> selectAll();

    boolean addCustomer(Customer customer);

    boolean editCustomer(Customer customer);

    boolean deleteCustomer(int id); 

    List<Customer> searchCustomer(String name, int customerTypeId, String address);
}
