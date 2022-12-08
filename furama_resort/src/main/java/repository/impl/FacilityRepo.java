package repository.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.ConnectSQL;
import repository.IFacilityRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepo implements IFacilityRepo {
    ConnectSQL connectSQL = new ConnectSQL();
    private static final String SELECT_ALL = "select f.*,ft.name as facility_type_name,rt.name as rent_type_name from facility f join facility_type ft on f.facility_type_id = ft.id join rent_type rt on f.rent_type_id = rt.id;";
    private static final String ADD_FACILITY = "INSERT INTO facility(name,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free) values (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String EDIT_FACILITY = "update facility set name = ? , area = ? , cost = ? , max_people = ? , rent_type_id = ? ,facility_type_id = ? , standard_room = ?,description_other_convenience = ? , pool_area =? , number_of_floors = ? , facility_free = ? where id = ?;";
    private static final String DELETE_FACILITY = "delete from facility where id = ?;";
    private static final String RENT_TYPE = "select * from rent_type";
    private static final String FACILITY_TYPE = "select * from facility_type";

    @Override
    public List<FacilityType> selectFacilityType() {
        Connection connection = connectSQL.getConnection();
        List<FacilityType> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(FACILITY_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name =rs.getString("name");
                list.add(new FacilityType(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public List<RentType> selectRentType(){
        Connection connection = connectSQL.getConnection();
        List<RentType> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(RENT_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name =rs.getString("name");
                list.add(new RentType(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Facility> selectAll() {
        Connection connection = connectSQL.getConnection();
        List<Facility> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int area = rs.getInt("area");
                double cost = rs.getDouble("cost");
                int maxPeople = rs.getInt("max_people");
                int rentTypeId = rs.getInt("rent_type_id");
                String rentTypeName = rs.getString("rent_type_name");
                RentType rentType = new RentType(rentTypeId, rentTypeName);
                int facilityTypeId = rs.getInt("facility_type_id");
                String facilityTypeName = rs.getString("facility_type_name");
                FacilityType facilityType = new FacilityType(facilityTypeId, facilityTypeName);
                String standardRoom = rs.getString("standard_room");
                String description = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloor = rs.getInt("number_of_floors");
                String facilityFree = rs.getString("facility_free");
                list.add(new Facility(id, name, area, cost, maxPeople, rentType, facilityType, standardRoom, description, poolArea, numberOfFloor, facilityFree));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean addFacility(Facility facility) {
        Connection connection = connectSQL.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(ADD_FACILITY);
            ps.setString(1, facility.getName());
            ps.setInt(2, facility.getArea());
            ps.setDouble(3, facility.getCost());
            ps.setInt(4, facility.getMaxPeople());
            ps.setInt(5, facility.getRentType().getId());
            ps.setInt(6, facility.getFacilityType().getId());
            ps.setString(7, facility.getStandardRoom());
            ps.setString(8, facility.getDescription());
            ps.setDouble(9, facility.getPoolArea());
            ps.setInt(10, facility.getNumberOfFloor());
            ps.setString(11, facility.getFacilityFree());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editFacility(Facility facility) {
        Connection connection = connectSQL.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(EDIT_FACILITY);
            ps.setString(1, facility.getName());
            ps.setInt(2, facility.getArea());
            ps.setDouble(3, facility.getCost());
            ps.setInt(4, facility.getMaxPeople());
            ps.setInt(5, facility.getRentType().getId());
            ps.setInt(6, facility.getFacilityType().getId());
            ps.setString(7, facility.getStandardRoom());
            ps.setString(8, facility.getDescription());
            ps.setDouble(9, facility.getPoolArea());
            ps.setInt(10, facility.getNumberOfFloor());
            ps.setString(11, facility.getFacilityFree());
            ps.setInt(12, facility.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        Connection connection = connectSQL.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_FACILITY);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
