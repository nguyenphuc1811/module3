package service;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;

import java.util.List;

public interface IFacilityService {
    List<FacilityType> selectFacilityType();

    List<RentType> selectRentType();

    List<Facility> selectAll();

    boolean addFacility(Facility facility);

    boolean editFacility(Facility facility);

    boolean deleteFacility(int id);
}
