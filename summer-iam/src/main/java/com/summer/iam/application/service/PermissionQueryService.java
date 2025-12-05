package com.summer.iam.application.service;

import com.summer.iam.domain.model.Permission;
import com.summer.iam.domain.repository.PermissionRepository;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class PermissionQueryService {
    private final PermissionRepository permissionRepository;

    public PermissionQueryService(PermissionRepository permissionRepository) {
        this.permissionRepository = permissionRepository;
    }

    public List<PermissionResponse> findAll() {
        return permissionRepository.findAll().stream().map(this::toResponse).toList();
    }

    public Page<PermissionResponse> listMenus(Pageable pageable) {
        return permissionRepository.findByType(Permission.Type.MENU, pageable).map(this::toResponse);
    }

    private PermissionResponse toResponse(Permission p) {
        PermissionResponse r = new PermissionResponse();
        r.setId(p.getId());
        r.setCode(p.getCode());
        r.setType(p.getType() != null ? p.getType().name().toLowerCase() : null);
        r.setName(p.getName());
        r.setDescription(p.getDescription());
        r.setPid(p.getPid());
        r.setIcon(p.getIcon());
        return r;
    }
}