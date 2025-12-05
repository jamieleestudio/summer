package com.summer.iam.application.service;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional(readOnly = true)
public class RoleQueryService {
    private final RoleRepository roleRepository;

    public RoleQueryService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Page<RoleResponse> findAll(Pageable pageable) {
        // 默认只查询启用的角色
        return roleRepository.findAll(pageable).map(this::toResponse);
    }

    public Optional<RoleDetailResponse> findById(String id) {
        return roleRepository.findById(id).map(this::toDetailResponse);
    }

    public List<PermissionResponse> listPermissions(String roleId) {
        return roleRepository.findById(roleId)
                .map(Role::getPermissions)
                .orElse(List.of())
                .stream()
                .map(this::toPermissionResponse)
                .collect(Collectors.toList());
    }

    // 角色列表响应（不包含权限信息，提高查询效率）
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
    
    // 角色详情响应（包含权限ID列表）
    private RoleDetailResponse toDetailResponse(Role r) {
        RoleDetailResponse resp = new RoleDetailResponse();
        resp.setId(r.getId());
        resp.setName(r.getName());
        resp.setDescription(r.getDescription());
        resp.setPermissionScope(r.getPermissionScope());
        resp.setSort(r.getSort());
        resp.setEnabled(r.getEnabled());
        // 设置角色的权限ID列表
        if (r.getPermissions() != null) {
            List<String> permissionIds = r.getPermissions().stream()
                    .map(Permission::getId)
                    .collect(Collectors.toList());
            resp.setPermissions(permissionIds);
        }
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
}
