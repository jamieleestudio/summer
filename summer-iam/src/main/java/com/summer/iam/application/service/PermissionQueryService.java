package com.summer.iam.application.service;

import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface PermissionQueryService {
    List<PermissionResponse> findAll();
    Page<PermissionResponse> listMenus(Pageable pageable);
}
