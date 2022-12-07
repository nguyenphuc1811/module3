package service.impl;

import model.Customer;
import repository.ICustomerRepo;
import repository.impl.CustomerRepo;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepo customerRepo = new CustomerRepo();

    @Override
    public List<Customer> selectAll() {
       return customerRepo.selectAll();
    }

    @Override
    public boolean addCustomer(Customer customer) {
       return customerRepo.addCustomer(customer);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return customerRepo.editCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepo.deleteCustomer(id);
    }
}
