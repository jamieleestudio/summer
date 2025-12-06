package com.summer.iam.interfaces.rest.controller;

import com.summer.iam.application.command.RoleCreateCommand;
import com.summer.iam.application.command.RoleUpdateCommand;
import com.summer.iam.application.service.RoleService;
import com.summer.iam.interfaces.rest.assembler.RoleAssembler;
import com.summer.iam.interfaces.rest.dto.permission.PermissionResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleCreateRequest;
import com.summer.iam.interfaces.rest.dto.role.RoleDetailResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleEnabledRequest;
import com.summer.iam.interfaces.rest.dto.role.RoleResponse;
import com.summer.iam.interfaces.rest.dto.role.RoleUpdateRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/roles")
@Tag(name = "Roles")
public class RoleController {

    private final RoleService roleService;

    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    @GetMapping
    @Operation(summary = "List roles (paginated)")
    public Page<RoleResponse> list(Pageable pageable) {
        return roleService.findAll(pageable);
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get role detail with permissions")
    public RoleDetailResponse getById(@PathVariable("id") String id) {
        return roleService.findById(id)
                .orElse(null);
    }

    @GetMapping("/{id}/permissions")
    @Operation(summary = "List permissions of role")
    public List<PermissionResponse> listPermissions(@PathVariable("id") String id) {
        return roleService.listPermissions(id);
    }

    @PostMapping
    @Operation(summary = "Create a new role")
    public RoleDetailResponse create(@Valid @RequestBody RoleCreateRequest request) {
        RoleCreateCommand cmd = RoleAssembler.toCreateCommand(request);
        return roleService.create(cmd);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update role")
    public RoleDetailResponse update(@PathVariable("id") String id, @Valid @RequestBody RoleUpdateRequest request) {
        RoleUpdateCommand cmd = RoleAssembler.toUpdateCommand(request);
        return roleService.update(id, cmd)
                .orElse(null);
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete role")
    public void delete(@PathVariable("id") String id) {
        roleService.delete(id);
    }
    
    @Operation(summary = "设置角色启用状态")
    @PutMapping("/{id}/enabled")
    public RoleDetailResponse setEnabled(@PathVariable("id") String id,
                                       @RequestBody RoleEnabledRequest request) {
        return roleService.setEnabled(id, request.getEnabled()).orElse(null);
    }

}
