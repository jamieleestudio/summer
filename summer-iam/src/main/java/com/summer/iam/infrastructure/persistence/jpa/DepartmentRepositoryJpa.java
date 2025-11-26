package com.summer.iam.infrastructure.persistence.jpa;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.repository.DepartmentRepository;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepositoryJpa extends JpaRepository<Department, String>, DepartmentRepository {

}
