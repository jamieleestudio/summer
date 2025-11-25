package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.infrastructure.persistence.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SystemRoleRepository extends JpaRepository<RoleEntity, Long> {
}
