package com.summer.iam.infrastructure.persistence.jpa;

import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.RoleRepository;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepositoryJpa extends JpaRepository<Role, String>, RoleRepository {
}
