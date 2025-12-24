package com.summer.iam.application.service.impl;

import com.summer.iam.application.service.PermissionQueryService;
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
public class PermissionQueryServiceImpl implements PermissionQueryService {
    private final PermissionRepository permissionRepository;

    public PermissionQueryServiceImpl(PermissionRepository permissionRepository) {
        this.permissionRepository = permissionRepository;
    }

    @Override
    public List<PermissionResponse> findAll() {
        return permissionRepository.findAll().stream().map(PermissionResponse::from).toList();
    }

    @Override
    public Page<PermissionResponse> listMenus(Pageable pageable) {
        return permissionRepository.findByType(Permission.Type.MENU, pageable).map(PermissionResponse::from);
    }

}
