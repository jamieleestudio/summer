package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.infrastructure.persistence.entity.PermissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SystemPermissionRepository extends JpaRepository<PermissionEntity, Long> {
    Optional<PermissionEntity> findByCode(String code);
}
