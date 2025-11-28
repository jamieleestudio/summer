package com.summer.iam.application.service;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.model.Role;
import com.summer.iam.domain.repository.RoleRepository;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class RoleQueryService {
    private final RoleRepository roleRepository;

    public RoleQueryService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Page<RoleResponse> findAll(Pageable pageable) {
        return roleRepository.findAll(pageable).map(this::toResponse);
    }

    public List<PermissionResponse> listPermissions(String roleId) {
        return roleRepository.findById(roleId)
                .map(Role::getPermissions)
                .orElse(List.of())
                .stream()
                .map(this::toPermissionResponse)
                .collect(Collectors.toList());
    }

    private RoleResponse toResponse(Role r) {
        RoleResponse resp = new RoleResponse();
        resp.setId(r.getId());
        resp.setName(r.getName());
        resp.setDescription(r.getDescription());
        resp.setPermissionScope(r.getPermissionScope());
        resp.setSort(r.getSort());
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
