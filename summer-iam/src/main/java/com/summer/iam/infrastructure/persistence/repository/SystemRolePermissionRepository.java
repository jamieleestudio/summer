package com.summer.iam.infrastructure.persistence.repository;

import com.summer.iam.infrastructure.persistence.entity.RolePermissionEntity;
import com.summer.iam.infrastructure.persistence.entity.RolePermissionId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SystemRolePermissionRepository extends JpaRepository<RolePermissionEntity, RolePermissionId> {
    List<RolePermissionEntity> findAllByRoleId(Long roleId);
}
