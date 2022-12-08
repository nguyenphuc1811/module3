package service.impl;

import model.facility.Facility;
import repository.IFacilityRepo;
import repository.impl.FacilityRepo;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepo facilityRepo = new FacilityRepo();
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
