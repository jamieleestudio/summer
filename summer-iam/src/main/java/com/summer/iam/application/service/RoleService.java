package com.summer.iam.application.service;

import com.summer.iam.application.command.RoleCreateCommand;
import com.summer.iam.application.command.RoleUpdateCommand;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface RoleService {
    RoleDetailResponse create(RoleCreateCommand cmd);
    Optional<RoleDetailResponse> update(String id, RoleUpdateCommand cmd);
    void delete(String id);
    Optional<RoleDetailResponse> setEnabled(String id, Boolean enabled);
    Optional<RoleDetailResponse> enable(String id);
    Optional<RoleDetailResponse> disable(String id);
    Page<RoleResponse> findAll(Pageable pageable);
    Optional<RoleDetailResponse> findById(String id);
    List<PermissionResponse> listPermissions(String roleId);
}
