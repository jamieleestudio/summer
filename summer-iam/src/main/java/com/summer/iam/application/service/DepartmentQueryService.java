package com.summer.iam.application.service;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.interfaces.rest.dto.department.DepartmentResponse;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DepartmentQueryService {
    private final DepartmentRepository departmentRepository;

    public DepartmentQueryService(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public List<DepartmentResponse> findAll() {
        return departmentRepository.findAll().stream().map(this::toResponse).toList();
    }

    public Optional<DepartmentResponse> findById(String id) {
        return departmentRepository.findById(id).map(this::toResponse);
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