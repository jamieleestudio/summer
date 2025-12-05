package com.summer.iam.application.service;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.PermissionRepository;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.interfaces.rest.dto.role.RoleCreateRequest;
import com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleUpdateRequest;
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
public class RoleCommandService {
    private final RoleRepository roleRepository;
    private final PermissionRepository permissionRepository;

    public RoleCommandService(RoleRepository roleRepository, PermissionRepository permissionRepository) {
        this.roleRepository = roleRepository;
        this.permissionRepository = permissionRepository;
    }

    @Transactional
    public RoleDetailResponse create(RoleCreateRequest req) {
        // 检查角色名称是否已存在
        if (roleRepository.findByName(req.getName()).isPresent()) {
            throw new IllegalArgumentException("角色名称已存在: " + req.getName());
        }

        Role role = new Role();
        role.setName(req.getName());
        role.setDescription(req.getDescription());
        role.setPermissionScope(req.getPermissionScope());
        role.setSort(req.getSort());
        // 如果没有指定enabled，则使用默认值true
        role.setEnabled(req.getEnabled() != null ? req.getEnabled() : true);

        // 设置权限关联
        if (req.getPermissions() != null && !req.getPermissions().isEmpty()) {
            List<Permission> permissions = permissionRepository.findByIds(req.getPermissions());
            role.setPermissions(permissions);
        }

        Role saved = roleRepository.save(role);
        return toDetailResponse(saved);
    }

    @Transactional
    public Optional<RoleDetailResponse> update(String id, RoleUpdateRequest req) {
        return roleRepository.findById(id).map(role -> {
            // 检查角色名称是否已存在（排除当前角色）
            roleRepository.findByName(req.getName())
                    .filter(existing -> !existing.getId().equals(id))
                    .ifPresent(existing -> {
                        throw new IllegalArgumentException("角色名称已存在: " + req.getName());
                    });

            role.setName(req.getName());
            role.setDescription(req.getDescription());
            role.setPermissionScope(req.getPermissionScope());
            role.setSort(req.getSort());
            // 如果请求中提供了enabled字段，则更新
            if (req.getEnabled() != null) {
                role.setEnabled(req.getEnabled());
            }

            // 更新权限关联
            if (req.getPermissions() != null && !req.getPermissions().isEmpty()) {
                List<Permission> permissions = permissionRepository.findByIds(req.getPermissions());
                role.setPermissions(permissions);
            }else{
                role.setPermissions(new ArrayList<>());
            }

            Role saved = roleRepository.save(role);
            return toDetailResponse(saved);
        });
    }

    @Transactional
    public void delete(String id) {
        roleRepository.deleteById(id);
    }
    
    @Transactional
    public Optional<RoleDetailResponse> setEnabled(String id, Boolean enabled) {
        return roleRepository.findById(id).map(role -> {
            role.setEnabled(enabled);
            Role saved = roleRepository.save(role);
            return toDetailResponse(saved);
        });
    }
    
    // 保留原有方法以确保兼容性
    @Transactional
    public Optional<RoleDetailResponse> enable(String id) {
        return setEnabled(id, true);
    }
    
    @Transactional
    public Optional<RoleDetailResponse> disable(String id) {
        return setEnabled(id, false);
    }

    private RoleDetailResponse toDetailResponse(Role r) {
        RoleDetailResponse resp = new RoleDetailResponse();
        resp.setId(r.getId());
        resp.setName(r.getName());
        resp.setDescription(r.getDescription());
        resp.setPermissionScope(r.getPermissionScope());
        resp.setSort(r.getSort());
        resp.setEnabled(r.getEnabled());
        if (r.getPermissions() != null) {
            List<String> permissionIds = r.getPermissions().stream()
                    .map(Permission::getId)
                    .toList();
            resp.setPermissions(permissionIds);
        }
        return resp;
    }
    
    private RoleResponse toResponse(Role r) {
        RoleResponse resp = new RoleResponse();
        resp.setId(r.getId());
        resp.setName(r.getName());
        resp.setDescription(r.getDescription());
        resp.setPermissionScope(r.getPermissionScope());
        resp.setSort(r.getSort());
        resp.setEnabled(r.getEnabled());
        return resp;
    }

    private PermissionResponse toPermissionResponse(Permission p) {
        PermissionResponse r = new PermissionResponse();
        r.setId(p.getId());
        r.setCode(p.getCode());
        r.setType(p.getType().name().toLowerCase());
        r.setName(p.getName());
        r.setDescription(p.getDescription());
        r.setPid(p.getPid());
        return r;
    }

    @Transactional(readOnly = true)
    public Page<RoleResponse> findAll(Pageable pageable) {
        return roleRepository.findAll(pageable).map(this::toResponse);
    }

    @Transactional(readOnly = true)
    public Optional<RoleDetailResponse> findById(String id) {
        return roleRepository.findById(id).map(this::toDetailResponse);
    }

    @Transactional(readOnly = true)
    public List<PermissionResponse> listPermissions(String roleId) {
        return roleRepository.findById(roleId)
                .map(Role::getPermissions)
                .orElse(List.of())
                .stream()
                .map(this::toPermissionResponse)
                .toList();
    }
}
