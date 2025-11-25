package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Permission;

import java.util.List;
import java.util.Optional;

public interface PermissionRepository {
    Optional<Permission> findById(String id);
    Optional<Permission> findByCode(String code);
    List<Permission> findAll();
    Permission save(Permission permission);
    void deleteById(String id);
}
