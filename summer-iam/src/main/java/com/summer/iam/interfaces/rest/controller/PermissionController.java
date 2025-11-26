package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.service.PermissionQueryService;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/permissions")
@Tag(name = "Permissions")
public class PermissionController {

    private final PermissionQueryService permissionQueryService;

    public PermissionController(PermissionQueryService permissionQueryService) {
        this.permissionQueryService = permissionQueryService;
    }

    @GetMapping("/menus")
    @Operation(summary = "List menu permissions (paginated)")
    public Page<PermissionResponse> listMenus(Pageable pageable) {
        return permissionQueryService.listMenus(pageable);
    }
}
