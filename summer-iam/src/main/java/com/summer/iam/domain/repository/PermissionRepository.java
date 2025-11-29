package com.summer.iam.domain.repository;

import com.summer.iam.domain.model.Permission;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

public interface PermissionRepository {

    List<Permission> findAll();

    List<Permission> findByType(Permission.Type type);

    Page<Permission> findByType(Permission.Type type, Pageable pageable);

//    Optional<Permission> findById(String id);

    Permission save(Permission permission);

    void deleteById(String id);

    List<Permission> findByIds(List<String> permissionIds);
}
