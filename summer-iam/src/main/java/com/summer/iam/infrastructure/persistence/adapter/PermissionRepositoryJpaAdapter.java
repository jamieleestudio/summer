package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.repository.PermissionRepository;
import com.summer.iam.infrastructure.persistence.entity.PermissionEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemPermissionRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
public class PermissionRepositoryJpaAdapter implements PermissionRepository {

    private final SystemPermissionRepository systemPermissionRepository;

    public PermissionRepositoryJpaAdapter(SystemPermissionRepository systemPermissionRepository) {
        this.systemPermissionRepository = systemPermissionRepository;
    }

    private Permission toDomain(PermissionEntity entity) {
        if (entity == null) return null;
        Permission permission = new Permission();
        permission.setId(entity.getId() == null ? null : String.valueOf(entity.getId()));
        permission.setCode(entity.getCode());
        permission.setName(entity.getName());
        permission.setDescription(entity.getDescription());
        return permission;
    }

    private PermissionEntity toEntity(Permission permission) {
        if (permission == null) return null;
        PermissionEntity entity = new PermissionEntity();
        entity.setCode(permission.getCode());
        entity.setName(permission.getName());
        entity.setDescription(permission.getDescription());
        return entity;
    }

    @Override
    public Optional<Permission> findById(String id) {
        try {
            Long longId = Long.parseLong(id);
            return systemPermissionRepository.findById(longId).map(this::toDomain);
        } catch (NumberFormatException e) {
            return Optional.empty();
        }
    }

    @Override
    public Optional<Permission> findByCode(String code) {
        return systemPermissionRepository.findByCode(code).map(this::toDomain);
    }

    @Override
    public List<Permission> findAll() {
        return systemPermissionRepository.findAll().stream().map(this::toDomain).collect(Collectors.toList());
    }

    @Override
    public Permission save(Permission permission) {
        return toDomain(systemPermissionRepository.save(toEntity(permission)));
    }

    @Override
    public void deleteById(String id) {
        try {
            systemPermissionRepository.deleteById(Long.parseLong(id));
        } catch (NumberFormatException ignored) { }
    }
}
