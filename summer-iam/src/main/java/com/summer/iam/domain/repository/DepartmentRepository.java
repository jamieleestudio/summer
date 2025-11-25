package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Department;

import java.util.List;
import java.util.Optional;

public interface DepartmentRepository {
    Optional<Department> findById(String id);
    List<Department> findAll();
    Department save(Department department);
    void deleteById(String id);
}
