package com.summer.iam.application.service;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.interfaces.rest.dto.department.DepartmentCreateRequest;
import com.summer.iam.interfaces.rest.dto.department.DepartmentResponse;
import com.summer.iam.interfaces.rest.dto.department.DepartmentUpdateRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class DepartmentCommandService {
    private final DepartmentRepository departmentRepository;

    public DepartmentCommandService(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    @Transactional
    public DepartmentResponse create(DepartmentCreateRequest req) {
        Department d = new Department();
        d.setPid(req.getPid());
        d.setName(req.getName());
        d.setIcon(req.getIcon());
        d.setRoot(req.getRoot());
        d.setCode(req.getCode());
        d.setSort(req.getSort());
        Department saved = departmentRepository.save(d);
        return toResponse(saved);
    }

    @Transactional
    public Optional<DepartmentResponse> update(String id, DepartmentUpdateRequest req) {
        return departmentRepository.findById(id).map(d -> {
            d.setPid(req.getPid());
            d.setName(req.getName());
            d.setIcon(req.getIcon());
            d.setRoot(req.getRoot());
            d.setCode(req.getCode());
            d.setSort(req.getSort());
            Department saved = departmentRepository.save(d);
            return toResponse(saved);
        });
    }

    @Transactional
    public void delete(String id) {
        departmentRepository.deleteById(id);
    }

    private DepartmentResponse toResponse(Department d) {
        DepartmentResponse r = new DepartmentResponse();
        r.setId(d.getId());
        r.setPid(d.getPid());
        r.setName(d.getName());
        r.setIcon(d.getIcon());
        r.setRoot(d.getRoot());
        r.setCode(d.getCode());
        r.setSort(d.getSort());
        return r;
    }
}