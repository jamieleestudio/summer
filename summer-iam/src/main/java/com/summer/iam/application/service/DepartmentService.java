package com.summer.iam.application.service;

import com.summer.iam.application.command.DepartmentCreateCommand;
import com.summer.iam.application.command.DepartmentUpdateCommand;
import com.summer.iam.interfaces.rest.dto.department.DepartmentResponse;

import java.util.List;
import java.util.Optional;

public interface DepartmentService {
    DepartmentResponse create(DepartmentCreateCommand cmd);
    Optional<DepartmentResponse> update(String id, DepartmentUpdateCommand cmd);
    void delete(String id);
    List<DepartmentResponse> findAll();
    Optional<DepartmentResponse> findById(String id);
}
