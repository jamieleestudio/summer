package com.summer.iam.infrastructure.persistence.adapter;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.infrastructure.persistence.entity.RoleEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemRoleRepository;
import com.summer.iam.infrastructure.persistence.entity.RolePermissionEntity;
import com.summer.iam.infrastructure.persistence.repository.SystemRolePermissionRepository;
import com.summer.iam.infrastructure.persistence.repository.SystemPermissionRepository;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Repository
public class RoleRepositoryJpaAdapter implements RoleRepository {

    private final SystemRoleRepository systemRoleRepository;
    private final SystemRolePermissionRepository rolePermissionRepository;
    private final SystemPermissionRepository permissionRepository;

    public RoleRepositoryJpaAdapter(SystemRoleRepository systemRoleRepository,
                                    SystemRolePermissionRepository rolePermissionRepository,
                                    SystemPermissionRepository permissionRepository) {
        this.systemRoleRepository = systemRoleRepository;
        this.rolePermissionRepository = rolePermissionRepository;
        this.permissionRepository = permissionRepository;
    }

    private Role toDomain(RoleEntity entity) {
        if (entity == null) return null;
        Role role = new Role();
        role.setId(entity.getId() == null ? null : String.valueOf(entity.getId()));
        role.setName(entity.getName());
        role.setDescription(entity.getDescription());
        role.setPermissionScope(entity.getPermissionScope());
        role.setSort(entity.getSort());
        java.util.List<RolePermissionEntity> links = rolePermissionRepository.findAllByRoleId(entity.getId());
        LinkedHashSet<Permission> set = new LinkedHashSet<>();
        for (RolePermissionEntity link : links) {
            permissionRepository.findById(link.getPermissionId()).ifPresent(pe -> {
                Permission dp = new Permission();
                dp.setId(pe.getId() == null ? null : String.valueOf(pe.getId()));
                dp.setCode(pe.getCode());
                dp.setName(pe.getName());
                dp.setDescription(pe.getDescription());
                set.add(dp);
            });
        }
        role.setPermissions(set);
        return role;
    }

    private RoleEntity toEntity(Role role) {
        if (role == null) return null;
        RoleEntity entity = new RoleEntity();
        entity.setName(role.getName());
        entity.setDescription(role.getDescription());
        entity.setPermissionScope(role.getPermissionScope());
        entity.setSort(role.getSort());
        return entity;
    }

    @Override
    public Optional<Role> findById(String id) {
        try {
            Long longId = Long.parseLong(id);
            return systemRoleRepository.findById(longId).map(this::toDomain);
        } catch (NumberFormatException e) {
            return Optional.empty();
        }
    }

    @Override
    public Optional<Role> findByName(String name) {
        return systemRoleRepository.findAll().stream()
                .filter(r -> name != null && name.equals(r.getName()))
                .findFirst()
                .map(this::toDomain);
    }

    @Override
    public List<Role> findAll() {
        return systemRoleRepository.findAll().stream().map(this::toDomain).collect(Collectors.toList());
    }

    @Override
    public Role save(Role role) {
        RoleEntity saved = systemRoleRepository.save(toEntity(role));
        return toDomain(saved);
    }

    @Override
    public void deleteById(String id) {
        try {
            systemRoleRepository.deleteById(Long.parseLong(id));
        } catch (NumberFormatException ignored) { }
    }
}
