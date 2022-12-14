package service.impl;

import model.customer.Customer;
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

    @Override
    public List<Customer> searchCustomer(String name, int customerTypeId, String address) {
        return customerRepo.searchCustomer(name,customerTypeId,address);
    }
}
