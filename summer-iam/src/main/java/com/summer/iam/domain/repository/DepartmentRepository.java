package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Department;

import java.util.List;
import java.util.Optional;

public interface DepartmentRepository {

    List<Department> findAll();

    Optional<Department> findById(String id);

    Department save(Department department);

    void deleteById(String id);
}
