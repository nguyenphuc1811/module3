package repository;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepo {
    List<Facility> selectAll();

    boolean addFacility(Facility facility);

    boolean editFacility(Facility facility);

    boolean deleteFacility(int id);
}
