package repository.impl;

import model.Customer;
import repository.ICustomerRepo;
import sun.applet.AppletResourceLoader;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_resort2?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "anhchangpro1";

    private static final String SELECT_ALL_CUSTOMER = "select * from customer";
    private static final String ADD_CUSTOMER = "insert into customer values (?,?,?,?,?,?,?,?,?);";
    private static final String EDIT_CUSTOMER = "update customer set customer_type_id =? ,name=?,gender=?,id_card = ?,phone_number =?,email =?,address =? where id = ?; "

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Customer> selectAll() {
        List<Customer> list = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int customerTypeId = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                list.add(new Customer(id, customerTypeId, name, gender, idCard, phoneNumber, email, address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean addCustomer(Customer customer) {
        Connection connection = getConnection();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(ADD_CUSTOMER);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            ps.setInt(1, customer.getId());
            ps.setInt(2, customer.getCustomerTypeId());
            ps.setString(3, customer.getName());
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
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setInt(1,customer.getCustomerTypeId());
            preparedStatement.setString();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
