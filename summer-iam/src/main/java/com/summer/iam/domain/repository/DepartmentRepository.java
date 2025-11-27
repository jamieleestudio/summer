package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Department;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface DepartmentRepository {

    List<Department> findAll();

    Page<Department> findAll(Pageable pageable);

    Optional<Department> findById(String id);

    Department save(Department department);

    void deleteById(String id);
}
