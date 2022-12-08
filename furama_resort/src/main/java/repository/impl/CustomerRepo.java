package repository.impl;

import model.customer.Customer;
import repository.ConnectSQL;
import repository.ICustomerRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {

    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String ADD_CUSTOMER = "insert into customer (customer_type_id,name,date_of_birth,gender,id_card,phone_number,email,address) values (?,?,?,?,?,?,?,?);";
    private static final String EDIT_CUSTOMER = "update customer set customer_type_id =? ,name=?,date_of_birth = ?,gender=?,id_card = ?,phone_number =?,email =?,address =? where id = ?; ";
    private static final String DELETE_CUSTOMER = "delete from customer where id = ?;";
    private static final String SEARCH_CUSTOMER = "select * from customer where name like ? and customer_type_id = ? and address like ? ";
    ConnectSQL connectSQL = new ConnectSQL();

    public List<Customer> searchCustomer(String name, int customerTypeId, String address) {
        List<Customer> list = new ArrayList<>();
        Connection connection = connectSQL.getConnection();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(SEARCH_CUSTOMER);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            assert ps != null;
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, customerTypeId);
            ps.setString(3, "%" + address + "%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerType = resultSet.getInt("customer_type_id");
                String nameCt = resultSet.getString("name");
                String date = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String addressCt = resultSet.getString("address");
                list.add(new Customer(id, customerType, nameCt, date, gender, idCard, phoneNumber, email, addressCt));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Customer> selectAll() {
        List<Customer> list = new ArrayList<>();
        Connection connection = connectSQL.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                String date = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                list.add(new Customer(id, customerTypeId, name, date, gender, idCard, phoneNumber, email, address));
            }
            resultSet.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean addCustomer(Customer customer) {
        Connection connection = connectSQL.getConnection();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(ADD_CUSTOMER);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            ps.setInt(1, customer.getCustomerTypeId());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getDate());
            ps.setBoolean(4, customer.isGender());
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhoneNumber());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editCustomer(Customer customer) {
        Connection connection = connectSQL.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setInt(1, customer.getCustomerTypeId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setBoolean(4, customer.isGender());
            preparedStatement.setString(3, customer.getDate());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhoneNumber());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setInt(9, customer.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = connectSQL.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_CUSTOMER);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
