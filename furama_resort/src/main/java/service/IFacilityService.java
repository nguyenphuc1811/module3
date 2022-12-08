package service;

import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> selectAll();

    boolean addFacility(Facility facility);

    boolean editFacility(Facility facility);

    boolean deleteFacility(int id);
}
