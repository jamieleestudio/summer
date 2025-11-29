package com.summer.iam.infrastructure.persistence.jpa;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.repository.PermissionRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PermissionRepositoryJpa extends JpaRepository<Permission, String>, PermissionRepository {

    List<Permission> findByType(Permission.Type type);

    Page<Permission> findByType(Permission.Type type, Pageable pageable);

    default List<Permission> findByIds(List<String> permissionIds) {
        return findAllById(permissionIds);
    }


}
