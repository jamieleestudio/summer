package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.service.RoleQueryService;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/roles")
@Tag(name = "Roles")
public class RoleController {

    private final RoleQueryService roleQueryService;

    public RoleController(RoleQueryService roleQueryService) {
        this.roleQueryService = roleQueryService;
    }

    @GetMapping
    @Operation(summary = "List roles (paginated)")
    public Page<RoleResponse> list(Pageable pageable) {
        return roleQueryService.findAll(pageable);
    }

    @GetMapping("/{id}/permissions")
    @Operation(summary = "List permissions of role")
    public List<PermissionResponse> listPermissions(@PathVariable("id") String id) {
        return roleQueryService.listPermissions(id);
    }

    
}
