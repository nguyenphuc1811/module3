package service.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.IFacilityRepo;
import repository.impl.FacilityRepo;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepo facilityRepo = new FacilityRepo();

    @Override
    public List<FacilityType> selectFacilityType() {
        return facilityRepo.selectFacilityType();
    }

    @Override
    public List<RentType> selectRentType() {
       return facilityRepo.selectRentType();
    }

    @Override
    public List<Facility> selectAll() {
        return facilityRepo.selectAll();
    }

    @Override
    public boolean addFacility(Facility facility) {
        return facilityRepo.addFacility(facility);
    }

    @Override
    public boolean editFacility(Facility facility) {
        return facilityRepo.editFacility(facility);
    }

    @Override
    public boolean deleteFacility(int id) {
        return facilityRepo.deleteFacility(id);
    }
}
