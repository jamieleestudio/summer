package com.summer.iam.application.service;

import com.summer.iam.application.command.RoleCreateCommand;
import com.summer.iam.application.command.RoleUpdateCommand;
import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.PermissionRepository;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleResponse;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RoleService {
    private final RoleRepository roleRepository;
    private final PermissionRepository permissionRepository;

    public RoleService(RoleRepository roleRepository, PermissionRepository permissionRepository) {
        this.roleRepository = roleRepository;
        this.permissionRepository = permissionRepository;
    }

    @Transactional
    public RoleDetailResponse create(RoleCreateCommand cmd) {
        if (roleRepository.findByName(cmd.getName()).isPresent()) {
            throw new IllegalArgumentException("角色名称已存在: " + cmd.getName());
        }
        Role role = new Role();
        role.setName(cmd.getName());
        role.setDescription(cmd.getDescription());
        role.setPermissionScope(cmd.getPermissionScope());
        role.setSort(cmd.getSort());
        role.setEnabled(cmd.getEnabled() != null ? cmd.getEnabled() : true);
        if (cmd.getPermissions() != null && !cmd.getPermissions().isEmpty()) {
            List<Permission> permissions = permissionRepository.findByIdIn(cmd.getPermissions());
            role.setPermissions(permissions);
        }
        Role saved = roleRepository.save(role);
        return com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse.from(saved);
    }

    @Transactional
    public Optional<RoleDetailResponse> update(String id, RoleUpdateCommand cmd) {
        return roleRepository.findById(id).map(role -> {
            roleRepository.findByName(cmd.getName())
                    .filter(existing -> !existing.getId().equals(id))
                    .ifPresent(existing -> { throw new IllegalArgumentException("角色名称已存在: " + cmd.getName()); });
            role.setName(cmd.getName());
            role.setDescription(cmd.getDescription());
            role.setPermissionScope(cmd.getPermissionScope());
            role.setSort(cmd.getSort());
            if (cmd.getEnabled() != null) { role.setEnabled(cmd.getEnabled()); }
            if (cmd.getPermissions() != null && !cmd.getPermissions().isEmpty()) {
                List<Permission> permissions = permissionRepository.findByIdIn(cmd.getPermissions());
                role.setPermissions(permissions);
            } else {
                role.setPermissions(new ArrayList<>());
            }
            Role saved = roleRepository.save(role);
            return com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse.from(saved);
        });
    }

    @Transactional
    public void delete(String id) { roleRepository.deleteById(id); }

    @Transactional
    public Optional<RoleDetailResponse> setEnabled(String id, Boolean enabled) {
        return roleRepository.findById(id).map(role -> {
            role.setEnabled(enabled);
            Role saved = roleRepository.save(role);
            return com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse.from(saved);
        });
    }

    @Transactional
    public Optional<RoleDetailResponse> enable(String id) { return setEnabled(id, true); }

    @Transactional
    public Optional<RoleDetailResponse> disable(String id) { return setEnabled(id, false); }

    

    @Transactional(readOnly = true)
    public Page<RoleResponse> findAll(Pageable pageable) { return roleRepository.findAll(pageable).map(com.summer.iam.interfaces.rest.dto.role.RoleResponse::from); }

    @Transactional(readOnly = true)
    public Optional<RoleDetailResponse> findById(String id) { return roleRepository.findById(id).map(com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse::from); }

    @Transactional(readOnly = true)
    public List<PermissionResponse> listPermissions(String roleId) {
        return roleRepository.findById(roleId)
                .map(Role::getPermissions)
                .orElse(List.of())
                .stream()
                .map(com.summer.iam.interfaces.rest.dto.permission.PermissionResponse::from)
                .toList();
    }
}
